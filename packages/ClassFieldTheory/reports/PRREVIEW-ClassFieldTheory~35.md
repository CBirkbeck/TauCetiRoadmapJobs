# Review of ClassFieldTheory (pull request #617 at 39e8628)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ClassFieldTheory/README.md` (1244 lines) and
`TauCetiRoadmap/ClassFieldTheory/Suggested.lean` (636 lines, 60 declarations, 3 admitted). The
folder is unchanged since 2796799; the change set is in `TauCetiRoadmap/IntegralLattices/`. Five
findings, all P3, none blocking. The gate fails on `outside-folder` only, so no acceptance this round.

## R01 (P3) — the push gate fails on five files outside the roadmap folders

**Location.** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/{ClassFieldTheory,
IntegralLattices, QuadraticFormInvariants}`: `Completed/LocalFieldsRamification/{COMPLETION.md,
README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/{README.md, Suggested.lean}`.

**Claim.** The gate line is `outside-folder=5 FAIL` with every inside-folder count 0. The
`Completed/LocalFieldsRamification` hunks are the pull request's declared subject (its metadata
names `LocalFieldsRamification`), but that roadmap lives under `Completed/` on main and the brief
names only `IntegralLattices` and `QuadraticFormInvariants` as the pull request's own folders. The
`Completed/LocalGaloisGroups` hunks adapt a completed roadmap to this folder's renames
(`h2MuEquivZMod_mixed` is now an equivalence, `h2FpEquivZMod_of_mu` takes the identification `e`
directly) and to `LocalFieldsRamification`'s (`tameInertiaEquiv` → Tau Ceti's
`quotientWildInertiaSubgroupEquiv`).

**Witness.** `Completed/LocalGaloisGroups/Suggested.lean` lines 324–326 and 485 at this head versus
main; gate.md `outside-folder (5)`.

**Repair.** A human decides whether edits under `Completed/` are this pull request's own (then the
brief lists them and the gate passes) or must be split into their own pull request. Nothing in this
folder changes.

## R02 (P3) — two open pull requests change this roadmap and state the same open targets differently, with no stated order

**Location.** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` lines 322–326, 593–595, 602–607;
pull request description (no merge-order sentence naming #1215 or #1411).

**Claim.** #1215 and #1411 conflict with this head in `README.md` and `Suggested.lean`. #1411
states `algebraMap_vle_algebraMap_iff_of_finite_padic` (its Suggested.lean line 407), which is
`valuativeExtension_of_finite` at `K = ℚ_p` with the same route, and its own
`isPrincipal_map_hilbertClassField` and `relDiscr_eq_finprod_abelianConductor` (lines 706, 716);
#1215 states `isPrincipal_map_hilbertClassField` (line 141) and the exponent form
`count_relDiscr_eq_finsum_abelianConductor_exponent` with `abelianConductor_eq_lcm` (lines 152,
166). Whichever merges second must rebase and adopt the other's statements.

**Witness.** overlaps.md: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`,
`TauCetiRoadmap/ClassFieldTheory/Suggested.lean`"; same line for #1411.

**Repair.** State in the pull request's merge-order paragraph which of #617, #1215, #1411 merges
first for this folder; the later ones rebase and keep one statement of each shared target.

## R03 (P3) — four Tau Ceti declarations are cited in files that do not contain them at the pin

**Location.** README.md lines 911–912 ("`TauCeti.relDiscr`, `TauCeti.multiplicity_relDiscr`
(`TauCeti/RingTheory/DedekindDomain/Discriminant/Valuation.lean`)") and 918–922
("`abelianConductor`, `isAdmissibleModulus_abelianConductor`,
`isAdmissibleModulus_iff_abelianConductor_dvd`, `IsAdmissibleModulus.conductorExponent_le_exponent`
(`…/Global/AdmissibleModulus/Ramification.lean`)").

**Witness.** At the pin: `relDiscr` is `TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean`
line 33 (`multiplicity_relDiscr` is in `Valuation.lean` line 52); `abelianConductor`,
`isAdmissibleModulus_iff_abelianConductor_dvd`, `isAdmissibleModulus_abelianConductor` are
`TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean` lines 193, 200, 208
(`conductorExponent_le_exponent` is in `Ramification.lean` line 116).

**Repair.** Cite `relDiscr` with `Discriminant/Basic.lean` and the three conductor declarations with
`AdmissibleModulus/Basic.lean`; keep the other two paths.

## R04 (P3) — nine re-exported theorems that no consumer's Lean file uses

**Location.** `Suggested.lean` lines 125–132 (`tateTheorem`), 145–149
(`ClassFormation.artinMap_conj`), 294–296 (`bijective_muNRepToTateDual`), 300–306
(`tateDualityPairing_muNRepToTateDual`), 335–339 (`finite_H`), 344–354
(`tateDualityPairing_perfect_mixed`), 434–435 (`denseRange_artinMap`), 446–448
(`unramifiedCoordinate_artinMap`), 468–473 (`artinMap_restrict`); README.md lines 1141–1142 ("The
Lean files of `LocalGaloisGroups` and `GlobalQuadraticForms` import `Suggested.lean` and use the
following names").

**Claim.** Each of the nine closes by one `exact` of the Tau Ceti theorem it names, and no Lean file
of any roadmap at this head or on main (`grep -rlw` over every `Suggested.lean` under
`TauCetiRoadmap/` and `Completed/`) contains its name; only `Completed/LocalGaloisGroups/README.md`
(lines 176–179) and `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` name them in prose,
which Tau Ceti's declarations satisfy. The §6 sentence is false for them, and under the
acceptance-test rule they are padding. With them go the declarations only they use:
`absoluteGaloisGroupComparison` (line 168), `restrictAbsolute` (399), `localArtinMap` (455),
`unramifiedCoordinate` (441), `localSymbol` (256), `tateDualityPairing` (282),
`instFactIsSmoothDiscreteTateDual` (274). The 2796799 repair retired the earlier unused
re-exports on the same criterion.

**Witness.** `Completed/LocalGaloisGroups/Suggested.lean` uses `GalRep`, `H`, `muNRep`,
`muNRepEquivZMod`, `muNRep_ρ_eq_self`, `kummerEquiv_mixed`, `h2MuEquivZMod_mixed`,
`h2FpEquivZMod_of_mu`, `kummerCupPairing(_bil)`, `muNRepToTateDual`, `eulerCharacteristic_finrank_fp`,
`absoluteGaloisGroupExtend`, `scd_p_absoluteGaloisGroup_eq_two`, `artinMap`, `normResidue`,
`artinMap_norm` and the three `cyclotomicCharacter_artinMap*`; `GlobalQuadraticForms/Suggested.lean`
uses the nine idele, norm and Hilbert names. `finite_H` occurs in no `.lean` outside this folder.

**Repair.** Delete the nine theorems and the seven declarations only they use from
`Suggested.lean`; list each under "Earlier identifiers, old → new" with its Tau Ceti name (for
example `finite_H → TauCeti.ClassFieldTheory.finite_H`); drop them from the §6 table, the §2.7
`absoluteGaloisGroupComparison` bullet, the Layer 5 `localSymbol` definition and the Layer 7
`restrictAbsolute` definition (their Checks stay as prose on Tau Ceti's names). If instead they are
kept for the completed roadmap's prose contract, say that in §6 in place of the Lean-usage claim.

## R05 (P3) — the module docstring's universe claim is false for Layer 0

**Location.** `Suggested.lean` lines 60–62: "Everything except the valuation comparison is stated in
universe `0`".

**Witness.** Lines 74, 81, 96: `universe u`, `{k G : Type u}` on
`TateCohomology.projective_ker_of_isZero_res` and `primaryComponent_tateCohomology_eq_bot`.

**Repair.** "The two Layer 0 theorems and the valuation comparison are universe-polymorphic;
everything else is in universe `0`".

## Verified sound

**Gate and build.** Worker gate at 39e8628: every inside-folder check 0, `build=0`,
`outside-folder=5 FAIL` (R01). Dependency check run this round:
`depcheck: 236 roadmaps, 2280 edges, 0 problem(s)`; no UPWARD or CYCLE line. Elaboration of a scratch
copy of `Suggested.lean` with `lake env lean` from the worktree: the only diagnostics were the three
probe tactics failing (below); the original file elaborates with `sorry` as its only warning. The
elaborated types of the three open targets and the three closed theorems were printed with
`#check @` and agree with the README (`valuativeExtension_of_finite` in `Type u_1`, `Type u_2`; the
others in `Type`); the worker's signature file reports no lost section binder, and I found none.

**Padding probe.** `valuativeExtension_of_finite`: `first | infer_instance | exact
ValuativeExtension.of_continuous_algebraMap (by continuity) | simp` fails (no instance at the pin:
Mathlib has only `ValuativeExtension K (Completion K)`, Tau Ceti only worked examples and
`FinitePadicExtension.toValuativeExtension`). `isPrincipal_map_hilbertClassField`: `simp`,
`infer_instance`, `rfl` fail. `relDiscr_eq_finprod_abelianConductor`: `simp`, `rfl` fail. None is
padding; the nine one-`exact` re-exports are R04.

**Seeded sample, at the text.**
- "Definitions on Tau Ceti's carriers" (README 458–529): `kummerEquivOfCharZero`,
  `kummerEquivOfCharZero_ofMul_mk`, `kummerClass_eq_muNRepH1Equiv_kummerCocycleClass`,
  `h2MuEquivZMod`, `toRatAddCircle_h2MuEquivZMod`, `h2EquivZModOfMuNRepIso`, `kummerCupPairing`,
  `muNRepEquivZMod`, `localSymbol`, `localSymbol_apply` all exist at the Tau Ceti pin (identifier
  scan below); the Lean bodies (lines 204–259) are the named declarations with `CharZero F` derived
  from `ℚ_p → F`.
- "Open target: the comparison of valuations" (README 531–564): `TauCeti.normalizedValuation` is
  `NumberTheory/LocalField/NormalizedValuation.lean` line 114 (`Kˣ →* Multiplicative ℤ`);
  `TauCeti.henselianLocalRing_integer` is `NumberTheory/LocalField/Henselian.lean` line 41, an
  instance `HenselianLocalRing 𝒪[K]`; Mathlib's `instance : Finite 𝓀[K]` is
  `NumberTheory/LocalField/Basic.lean` line 142; `IsNonarchimedeanLocalField` (line 46) extends
  `IsValuativeTopology`, `LocallyCompactSpace` and `ValuativeRel.IsNontrivial`, which is the
  exclusion of the trivial relation the Check invokes; `ValuativeExtension` (Mathlib
  `RingTheory/Valuation/ValuativeRel/Basic.lean` line 1252) has the single field
  `vle_iff_vle`, which is the README's statement. The route is checked step by step in the table.
  Tau Ceti's `algebraicExtensionValuativeRel_eq` (`AlgebraicExtension/Basic.lean` line 277) and
  `ValuativeExtension.of_continuous_algebraMap` (`Topology/Algebra/ValuativeRel/ContinuousRingHom.lean`
  line 174) assume compatibility or continuity, so the target is not at the pin and is not
  `LocalFieldsRamification`'s (its README, main line 147–149, states uniqueness among compatible
  structures only).
- "The cyclotomic normalization for every finite `F/ℚ_p`" (README 661–672): Milne CFT Example 8.2
  is at milne-cft lines 10059–10107 (PDF pages 230–231, printed 221–222): for `a = u ℓ^s` the local
  symbol at `ℓ` acts on `ℚ(ζ_{ℓ^r})` as `[u⁻¹]` (line 10075) and at `p ≠ ℓ` as `[p^s]`
  (line 10072), which is the arithmetic-Frobenius normalization and `χ_cyc(Art(p)) = 1`,
  `χ_cyc(Art(u)) = u⁻¹`. `localCyclotomicCharacter_artinMap_unit` is
  `Local/ExplicitCyclotomicSymbol/ArtinMap.lean` line 311 with hypotheses
  `[Algebra ℚ_[p] F] [FiniteDimensional ℚ_[p] F] [ValuativeExtension ℚ_[p] F]`, `v(u) = 1`, a lift
  `σ` of `Art_F u`; the Lean closure (lines 515–525) supplies exactly the `ValuativeExtension`.
- "Open targets" (README 832–929): Milne CFT V Theorem 3.17 at milne-cft line 7252 (PDF 170 =
  printed 161), its proof through the Verlagerung and the tower `K ⊂ K' ⊂ K''` at lines 7290–7329
  (printed 162–163; Theorem 3.19 is Furtwängler's group-theoretic form); Theorem 3.27 at line 7423
  and Remark 3.28 at line 7436 (printed 165): `disc(L/K) = ∏_χ 𝔣₀(χ)` with `𝔣₀` the finite part and
  `𝔣(χ) = 𝔣(L^{ker χ}/K)`, so the grouping by cyclic subextensions with exponent `φ([M:K])` is the
  theorem as written. All Tau Ceti inputs of both *Needs* lines exist (paths corrected in R03):
  `groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`Formation/PrincipalIdeal.lean` 67),
  `artinMap_groundInclusion` (`Formation/ArtinMap.lean` 281), `hilbertClassField` (abbrev,
  `ClassFields/RayClassField.lean` 241), `hilbertClassArtinEquiv_mk` (277),
  `fieldRange_le_hilbertClassField_iff` (362), `multiplicity_relDiscr` (`Discriminant/Valuation.lean`
  52: `multiplicity p (relDiscr A B) = ∑_{P | p} inertiaDeg · multiplicity P (differentIdeal)`, under
  `PerfectField (FractionRing A)` and `differentIdeal ≠ ⊥`, both true for number fields),
  `finsum_artinConductorExponent_eq_discriminantExponent` (`LocalField/Discriminant/Conductor.lean`
  58), `conductorExponent_fixedField_ker` (`Local/Conductor/UpperNumbering.lean` 130),
  `conductorExponent_le_iff` (`Local/Conductor/Basic.lean` 113), `mem_range_ideleNormMap_iff`
  (`Global/Ideles/Norm/Range.lean` 115). `relDiscr` is `Ideal.relNorm A (differentIdeal A B)` of
  type `Ideal A`, and `Modulus.finitePart : Ideal (𝓞 K)` (`RayClass/Modulus.lean` 100), so the
  Lean equation is between ideals of `𝓞 K`.

**Other locators.** Milne CFT (printed page = PDF page − 9, checked on the running heads at lines
3868, 7364, 9987, 10885): II Theorem 3.11 line 3911 (p. 84), Remark 3.12 line 3988 (p. 85), III
Lemmas 2.3–2.6 lines 4716–4751, V §1 Frobenius and complete splitting lines 6769–6867
(pp. 152–154), Theorem 3.6 line 7051 (p. 158), Example 3.9 line 7092 (p. 159), VII §4 line 9566
(p. 210), §5 "The Second Inequality" p. 212, Theorem 8.1 line 10042 (p. 221), Lemmas 9.1–9.4 and
Theorem 9.5 lines 10189–10287, VIII Theorem 4.2 line 10937 (p. 241). Milne ADT I Corollary 2.3 at
milne-adt line 1138 (p. 28: duality and finiteness of `H¹` for order prime to `char K`), Theorem
2.8 line 1227 (p. 31: `χ(G, M) = (R : mR)⁻¹`). Kopp–Lagarias Theorems 1.1–1.3 at kopp-lagarias lines
128, 160, 174 (pp. 3–4). Jahnke–Koenigsmann Theorem 2.1 at jahnke-koenigsmann line 113 (p. 3), proof
"[EP05], Theorem 4.4.1" line 115. `LocalFieldsRamificationPartII` §4.1 is "The rank-one norm,
Krasner's lemma and continuity of roots" in the board package.

**Identifier scan.** All 422 backticked library names of the README resolve to a declaration at
the pinned Tau Ceti or Mathlib (structure fields `inv_restrict`, `inv_infl`, `inv_conj`,
`subsingleton_h1` as fields of `ClassFormation`; the "old → new" names are absent by design). Every
`TauCeti.*` import of `Suggested.lean` exists at the pin (the gate's `imports=0`).

**Duplication and ownership.** The three open targets are not in Mathlib or Tau Ceti (probe above
and the greps on `ValuativeExtension`, `hilbertClassField`, `relDiscr`); `LocalFieldsRamification`
on main and at this head claims only uniqueness among compatible structures; `GlobalNumberFields`
(Completed) supplies the carriers cited in §3; `NumberFieldArithmetic`, `LocalGaloisGroups`,
`OrthogonalSpinGroups` are Completed on main; `ClassicalArithmeticCompletion`,
`ImaginaryQuadraticClassNumber`, `ZerosOfLFunctions`, `ReductiveGroupsPartII`,
`SchemeAndStackFoundations`, `QuadraticFormInvariants`, `GlobalQuadraticForms` are on main;
`EndoscopicTransferAndUnitaryTraceComparison` is open pull request #999. Ownership against the
sibling checkouts the brief lists was checked by name for the three targets; #1411's ℚ_p-case
statement is R02. No cross-roadmap citation is upward: the only supplier is `GlobalNumberFields`.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `valuativeExtension_of_finite`, route | `K = ℚ₂`, `F = ℚ₂(i)`, `u = −3`, `ℓ = 3` | `u^{q−1} = −3 ≡ 1 mod 2`; `X^{3^k} − (−3)` has derivative `3^k` (unit) at `1`; `(q−1)·w(u) = w(u) ∈ 3^k ℤ` ∀k ⇒ `w(u) = 0`; `w(2) = 2 > 0`; `2 ≤ᵥ 1` on both sides, `1 ≤ᵥ 2` on neither | holds; normalized values differ (`2` vs `1`) as the README says |
| same, `ℓ = p` | `K = ℚ₂`, `u = 3`, `ℓ = 2` | `3 ≡ 3 mod 8` not a square | route needs `ℓ ≠ p`, as stated |
| same, inseparable | `K = F = 𝔽_p((t))`, `t ↦ t^p` | degree `p`; `w(t^p) = p > 0`; min. polynomial `X^p − t` with `c₀ = −t` | holds without separability |
| same, trivial relation on `F` | `1 ≤ᵥ ϖ` true in `F`, false in `K` | excluded by `IsNontrivial` in `IsNonarchimedeanLocalField F` | negative control correct |
| same, `w(ϖ) = 0` branch | `α` with `w(α) < 0` | `w(αⁿ) = n w(α) < i w(α) = w(c_i α^i)`, `i < n` | sum cannot vanish; branch closes |
| `eulerCharacteristic_mixed` | `ℚ_p`, `ℤ/p`, `p` odd | `#H⁰ = p`, `#H² = #μ_p(ℚ_p) = 1`, `#H¹ = p²`; RHS `p·1·p^{1·1} = p²` | equal |
| same | `ℚ₂`, `ℤ/2` | `2, 2, 8`; `2·2·2 = 8` | equal |
| same | `ℚ_p`, `ℤ/ℓ`, `ℓ ∤ p(p−1)` | `ℓ, 1, ℓ`; `ℓ·1·p⁰` | equal |
| same, non-trivial action | `ℚ₂`, `ℤ/3` with Frobenius `−1` | `#H⁰(A) = 1`, `A ≅ μ₃` (squaring is `−1` on `ℤ/3`), `#H⁰(Aᴰ) = 3 = #H²(A)`; trivial `ℤ/3`: `3` and `1` | both agree with duality |
| `eulerCharacteristic_finrank_fp` | `ℚ₂`, `𝔽₂` | `dim H¹ = 3 = 1 + 1 + 1·1` | equal |
| `finite_H` hypothesis | `𝔽₂((t))`, `𝔽₂`, `n = 2` | `H¹ = F/℘(F)` infinite (`t⁻¹, t⁻³, …` independent, pole orders of `℘(x)` even); `(2 : F) = 0` excluded | hypothesis necessary |
| `cyclotomicCharacter_artinMap` | `p = 2`, `u = −1`; `u = −3` on `μ₁₆` | `(−1)⁻¹ = −1`; `(−3)⁻¹ ≡ 13⁻¹ ≡ 5 mod 16` (`13·5 = 65`), not `13` | arithmetic convention detected |
| same | `K = ℚ₂(i)`, `u = i` | `N(i) = i·(−i) = 1` ⇒ trivial on `2`-power roots | holds |
| Milne Ex. 8.2 vs §2.6 | `a = u ℓ^s` | `φ_ℓ(a) = [u⁻¹]`, `φ_p(a) = [p^s]` for `p ≠ ℓ` | same normalization |
| `isPrincipal_map_hilbertClassField` | `K = ℚ(√−5)`, `H = ℚ(√−5, i)` | `𝔭₂² = (2)`, `(1+i)² = (2i)` ⇒ `𝔭₂𝓞_H = (1+i)` (square roots of ideals unique); `𝔭₂𝔭₃ = (1+√−5)` ⇒ `𝔭₃𝓞_H = ((1+√−5)/(1+i))`; no `x²+5y² ∈ {2, 3}` | both non-principal primes become principal |
| same, degenerate | `K = ℚ`; `I = 0` | `H = ℚ`, every ideal principal; `0` maps to `0`, principal | holds |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(ζ₅)/ℚ` | cyclic `M`: `ℚ` (`φ(1) = 1`, `𝔣₀ = 1`), `ℚ(√5)` (`φ(2) = 1`, `5`), `ℚ(ζ₅)` (`φ(4) = 2`, `5`): `1·5·5² = 125 = 𝔡` | equal |
| same | `ℚ(ζ₈)/ℚ` | `Gal = V₄` not cyclic, so `L` is excluded; `ℚ, ℚ(i), ℚ(√2), ℚ(√−2)`: `1·4·8·8 = 256 = 𝔡` | equal |
| same | `ℚ(i)/ℚ` at `2` | local exponents `0, 2`; `𝔣 = 4·∞`, exponent `2`; `𝔡 = (4)` | equal |
| same | `ℚ(√5)/ℚ` at `2` | inert, exponents `0`; `2 ∤ (5)` | equal |
| same, degenerate | `L = K` | `relDiscr = ⊤`; only `M = K`, `(𝔣 1).finitePart^1 = ⊤` | equal |
| same, step 1 | `ℚ(ζ₅)` at `5` | `g = 1`, `f = 1`, `d = 3`: `multiplicity = 1·3 = 3 = δ` | agrees with `multiplicity_relDiscr` |
| same, step 3 | `D ≤ G` abelian | restriction `Ĝ → D̂` onto with fibres `#(G/D)^ = g` | correct |
| same, step 2 | `ℚ₅(ζ₅)/ℚ₅`, tame | characters' Artin exponents `0, 1, 1, 1`, sum `3 = δ` | agrees |
| §2.3 fundamental class | `[U:V] = 4`, `[U:U'] = 2`, `[V:V'] = 3` | `inv(res u) = 2·¼ = ½`; `inv(cor u_{U',V}) = inv(u_{U',V}) = ½ = 2·¼` ⇒ `cor = 2·u_{U,V}`; `inv(u_{U,V'}) = 1/12`, `3·(1/12) = ¼` ⇒ `inf = 3·u_{U,V'}` | consistent |
| Tate's criterion, Layer 0 | `C₂` on `ℂˣ` by conjugation; trivial `ℤ/2` | `H¹ = 0`, `H² = ℝˣ/ℝ_{>0}` order 2, `Ĥ⁻²(C₂, ℤ) = C₂`; `H¹(C₂, ℤ/2) = ℤ/2 ≠ 0`, `Ĥ⁻¹(C₂, ℤ) = 0 ≠ ℤ/2` | criterion applies / fails as stated |
| Tate–Nakayama hypothesis | `M = ℤ/2`, `C = ℂˣ` | `Tor₁ = ℂˣ[2] = μ₂ ≠ 0` | excluded as stated |
| `kummerEquiv_mixed` | `ℚ₂`, `n = 2`; `−7`; `−1`; `ℚ₃` `n = 2, 1` | `8` classes (`−1, 2, 5`); `−7 ≡ 1 mod 8` square; cocycle of `−1` sends `i ↦ −i` to `−1`; `4`, `1` | agrees |
| `h2MuEquivZMod_mixed` | `ℚ₂`, `n = 1, 2, 3`; `ℚ₇`, `n = 3` | orders `1, 2, 3`; invariant `1/3 ↦ 1`, the other equivalence `↦ 2` | normalization fixed by the invariant |
| `h2FpEquivZMod_of_mu` | `T = 0`; `p = 3`, `e ∘ inv` | `#μ_p = p ≠ 1`, no `e`; `H²(0) = 0 ≄ ℤ/p`; negated | `e` is data |
| `kummerCupPairing` | `n = 2`, `ζ = −1`; `n = 0`; `ℚ₇`, `n = 3`, `ζ` vs `ζ²` | `(−1,−1) ↦ (−1)^1 = −1` (coords `1·1`), `(1, y) ↦ y⁰ = 1`; zero pairing `(−1,−1) ↦ 1`; `log_{ζ²}(ζ) = 2` (`(ζ²)² = ζ`) ⇒ `(ζ,ζ) ↦ ζ²` | root is data; `n = 0` branch total |
| `localSymbol` | `ℚ₂`, `(−1,−1)`, `(5,−1)` | `(−1,−1)₂ = −1 ↦ 1`; `5 = 1²+2²` norm from `ℚ₂(i)` ↦ `0` | agrees with the quadratic Artin test |
| `restrictAbsolute` | `ℚ(i)/ℚ`; `X³−2`, `iota ∘ τ` | conjugation `i ↦ −i`; a transposition fixing `∛2` conjugated by `τ` moving `∛2` fixes `τ⁻¹∛2 ≠ ∛2` | embedding is data |
| §5.6 transfer | `C₄ = ⟨g⟩ ⊃ ⟨g²⟩`; `V₄ ⊃ C₂` | `V(g) = g^{[G:H]} = g²`; `V(g) = g² = 1` for all `g ∈ V₄`, quotient map nontrivial | distinguishes transfer, inclusion, quotient |
| `card_ideleClassNormQuotient` | `ℚ(√5)/ℚ`; `L = K` | index `2 = [L:K]`; `1` | agrees |
| Layer 10 lift obstruction | `ℚ(√13, √17)` | at `2`: `13 ≡ 5 mod 8`, `17 ≡ 1 mod 8`, `D` order 2; at `13`: `17 ≡ 4 = 2²`; at `17`: `13 ≡ 8² = 64`; `H²(G, I_L)` killed by `2`, `H²(G, C_L) ≅ ℤ/4` | no lift for a generator |
| Hasse norm failure | `25` in `ℚ(√13,√17)` | at `2` unit of unramified quadratic; at `5` unramified (`13·17 ≡ 1 mod 5`), `v = 2` even; squares at `13, 17`; `25 > 0`; not a global norm (Cassels–Fröhlich example) | principle fails for `V₄` |
| Layer 12 intersection formula | two `D₄`-fields with common biquadratic `B` | `G = D₄ ×_{V₄} D₄`, order `16`, `[G,G] = {(1,1),(r²,r²)}` order `2` ⇒ `G^{ab}` order `8`; `N(L₁) ∩ N(L₂) = N(B)` index `4` | formula needs abelian layers |
| ray-class criterion | `𝔪 = 4·∞` over `ℚ`; `𝔪 = 4` | `(5)`: `5 ≡ 1 mod 4`, `5 = (2+i)(2−i)`; `(3)`: `3 ≡ 3`, `−3 < 0`, inert; at `4`: `−3 ≡ 1 mod 4`, group trivial, field `ℚ` | real place needed |
| Hilbert criterion | `ℚ(√−5)`: `𝔭₂, 𝔭₃`, `(3+2√−5)`; `ℚ(√3)` | one prime above each non-principal, two above norm `29 = 3²+5·2²`; `(√3)` splits in `ℚ(√3)`, inert in `ℚ(√3, i)` (`e = f = 2` at `3` in `ℚ(i,√3)`) | class group, not narrow |
| Hilbert reciprocity | `(3,7)`; `(−1,−1)` over `ℚ` | `0, 1, 0, 1` at `∞, 2, 3, 7` (`3 ≡ 7 ≡ 3 mod 4`; `(7/3) = 1`; `(3/7) = −1`), sum `0`; `1, 1` at `2, ∞` | sums vanish |
| ring class fields | `ℤ[√−3]`, `ℤ[2i]` | `h(−12) = h(−16) = 1`, `Pic` trivial | ring class field is `K` |
| unramified normalization | `ℚ₂(ζ₅)`, `Art(8)`, `Art(2)`; `K = ℚ₂`, `m = 2` | `ζ₅ ↦ ζ₅⁸ = ζ₅³`; `ζ₅ ↦ ζ₅²`; identity fixes `−1` while `(−1)² = 1` | `m` prime to `q` needed |
| Layer 7 conductors, Kronecker–Weber | `ℚ(√5)`, `ℚ(i)`, `ℚ(√2)` | least levels `5, 4, 8`; `ℚ(ζ₃)` conductor `3·∞` prime to `2` while `ℚ(∛2, ζ₃)` ramifies at `2` | abelianity needed |

## Not verifiable

- Artin–Tate, *Class Field Theory* (waived); Serre, *Local Fields* and *Galois Cohomology*;
  Neukirch, *Algebraic Number Theory*; NSW, *Cohomology of Number Fields*; Engler–Prestel,
  *Valued Fields* (uncertified): cited by locator only, as the manifest settles them.
- Brown, *Cohomology of Groups* VI §8; Rim 1959; Lang, *Algebra* III 7.1; Cox §§7, 9; Weil 1951;
  Tate, Corvallis: background citations in §8 with no manifest entry; not read.

## Source issues

- none
