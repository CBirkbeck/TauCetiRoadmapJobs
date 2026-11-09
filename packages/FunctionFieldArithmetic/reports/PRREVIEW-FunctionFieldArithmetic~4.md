# Review of FunctionFieldArithmetic (pull request #1474 at 76ed4c1)

**Verdict:** needs changes

This is a full review: the folder changed by 198 lines since b6f153b. All four findings of the previous review are repaired (see the section below). The gate passes on this head and the dependency check reports no problem.

There are five new findings, one P2 and four P3:

- The pinned Tau Ceti now contains the local Artin map in every characteristic. Two §4.2 headlines that the module docstring calls "not statable" are therefore statable, and they are missing from `Suggested.lean`.
- One §4.2 target restates the pinned conductor API.
- One Lean theorem is a statement about free variables.
- Layer 7 lists a dependency that none of its targets uses.
- The LubinTate supplier is cited through a link into the job board, using design-stage slugs.

## R01 (P2) — §4.2 headlines that are statable at the pins are missing from `Suggested.lean`

**Location.** `TauCetiRoadmap/FunctionFieldArithmetic/Suggested.lean`, module docstring lines 17–19: "Lubin–Tate torsion (§4.1), local Kronecker–Weber and Artin injectivity (§4.2) need formal-module coefficient actions, evaluated adic points, the Lubin–Tate tower and local reciprocity map". README lines 1132–1139 state the targets localAbelianExistence_all and injective_artinMap_all.

**Claim.**

- **Artin injectivity.** The docstring names Artin injectivity among the headlines that cannot be stated, because the local reciprocity map is missing. The map exists at the pinned Tau Ceti, so the statement takes one line.
- **Local existence.** The headline is "local abelian existence in equal characteristic" (Summary, lines 21–22; README line 1134). The file states it only for the model `k((T))`. The general statement uses the same pinned carriers and is also statable.

**Witness.** The pinned Tau Ceti, at `TauCeti/NumberTheory/ClassFieldTheory/`, provides the carriers:

- `Local/ArtinMap.lean:114` defines `TauCeti.ClassFieldTheory.artinMap K : Kˣ →* G_K^ab` for every `IsNonarchimedeanLocalField K`.
- `LocalExistence/ArtinMap.lean:113` proves `injective_artinMap` only under `[CharZero K]`.
- `LocalExistence/Existence.lean:159` proves `localAbelianExistence` only under `[CharZero K]`.

The module docstring of `LocalExistence/ArtinMap.lean` (lines 32–33) states that neither result is claimed in characteristic `p`. These are exactly the cases §4.2 owns.

**Repair.**

1. Add the two theorems below to `Suggested.lean` under `## Layer 4`. Add the imports `TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap` and `TauCeti.NumberTheory.ClassFieldTheory.LocalExistence.NormSubgroup`.
2. In README lines 1133–1136, backtick `localAbelianExistence_all` and `injective_artinMap_all`.
3. Under *From Tau Ceti*, list `TauCeti.ClassFieldTheory.artinMap`, `artinMap_restrict`, `localNormSubgroup` and `OpenNormalSubgroup.IsAbelianClassFieldLayer`, together with the characteristic-zero `localAbelianExistence` and `injective_artinMap`, each with its file.
4. In the docstring:
   - delete "Artin injectivity" and "local reciprocity map";
   - for §§3.2 and 4.3–4.4, name what is actually missing: the reduced representative and the Witt-vector extension field. Local reciprocity is at the pin.

`localAbelianExistence_laurentSeries` may stay.

```lean
/-- **Injectivity of the local Artin map in equal characteristic** (README 4.2). -/
theorem injective_artinMap_all (p : ℕ) [Fact p.Prime] (K : Type) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharP K p] :
    Function.Injective (TauCeti.ClassFieldTheory.artinMap K) := by
  sorry

/-- **Local abelian existence in equal characteristic** (README 4.2): every open subgroup of
finite index of `Kˣ` is the norm group of a finite abelian extension. -/
theorem localAbelianExistence_all (p : ℕ) [Fact p.Prime] (K : Type) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharP K p]
    (N : Subgroup Kˣ) (hN : IsOpen (N : Set Kˣ)) [N.FiniteIndex] :
    ∃ V : OpenNormalSubgroup (AbsoluteGaloisGroup K),
      V.IsAbelianClassFieldLayer ∧ TauCeti.ClassFieldTheory.localNormSubgroup K V = N := by
  sorry
```

**Test.**

- Inserted into a scratch copy of the file, both theorems elaborate at the pins. The copy gives 14 warnings, all `sorry`, and no error.
- Dropping `[CharP K p]` also elaborates. That version covers every local field, and its characteristic-zero case is the pinned theorem.
- On `K = 𝔽₂((T))`, take `N = ⟨T⟩·U²`, which has index 2 and is open. The fixed field of the abelian layer `V` is `K(℘⁻¹T⁻¹)` (table row R01-b).
- `hN` cannot be dropped in characteristic `p`. The quotient `U¹/(U¹)²` is infinite-dimensional over `𝔽₂`, so `Kˣ` has non-open subgroups of index 2, and those are not norm groups.

## R02 (P3) — `conductor_existence_all` restates the pinned conductor API

**Location.** README lines 1142–1143: "Prove conductor_existence_all: the norm subgroup of an abelian extension of conductor exponent `n` contains `U^(n)` and not `U^(n−1)` (for `n ≥ 1`), in every characteristic."

**Claim.** This is the defining property of Tau Ceti's conductor exponent, which the pin proves in every characteristic. Combined with existence (R01), the conductor of the class field of an open subgroup follows by rewriting. Nothing is left for a separate target.

**Witness.** `TauCeti/NumberTheory/ClassFieldTheory/Local/Conductor/Basic.lean` covers every finite separable extension of a nonarchimedean local field:

- line 89: `conductorExponent` is defined as the least `n` with `U(K,n) ≤ normGroup K L`;
- line 107: the minimum is attained;
- line 113: `conductorExponent_le_iff`.

The characteristic-zero class-field form at `LocalExistence/Conductor.lean:66` is proved by `rw [conductorExponent_le_iff, ← localNormSubgroup_def, localClassField_normSubgroup]`.

**Repair.** Delete conductor_existence_all from §4.2. Cite `TauCeti.ClassFieldTheory.conductorExponent_le_iff` and `unitFiltration_conductorExponent_le_normGroup` (`Local/Conductor/Basic.lean`) under *From Tau Ceti*.

**Test.** Take `L = K(℘⁻¹T⁻¹)` over `𝔽₂((T))`, so `c(L/K) = 2`. "Contains `U²`, not `U¹`" is attainment together with `conductorExponent_le_iff` at `n = 1`. Table row R02.

## R03 (P3) — `IsLPolynomialData.unique` is a theorem about free variables

**Location.** `Suggested.lean` lines 264–266: "theorem IsLPolynomialData.unique {q g : ℕ} {N : ℕ → ℤ} {P P' : Polynomial ℤ} (h : IsLPolynomialData q g N P) (h' : …) : P = P'".

**Claim.** The statement mentions no function field, zeta series or genus. It is polynomial algebra on its hypotheses. Under the file rules it is not a headline. The headline "the first `g` counts determine `L_F`" can be stated on the actual carriers.

**Witness.** The elaborated signature binds only `q g N P P'` (scratch `#check @`).

**Repair.** Replace `IsLPolynomialData.unique` and `lPolynomial_isLPolynomialData` with the theorem below. Rename them in README §5.6 (lines 1923–1925). The README keeps the algebraic uniqueness lemma as an unbackticked target.

```lean
theorem isLPolynomialData_iff_eq_lPolynomial {k F : Type*} [Field k] [Finite k] [Field F]
    [Algebra k F] (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F) (P : Polynomial ℤ)
    (hP : zeta k F * ((1 - PowerSeries.X) *
      (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) = (P : PowerSeries ℤ))
    (P' : Polynomial ℤ) :
    IsLPolynomialData (Nat.card k) (genus k F) (fun r => pointCount k F r) P' ↔ P' = P := by
  sorry
```

**Test.** The theorem elaborates at the pins (scratch copy). On `E : y² = x³+x+1` over `𝔽₅` the right side is `P = 1+3T+5T²`. With `P′ = 1+2T+5T²`, the predicate fails because `a₁ = 9−5−1 = 3 ≠ 2`. Table row R03.

## R04 (P3) — Layer 7 lists EtaleCohomologyFoundations §0.11, which none of its targets uses

**Location.** README line 3112, the Layer 7 *Dependencies*: "…SchemeAndStackFoundations §§2.11, 3.3 and 3.6; EtaleCohomologyFoundations §0.11."

**Claim.** No `*Needs:*` line in Layer 7 (lines 2499–3113) names this section. The supplier contract (lines 421–426) lists only §§F.2.5, F.3 and F.10.2–F.10.3. The listed edge is phantom.

**Witness.** On main, EtaleCohomologyFoundations §0.11 is "Algebraic smooth trace and curve duality" (its README line 1157). Layer 7 takes curve duality from SchemeAndStackFoundations §3.3 (README line 3030).

**Repair.** Delete "EtaleCohomologyFoundations §0.11" from line 3112. If some target does use it, add it instead to that target's `*Needs:*` line and to the supplier contract.

**Test.** After the deletion, every Layer 7 dependency appears in some Layer 7 `*Needs:*` line.

## R05 (P3) — The LubinTate supplier is cited through a job-board link, by design-stage slugs

**Location.** README lines 312–315, "[LubinTateFormalModulesAndQuasiCanonicalLifts, LT.0–LT.2](https://github.com/TauCetiProject/TauCetiRoadmapJobs/blob/1842229…/packages/…/design/README.md#…)". The targets are cited as "*formal-hom*", "*adic-points*" and "*lt-character*" at lines 123–126, 317–330, 1047–1051 and 1101–1102.

**Claim.** A design file in the job repository is a process artifact, not a roadmap section, and no roadmap on main links into that repository. The supplier has moved on since that design:

- its package README numbers these as §§0.1–0.2, 1.1–1.4 and 2.1–2.6;
- it takes formal-group homomorphisms ("formal-hom") from BordismFormalGroups §F1, which is on main.

The slugs will therefore not resolve once the supplier is published.

**Witness.** The board package `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` (head 43c8917):

- §0.1 (line 292) uses "endomorphisms of `F` (in the sense of BordismFormalGroups §F1)";
- line 1854 records this roadmap's §4.1 as using its "Layers 0–2".

**Repair.** Drop the URL. Cite "LubinTateFormalModulesAndQuasiCanonicalLifts §§0.1–0.2 (formal modules, adic points), §§1.1–1.4 (construction) and §§2.1–2.5 (torsion, character, reciprocity comparison)". Add BordismFormalGroups §F1 for formal-group homomorphisms. Apply this at every place listed above.

**Test.** BordismFormalGroups §F1 is at its main README line 46 and covers morphisms and isomorphisms of native `FormalGroup`s. Both suppliers precede this roadmap; the order file has LubinTate at line 343 and this roadmap at line 354.

## Previous findings

| Previous | Status at 76ed4c1 | Passage |
| --- | --- | --- |
| R01 (P2): LocalFieldsRamification Layer 3, which #617 drops | Repaired | No citation of that layer remains (grep). Lines 237–252 cite the five Tau Ceti declarations with their files. §4.4 *Needs* (lines 1314–1316) cites `map_restrictNormalHom_upperRamificationGroup` |
| R02 (P3): unit-filtration reciprocity cited from open revisions only | Repaired (fallback) | Lines 1145–1162 derive it from ClassFieldTheory Layer 6 (kernel = norm group, main README line 1310), Layer 7 `artinMap_restrict` (main line 1334), the Tau Ceti criterion and the Herbrand quotient theorem. No name from #1411 or #1215 remains |
| R03 (P3): `Nonempty (… ≃+ …)` at length `n` | Repaired | `exists_addEquiv_aswQuotient_characters`, Lean lines 121–134; README lines 883–895 |
| R04 (P3): `Nonempty (… ≃+ …)` at infinite length | Repaired | `exists_addEquiv_aswQuotient_padicCharacters`, Lean lines 141–155 |

## Verified sound

**Scope and gate.** The head is 76ed4c19a1cf85def33316435cbead5951ee8020. The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml. Gate rerun:

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check.**

```text
depcheck: 239 roadmaps, 2320 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every supplier named in a `*Needs:*` line is on main or earlier in the order.

**Lean.**

- `lake env lean` on `Suggested.lean` gives 12 warnings, all `sorry`, and no error.
- `#check @` for all 19 declarations matches the README statements. No section binder is lost: `[CharP F p]` appears in every Witt-vector declaration, and the defs carry their own binders.
- One-tactic probe (`rfl`, `simp`, `simp_all`, `infer_instance`, `trivial`, `norm_num`) on all 12 admitted theorems: none closes. No padding by the probe; R03 concerns the form of the statement.
- The topology of `LaurentSeries k` is the valued one: an `rfl` probe matches `LaurentSeries.instUniformSpace`. So `IsOpen` in `localAbelianExistence_laurentSeries` means T-adically open.
- `ZMod n` is discrete, and `Field.absoluteGaloisGroup` carries its instance topology.

**Pinned declarations opened** (Tau Ceti `TauCeti/`, Mathlib `Mathlib/`):

| File:line | Content and hypotheses |
| --- | --- |
| `NumberTheory/LocalField/RamificationGroup.lean:99`; `Herbrand/Basic.lean:258, 421` | Lower groups; `herbrand`; `upperRamificationGroup` |
| `Herbrand/UpperQuotient.lean:98` | Tower `M/L/K` with `IsGalois K L` and `IsGalois K M`; image of `G^v` is `Gal(L/K)^v`, as the README states |
| `Herbrand/HasseArf/Abelian.lean:50` | `IsAbelianGalois K L`; upper breaks are integers |
| `ClassFieldTheory/Local/Conductor/UpperNumbering.lean:64` | `IsAbelianGalois K M`, `v : ℕ`; `U(K,v) ≤ normGroup K M ↔ G^v = ⊥` |
| `LocalField/UnitFiltration/Basic.lean:104`; `RingTheory/Norm/Units.lean:110` | `U(K,0)` is the image of `𝒪ˣ`; `normGroup` is the range of `normUnits` on `Lˣ`, as the README states |
| `ClassFieldTheory/Local/ArtinMap.lean:114, 132`; `Local/Reciprocity.lean:144` | `artinMap`, `artinMap_restrict`, `ker_localArtinMap` (any characteristic) |
| `ClassFieldTheory/LocalExistence/Existence.lean:159, 176`; `LocalExistence/ArtinMap.lean:113` | Existence and injectivity under `[CharZero K]`; prime-to-`p` existence in any characteristic. Source of R01 |
| `ClassFieldTheory/Local/Conductor/Basic.lean:89, 107, 113`; `LocalExistence/Conductor.lean:66` | Source of R02 |
| `FieldTheory/ArtinSchreier/Basic.lean:170, 186` | Length-one Artin–Schreier: degree `p`, group `ZMod p`. No Witt-length theory, so §3.1 duplicates nothing |
| `FieldTheory/FunctionField/RiemannRoch/ClassNumber.lean:82, 203` | `finite_setOf_isEffective_degree_le`, `classNumber` |
| Mathlib `RingTheory/FormalGroup/Basic.lean:57, 75`; `RingTheory/LaurentSeries.lean:1033` | `FormalGroup`, `FormalGroup.IsComm`, `ratfuncAdicComplRingEquiv` |

All 31 backticked `TauCeti.*` names in the README resolve at the pin. The pinned Tau Ceti has no zeta function, no F. K. Schmidt theorem and no Witt-vector duality.

**Cross-roadmap citations resolved.**

| Citation | Where | Result |
| --- | --- | --- |
| ClassFieldTheory Layers 6–7, scope | main README lines 1220, 1310, 1334, 235–239 | Kernel = norm group; `artinMap_restrict`; Lubin–Tate and `p`-primary existence excluded, as stated |
| ClassFieldTheory revision #1215 | its README lines 179–192 | Cedes `p`-primary existence and injectivity "over every nonarchimedean local field" to this §4.2, which supports R01. Unit-filtration reciprocity is not a target here, so it has a single owner |
| Consumers #1490, #1831 | their READMEs | They cite §§0.1, 0.3, 2.1, 2.2, 4.8, 5.1, 5.8, 6.1–6.4 and §§2–4; all exist |
| SchemeAndStackFoundations §2.11; BordismFormalGroups §F1; EtaleCohomologyFoundations §0.11 | main lines 3656, 46, 1157 | Exist. The last is unused (R04) |
| Owners of §4.2 objects | `roadmaps grep` | No other roadmap states equal-characteristic `p`-primary existence or injectivity |

Ownership was checked against the open pull requests whose files the brief provides, and against the board package LubinTate. `overlaps.md` lists no dropped id and no other pull request changing this roadmap.

**Seeded sample (15 targets).**

| Target | Locator checked | Outcome |
| --- | --- | --- |
| 0.3 | milne lines 4947–5021 (Theorem A.7 and proof, pp. 131–132) | The proof computes the `G_k`-cohomology of `0→k̄ˣ→K̄ˣ→Div→Pic→0` over a quasi-finite field. This supports the comparison as background; the Picard-scheme step is the supplier's |
| 1.1 | hess, Prop. 9, p. 7 | Not verifiable (uncertified). Checked mathematically in the table |
| 3.1 | kw lines 276–279 (Prop. 3.1, p. 6); 280–319 (Thm 3.2, pp. 6–7); 362–399 (Thm 3.4, pp. 8–9) | Match: any field of characteristic `p`; pairing `(g,℘a)↦ga−a`; `r`, `s` as in (ii); `n=∞` with `G^p` |
| 4.4 | kw lines 1074–1084, 1135–1155 (Thm 4.12, pp. 21–22); 1169–1177 (Lemma 4.13, p. 22); 1184–1228 (Prop. 4.14, pp. 22–23) | Match. The clamp correction stands (Source issues) |
| 4.6 | guignard lines 737–786 (§4.7, Prop. 4.8, Lemma 4.9, pp. 1317–1319); conrad_geom lines 41–117 (§2, pp. 1–3) | Match: `α : O_Y → i*L`; relative dimension `N+g−1`; affine over `Pic` after base change; torus and unipotent parts |
| 4.9 | conrad_geom lines 157–179 (Thm 3.2, p. 4) | Supports the cartesian Lang-cover dictionary. The Frobenius translation `[v]−d·a` is derived in the README and checked in the table |
| 5.1 | roquette eq. (4), p. 22; §4.3.3 | Not verifiable (waived). Tau Ceti `ClassNumber.lean:82` opened |
| 5.8 | kosters lines 66–85 (Thm 1.1, Cor. 1.2, p. 2); 92–175 (Lemmas 1.3–1.4, pp. 3–5) | Match. Cor. 1.2 sums over all places in print, but the proof (line 174) counts rational places, as the README says |
| 6.1 | conrad_adelic lines 53–61 (Prop. 2.1, p. 2); 115–118 (Ex. 2.3, p. 3); 281–295 (Thm 3.6, p. 6); bhkt lines 1574–1578 (Prop. 8.1, p. 34) | Match, for any global field |
| 6.2 | yu lines 366–419 (§2.2, pp. 8–9); harder lines 128–157 (§1.1, pp. 252–253); bhkt lines 1579–1590 (§8.1, p. 34) | Match: Yu's `deg = −Σ[κ:𝔽_q]v`; `Ξ` generated by a degree-one idele |
| 6.3 | morris1 lines 534–547 (§5.4, p. 104); sga3 line 240 (XXVI 2.1); borel_tits line 1109 (3.17); bhkt line 1589; ciubotaru_harris lines 380–382 (§3, p. 8); morris1 line 460 (§4.5, p. 102) | Match: filtration with vector-group quotients and linear `P`-action; `ℤ[1/p]`-valued measure |
| 6.4 | morris1 lines 420–443 (§§4.1–4.3, p. 101); 529–531 (§5.3, p. 104); harder lines 229–295 (Thm 1.2.1, Lemma 1.2.2, Cor. 1.2.3, pp. 255–256); bhkt lines 1593–1599 (Prop. 8.2, p. 35) | Match. Harder's quotient is on the right, as the README notes |
| 6.6 | bhkt lines 1613–1638 ((8.1)–(8.3), p. 35) | Match: `S^G_P f(m) = δ_P^{1/2}(m)∫f(mn)dn`, `N(O_v)` of volume one, transitivity |
| 7.2 | fyz lines 344–393 (§2.1, Remark 2.1, pp. 8–9); morris1 lines 1058, 1106 (pp. 118–119); 1608–1623 (p. 134); 2498–2530, 2785–2818 (pp. 160–168); morris2 lines 1300–1306 (Thm 5.5, p. 1145); 2008–2027 (Lemma 6.6, p. 1164) | Match. Rationality on each component |
| 7.5 | fyz lines 605–627 (Lemma 2.7, p. 13); kudla_rapoport lines 1719–1790 (Prop. 10.1, pp. 37–38) | Match: rank `m+2r` interpolation; KR's Weil index is trivial in the unramified unimodular case |

Several page ranges are a page wider than the result itself; each still contains it (kw Thm 3.2 ends on p. 7, bhkt Prop. 8.2 is on p. 35, fyz Lemma 2.7 is on p. 13).

**Adversarial table (44 fresh rows).**

| Statement | Instances | Values computed (both sides) / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_divisor_degree_eq_one` | ℙ¹/𝔽₂; `𝔽₄(t)` over `𝔽₂` | deg[∞]=1. Nonexact constants: every place degree even, image 2ℤ, so `IsIntegrallyClosedIn` is needed | Pass | None |
| `riemannRoch_reducedBasis` | `k(t)`, `x=t`, `D=0`, `r=−1,0,2`; `x=t²` (p=2) | d=(0): bases ∅, {1}, {1,t,t²}, dims 0,1,3. `x=t²`: v=(1,t), d=(0,−1); r=1 gives {1,t²,t}=L(2∞), dim 3 | Pass | None |
| 1.1 two-chart (sample) | `k(t)`, `D=2∞−[0]` | `t k[t] ∩ t²k[1/t]₍₁/ₜ₎` = span(t,t²), dim 2 = deg D+1. Reversed ideals give t⁻¹k[t] ∩ {ord∞≥2} = 0 | Pass | None |
| `witt_additiveHilbert90` | 𝔽₄/𝔽₂, n=1,2 | n=1: ker(1−σ)=𝔽₂; im(1−σ)={a+a²}={0,1}=ker Tr; Tr onto 𝔽₂. n=2: \|ker\|=4; \|im(1−σ)\|=16/4=4=\|ker Tr\| | Pass | None |
| `exists_addEquiv_aswQuotient_characters` | 𝔽₃, n=1; n=0 | Q₁=𝔽₃; y∈𝔽₉, y³−y=1, so Frob(y)−y=1 and e(1)(Frob)=1. The negative pairing gives 2 and is excluded. n=0: both sides trivial | Pass | None |
| `exists_addEquiv_aswQuotient_padicCharacters` | 𝔽₂ | Value ≡1 mod 2ⁿ for all n forces e(1)(Frob)=1; ×3 fails mod 4 | Pass | None |
| 4.4 conductor (sample) | p=3, [T⁻²], 3[T⁻²]; p=2, [T⁻¹]+[T⁻³] | u₁,u₂=3,7; 0,3. AS break 3 gives 4 = 1+max(1,3). Clamp control on β+2[T⁻³], r=1: b=1, G¹=2ℤ₂; unclamped b=0 gives G¹=ℤ₂ | Pass | None |
| Unit-filtration derivation (changed, §4.2) | K_{π,2}/𝔽₃((T)), r=1,2 | Subgroups containing Art(U¹)=C₃ are C₃ and C₆, exactly those containing G¹=C₃. M=K_{π,1}: U¹⊆N(M) ⇔ Gal(M/K)¹=1 (tame). r=2: Art(U²)=1=G² | Pass | None |
| Same, infinite form | LT tower, Q=3 | Image of U¹ is 1+𝔭 (index 2 in Oˣ); finite images 1, 3, 9 = Q^{m−1}, m=1,2,3 | Pass | None |
| 4.6 rigidified Picard (sample) | ℙ¹; m=[0]+[∞], 2[∞], [0]+2[∞], one point, 0 | dims 1,1,2,g,g. Torus rank r−1 = 1,0,1; unipotent N−r = 0,1,1. 𝔾_m, 𝔾_a, 𝔾_m×𝔾_a. g+N−1 at N=0 would give −1 | Pass | None |
| 4.9 Lang coordinates (sample) | 𝔽₅, m=[0]+[∞], t=2; 𝔽₃, m=2[∞], a=[1], place t²+1 | z⁴=2 gives Frob z=2z; geometric ×3. Tr(t−1)=0−2=1; using a in place of 2a gives 2 | Pass | None |
| 5.1 zeta (sample) | ℙ¹/𝔽₃ | A=1,4,13,40; N=4,10,28. 2·13=16+10; 3·40=52+40+28. Euler T²: C(5,2)+3=13 | Pass | None |
| `zeta_eulerProduct`, `zeta_logDeriv` | E/𝔽₅ | A₁=9=N₁; logDeriv r=1: 1·9=N₁·A₀ | Pass | None |
| `effectiveDivisorCount_of_large` | ℙ¹/𝔽₃ n=0,2; E/𝔽₅ n=0,1,2 | 2·1=3¹−1; 2·13=3³−1; 4·9=9·4; 4·54=9·24. n=0 on E (excluded): 4·1 vs 9·0 | Pass | None |
| `zeta_rationality` | E/𝔽₅; ℙ¹ | (1+9T+54T²…)(1−6T+5T²) = 1+3T+5T²: a₂=5=q·a₀, a₁=3=N₁−6, P(1)=9=h. ℙ¹: P=1 | Pass | None |
| `lPolynomial_isLPolynomialData` | g=2, q=2, N=(3,13) | a₁=0, 2a₂=8 so a₂=4; symmetry gives P=1+4T²+4T⁴ | Pass | None |
| R03 control | `unique` vs iff on E/𝔽₅ | `unique` binds q,g,N,P,P′ only. Iff: P′=1+2T+5T² fails (3≠2) | Defect in form | R03 |
| `localAbelianExistence_laurentSeries` | 𝔽₂((T)): H=Kˣ; H=⟨T⟩U² | Degree 1 = index 1; K(℘⁻¹T⁻¹): [T⁻¹,T)=0, [T⁻¹,1+T)=1≠0, index 2 = degree 2 | Pass | None |
| R01-a `injective_artinMap_all` | 𝔽₂((T)), u=1+T | Every odd-index norm group contains U¹, so prime-to-p theory sees Art(1+T)=1. [T⁻¹,1+T)≠0 shows Art(1+T)≠1 | Statable, absent | R01 |
| R01-b `localAbelianExistence_all` | 𝔽₂((T)); ℚ₂ | N=⟨T⟩U², fixed field K(℘⁻¹T⁻¹). A non-open index-2 subgroup is excluded by `hN`. ℚ₂: finite index ⇒ open, matching the pinned char-0 theorem | Statable, absent | R01 |
| R02 `conductor_existence_all` | K(℘⁻¹T⁻¹)/𝔽₂((T)) | c=2; "U²⊆N, U¹⊄N" is attainment plus `conductorExponent_le_iff` at n=1 | Restatement | R02 |
| 5.8 Chebotarev (sample) | 𝔽₉(t)/𝔽₃(t), C=Frob, r=1; C=1, r=1,2 | 4 vs 4, error 0 ≤ √3+1. C=1, r=1: count 0 (congruence). r=2: 6 vs 10, error 4 ≤ 2·3+2=8. Using \|G\| gives 2 ≠ 4 | Pass | None |
| 6.1 adelic points (sample) | 𝔾_m, 𝔾_a over 𝔽₂(t) | Kˣ∩∏Oˣ=𝔽₂ˣ (1 element); K∩∏O=𝔽₂ (2 elements) | Pass | None |
| 6.2 function modules (sample) | GL₁/𝔽_q(t), deg Ξ=3; Ξ=0; E/𝔽₅, deg Ξ=1 | R³; R^ℤ (infinite); R⁹ (h=9) | Pass | None |
| 6.3 constant-term weights (sample) | Heisenberg, p=3 | 3·(1/9)+2·(1/3)=1; uniform 1/5 gives a different integral; R=𝔽₃ cannot divide by 3 | Pass | None |
| 6.4 reduction and support (sample) | 𝔾_m, Ξ deg 1; GL₂ Borel | Rank h (9 on E); without Ξ, infinite rank. ⟨α,H₀(diag(π^a,1))⟩=−a | Pass | None |
| 6.6 Satake (sample) | GL₂, q_v=3 | S*=3X₁+X₂, S=√3(X₁+X₂). Eigenvalue √3(√3+1/√3)=4=q_v+1; mixed normalization gives 2√3 | Pass | None |
| 6.5 algebraic eigenvalues | 3-point translation | X³−1: eigenvalues 1, ζ₃, ζ₃² in ℚ(ζ₃) | Pass | None |
| 7.2 Siegel series (sample) | split n=1, q=3, s=1 | 1 > 1/2; section at m(π,1) is 3^{−3/2} under either normalization; parameter group μ₂ | Pass | None |
| 7.5 Whittaker = density (sample) | split and inert n=1, q=3, s=0,1 | 2/3 = 2·3^{N−1}/3^N; 4/3 = 4·3^{N−1}/3^N. s=1: 1−3^{−3} = 26/27 = Den(⟨1⟩³,⟨1⟩). q^{−s} variant gives 8/9 | Pass | None |
| 7.6 FYZ (headline) | n=1, ℙ¹, split, self-dual | deg 𝓔 = −2 (self-duality with deg ω_{X′} = −4); exponent 2s−1+1 = 2s; χ(det ᾱ)⁻¹ = χ(det α) since χ kills norms | Pass | None |
| 7.1 FYZ Remark 2.1 control | E/𝔽₃, y²=x³+2x²+2x | E(𝔽₃)={O,P}; div(y/x)=Q−P−O; fibre at P is a degree-2 point, so η(P−O)=−1 | Source error stands | None |
| 4.10 classification (headline) | ℙ¹, m=0, B=ℤ/r and ℤ/4 | Hom(ℤ,ℤ/r) ↔ constant covers (r geometric components); θ=2·deg gives 2 components | Pass | None |
| 0.3 Picard points (sample) | ℙ¹/𝔽₃; E/𝔽₅; real conic | h=1; Cl⁰ = E(𝔽₅) of order 9; cokernel ℤ/2 = Br(ℝ) | Pass | None |

## Not verifiable

- hess (Prop. 9, Remark 10, p. 7; Lemma 1, Corollaries 3–4, Theorem 7, Corollary 11): uncertified. §§1.1–1.2 were checked mathematically (rows above).
- roquette (eq. (4), p. 22; §4.3.3): waived. §5.1 was checked mathematically.
- rosen, goss, stichtenoth, sga4half: uncertified, and not in the sample.
- No source was fetched and no missing-reference request was made.

## Source issues

- **Error** in kw at Theorem 4.12, p. 21 (kw line 1136): the source gives the `i`-th component of `φ₁(U_r)` as `p^⌈log_p(r/i)⌉ W(k)`, which has a negative exponent when `i > pr`; it should be `p^max(0,⌈log_p(r/i)⌉) W(k)`; affects a stated result.
- **Error** in kw at Proposition 4.14, p. 23 (kw lines 1189–1194): the source's bound `b` is unclamped, so `x = β+2[T⁻³]`, `p = 2`, `r = 1` gives `b = 0` and makes the whole group inertia; it should clamp at `0`, giving `b = 1`; affects a stated result (the conductor formula is unaffected).
- **Misprint** in kosters at Corollary 1.2, p. 2 (kosters line 84): the source sums over all places of `K`; it should sum over rational places, as the proof via Theorem 1.1 shows (line 174); affects nothing.
- **Error** in fyz at Remark 2.1, pp. 8–9 (fyz lines 383–393): the source says that for odd `n`, cup-product alternation makes `η^n` trivial on `ker(Pic X → Pic X′)`; it fails on `E/𝔽₃ : y²=x³+2x²+2x` with its 2-isogeny, where `η(P−O) = −1`; affects a stated result (existence of an everywhere unramified `χ` for odd `n`).
