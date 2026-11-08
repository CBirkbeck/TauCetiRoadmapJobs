# Review of SchemeAndStackFoundations (pull request #1276 at 7a1c656)

**Verdict:** needs changes

This is an incremental re-review of the 17 README lines changed since 170bdbe. `Suggested.lean` and every file outside the folder are unchanged. There are three P3 findings and nothing blocking:

- The supplier contract now names main's library pins, but this head's `lake-manifest.json` still pins the older revisions. One Tau Ceti declaration the README now cites exists only at the newer pin.
- The order with the four open pull requests that conflict on this folder is still not stated.
- The rewritten tangent-space clause of §4.3 has no locator.

## R01 (P3) — The contract names main's pins, this head builds against the older ones, and the renamed derivation lift exists only at the newer pin

Carried from r41 R01 (partly repaired). The repair also introduced the name mismatch.

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:355` "**From Mathlib** (`1b1ccf4b`, the content repository's manifest pin)"; `:396` "**From Tau Ceti** (`2fd255d9`, the content repository's manifest pin)"; `:411`, `:5131`, `:5135` "`derivationToTrivSqZeroExtEquivLift`".

**Claim.** The declarations the two contracts list, and the Tau Ceti lift that §4.3 uses, belong to the pins this folder is built and elaborated against.

**Witness.** At 7a1c656, `lake-manifest.json` pins Mathlib `f6090c70` and Tau Ceti `358314d4`. At `358314d4`, `derivationToTrivSqZeroExtEquivLift` does not exist; only `derivationToDualNumberEquivLift` does (`TauCeti/RingTheory/Derivation/DualNumber.lean:71`). At `2fd255d9` the reverse holds (`TauCeti/RingTheory/Derivation/TrivSqZeroExt.lean:79`).

**Repair.** Merge `origin/main` into the branch:

- The merge is conflict-free and changes only `lake-manifest.json`, to Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. The folder is unchanged on main since the merge base `a0ad405e`, and `git diff origin/main...HEAD` outside the folder is empty.
- Then run the push gate, so that its targeted build elaborates `Suggested.lean` at the pins the README names.
- In the same two lines, write "the pin in `lake-manifest.json`" for "the content repository's manifest pin". The README does not define the latter phrase.

**Tested on the refuting instance.**

- At Tau Ceti `2fd255d9`, every Tau Ceti name the README cites resolves: 38 contract names, 53 names cited after "Tau Ceti", and 37 `TauCeti.`-qualified names.
- All nine `TauCeti.*` imports of `Suggested.lean` exist at that pin. The only declaration those nine modules lose between the two pins (`finrank_cohomology_zero_trivial_eq_one`) is unused.
- At Mathlib `1b1ccf4b`, the 82 contract names and the six cited files resolve.
- Reverting the README to the old pins instead would break it at merge: main's Tau Ceti pin has no `derivationToDualNumberEquivLift`.

## R02 (P3) — The order with the four open pull requests that conflict on this folder is still unstated

Carried from r41 R02 (not repaired).

**Location.** The pull-request description, which names #1163 and no other pull request.

**Claim.** This head and the other open heads on this folder can merge in either order.

**Witness.** `roadmaps overlaps SchemeAndStackFoundations` (index 2026-11-08T21:52:41Z) lists four heads that conflict with 7a1c656:

- #1656: `README.md` and `Suggested.lean`.
- #1807: `README.md`.
- #1808: `README.md` and `Suggested.lean`.
- #1854: `README.md`.

The heads of #1807, #1808 and #1854 still cite `derivationToDualNumberEquivLift` (their `README.md:396`/`:390` and `:5161`/`:5354`).

**Repair.** In the description, state the order with one line per pull request. For #1656: it rebases on this pull request after merge, which its own review already presumes. For #1807, #1808 and #1854: which side rebases, and that the rebased side keeps `derivationToTrivSqZeroExtEquivLift`. No file changes.

**Tested on the refuting instance.** A description naming the four numbers with an order satisfies the overlap rule. The current description names none of them.

## R03 (P3) — The rewritten tangent-space clause of §4.3 has no locator

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5130–5132`: "`tangent_eq_derivations` (for `h_R`, `T = Der_Λ(R, k)` through Tau Ceti's `derivationToTrivSqZeroExtEquivLift` with `B = M = k`, so that `TrivSqZeroExt k k` is `k[ε]`)".

**Claim.** This is a §4.3 target with no source locator. Its neighbours `tangentSpace.add_def`, `IsDeformationFunctor.satisfiesH1H2` and `lifts_torsor` cite Lemmas 90.12.2, 90.16.6 and 90.17.5.

**Witness.** Stacks, Example 90.11.11 (06IC), book version ed88ff78, printed p. 6551 (book text lines 313324–313336). For `F = h_S` it gives `T_F = Der_Λ(S, k)`, and more generally `F(k[V]) = Der_Λ(S, V)` through `f = q + D`.

**Repair.** Add "(Stacks, Example 90.11.11 (06IC))" after "so that `TrivSqZeroExt k k` is `k[ε]`".

**Tested on the refuting instance.**

- The Stacks correspondence `f(s) = q(s) + D(s)` is the Tau Ceti lift `a ↦ inl (algebraMap A B a) + inr (d a)` (`TrivSqZeroExt.lean:68` at `2fd255d9`) with `B = k` and `M = V`. At `V = k` it is the README's `B = M = k`.
- For `S = ℤ_p[[x]]` both sides have `p` elements.

## Previous findings

- R01 — partly repaired: "**From Mathlib** (`1b1ccf4b`, the content repository's manifest pin)" and "**From Tau Ceti** (`2fd255d9`, …)". These are main's pins, not this head's `f6090c70`/`358314d4`. Carried as R01.
- R02 — not repaired: the description still names only "the separate relative-Proj proposal #1163". #1656, #1807, #1808 and #1854 still conflict on this folder. Carried as R02.
- R03 — repaired: `README.md:2012–2013` "`NormalSchemes.IsNormalScheme.isDomain_stalk'` (the stalk-domain instance that `isDiscreteValuationRing_stalk` needs to elaborate)". Every declared name of `Suggested.lean` now has a README hit.

## Verified sound

### Scope

- The change set is `README.md` only: lines 355, 396 and 411–413 (contract), 2011–2013 (§0.30 *Lean:* line), and 5131–5135 (§4.3).
- `git diff 170bdbe HEAD -- Suggested.lean` is empty.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- No changed line adds a pull-request number, a process word, LaTeX, a `set_option`, a forbidden supplier or a copied passage.

### Gate and dependency check

- The worker's gate at 7a1c656 reports every counter 0 and `OK`, including `build=0`, `readme-ids-missing=0` and `depcheck=0`.
- The requested direction check printed:

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

There is no `UPWARD`, `CYCLE` or `moved:` line.

### Elaboration, signatures and padding

- `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean`, run from the worktree, exits 0 in 38.6 s with 73 `declaration uses sorry` warnings and no other diagnostic.
- The elaborated signature of the one declaration the change touches, `NormalSchemes.IsNormalScheme.isDomain_stalk' : ∀ (X : Scheme) [IsNormalScheme X] (x : X), IsDomain (X.presheaf.stalk x)` (`signatures.md`), matches the README's description of it.
- `IsDiscreteValuationRing` takes `[IsDomain R]` (`Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56` at `f6090c70`), so `isDiscreteValuationRing_stalk` (`Suggested.lean:402`) needs the instance, as the README says.
- `signatures.md` has 157 entries. One of them, `on`, is the extractor reading "structure on" in the module docstring at `Suggested.lean:47`. Each of the other 156 declarations has a README hit:
  - 154 are in the roadmap namespace, including `IsJ2` (`:1417`) and `isAffine_of_H1_vanishing` (`:3452`). Seven of these hit only in a shorter qualified form, at `README.md:1724, 1868, 1869, 1949, 1952, 1958`.
  - The two `_root_.IsAzumaya.*` theorems hit at `:4515–4516`.
- The file is byte-identical to the one r41 probed, at the same pins. The r41 one-tactic probe (73 of 73 refuse) and its `#check` comparison therefore stand.

### Headline theorems

Unchanged, as listed in r41:

- `Henselization.henselian`, `existsUnique_lift` and `fixed_of_henselian`
- `Groups.artinBootstrap`
- `Formal.grothendieck_existence`, `grothendieck_existence_fullyFaithful` and `algebraize_hom`
- `DeJong.alteration_theorem` and `semistable_alteration_theorem`
- `weil_bound`

The module docstring still names the theorems that are not statable at the pins, with the carrier each lacks. §4.4 Schlessinger is one of them (`Suggested.lean:44–47`), which is consistent with the §4.3 lift being cited in the README only.

### Library declarations opened

At Tau Ceti `2fd255d9` (main's `.lake`):

- `TauCeti.derivationToTrivSqZeroExtEquivLift` (`TauCeti/RingTheory/Derivation/TrivSqZeroExt.lean:79`). It is an `Equiv` between `Derivation R A M` and `{ψ : A →ₐ[R] TrivSqZeroExt B M // (fstHom R B M).comp ψ = IsScalarTower.toAlgHom R A B}`, for a `B`-bimodule `M` with `IsScalarTower A B M` and `IsScalarTower A Bᵐᵒᵖ M`. Its forward map is at `:68`. The README's gloss at `:411–413` says exactly this.
- `TauCeti.AffineInvariantQuotient.quotient` and `projection` (`TauCeti/AlgebraicGeometry/Quotient/Affine.lean:57, 61`).
- `relativePicardPresheaf` (`TauCeti/AlgebraicGeometry/PicardFunctor/Relative.lean:84`; `:78` at `358314d4`).
- The module paths `TauCeti.Algebra.Category.ModuleCat.Sheaf.TensorProduct.Closed`, `TauCeti.Algebra.CrossedProduct.Comparison` and `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.PicZero` exist at both pins.

At Tau Ceti `358314d4`: `derivationToDualNumberEquivLift` (`TauCeti/RingTheory/Derivation/DualNumber.lean:71`).

At Mathlib `1b1ccf4b`:

- `DualNumber` is `abbrev … := TrivSqZeroExt R R` (`Mathlib/Algebra/DualNumber.lean:46`), so `TrivSqZeroExt k k` is `k[ε]` definitionally, as the changed §4.3 line says.
- `Scheme.Hom.normalization` and `fromNormalization` (`Mathlib/AlgebraicGeometry/Normalization.lean:122, 169`).
- `TrivSqZeroExt.fstHom` is at `Mathlib/Algebra/TrivSqZeroExt/Basic.lean:881` (`f6090c70`).

All 82 Mathlib contract names resolve at both Mathlib pins. All six cited files exist at both, including `Mathlib/Algebra/Homology/LocalCohomology.lean`, `Mathlib/CategoryTheory/Abelian/Ext.lean` and `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`.

### Consumers and overlaps

- §4.3 keeps its number and heading. Its consumer AlgebraicModuliForArithmeticGeometry cites "SchemeAndStackFoundations §4.3" (its `README.md:10066`), which still resolves.
- Within this README, §4.4 (`:5174`, `:5198`) consumes §4.3 unchanged.
- `scratch/overlaps.md` reports no dropped id, no id defined only by an open revision, and no id of this folder that other roadmaps cite and this pull request drops.
- The change introduces no new object, so ownership is as r41 found it.

### Seeded sample

None of the fifteen seeded targets (0.1, 0.2, 0.24, 1.15, 1.20, 2.7, 2.11, 2.19, 4.8, 4.10, 4.12, 4.14, 4.20, 5.5, 5.9) falls in the changed lines, so none was re-read this round. r41 read 4.14 (Nitsure), 4.20 (de Jong) and 5.9 (Stacks 55.9) against their texts and passed them. No README locator is flagged unverified.

### Adversarial table: the changed statements, with computed values

| Statement | Instances tried | Values on each side / excluded model | Result |
|---|---|---|---|
| Contract pins (`README.md:355, 396`) | the hashes against each manifest | README `1b1ccf4b`/`2fd255d9`; main's manifest `1b1ccf4b…`/`2fd255d9…` (equal); head's manifest `f6090c70`/`358314d4` (different) | R01 |
| Tau Ceti contract and citations at the named pin | 38 contract, 53 "Tau Ceti `…`", 37 qualified names | `2fd255d9`: all resolve; `358314d4`: all but `derivationToTrivSqZeroExtEquivLift` | R01 |
| Mathlib contract at the named pin | 82 names, 6 files | all resolve at `1b1ccf4b` and at `f6090c70` | Pass |
| Lift gloss, `M = B` (`:411–413`) | `A = 𝔽₂[x]`, `B = M = 𝔽₂`, point `x ↦ 0` | `Der = 𝔽₂`, 2 elements; points over the point `x ↦ aε`, 2. Wrong model with no "over the point" condition: `x ↦ c + aε`, 4 ≠ 2, excluded by the subtype condition | Pass |
| Lift gloss, `M ≠ B` | same `A`, `B = 𝔽₂`, `M = 𝔽₂²` | `Der = M`, 4; points `x ↦ (0, m)` in `𝔽₂[ε₁, ε₂]/(εᵢεⱼ)`, 4 | Pass |
| `tangent_eq_derivations` with `B = M = k` (`:5130–5132`) | `Λ = ℤ_p`, `R = ℤ_p[[x]]`, `k = 𝔽_p` | `m_R² + m_Λ R = (p, x²)`; `Der_Λ(R, k) ≅ 𝔽_p` via `d ↦ d(x)`; `h_R(k[ε]) = {x ↦ aε}`, `p` points. Wrong model `(m_R/m_R²)^*` has dimension 2 (`p`, `x`), refuted | Pass; R03 (locator) |
| same, `p = 2` and ramified | `R = ℤ₂[π]/(π² − 2)`, `k = 𝔽₂` | `d(π² − 2) = 2π·dπ = 0` in `k`, so `Der ≅ 𝔽₂`; points `π ↦ aε` with `(aε)² = 0 =` image of `2`: 2 = 2 | Pass |
| same, `R = Λ` | `Λ = ℤ_p` | `Der_Λ(Λ, k) = 0`; `h_Λ(k[ε])` is the structure map alone: 1 = 1 | Pass |
| §4.3 *Needs:* (`:5134–5135`) | `DualNumber`, the lift | `DualNumber` at both Mathlib pins (`:46`); lift at `2fd255d9` only | R01 |
| §0.30 `isDomain_stalk'` (`:2012–2013`, `Suggested.lean:390`) | `Spec(k × k)`; `Spec k[t]`; `Spec k[x]/(x²)` | Normal but not integral: stalks `k`, domains pointwise; normal, stalk `k[t]_(t)` a domain; not normal (stalk not a domain), excluded by the class field. `IsDiscreteValuationRing` needs `[IsDomain]` | Pass |

### Adversarial table: rows carried from r41

These statements are unchanged at 7a1c656. The values are r41's.

| Statement | Instances (r41) | Values (r41) | Result |
|---|---|---|---|
| `Henselization.existsUnique_lift` | `(ℤ,(5)) → (ℤ₅,(5))`; `(k,0)` | `g(I·R^h) = f(I)S ⊆ J`; one lift for `(k,0)` | Pass (r41) |
| `Henselization.fixed_of_henselian` | `(k[[t]],(t))`; `(ℤ,0)` | the unit is bijective; the colimit is `ℤ` | Pass (r41) |
| `Groups.artinBootstrap` | `F = h_X`, `a = 𝟙`; empty presheaf | the conclusion equals the hypothesis; `IsAlgebraicSpace ∅` holds | Pass (r41) |
| `Formal.grothendieck_existence`, `_fullyFaithful` | `A = k[[t]]`, `M = N = O`, `g_n = a_n` | kernels `(t^{n+1})`; `(a₀,a₁) = (0,1)` violates `hg` | Pass (r41) |
| `Formal.algebraize_hom` | `Y = 𝔸¹_A`, `(g₀,g₁) = (0,1)` | fails `hcompat` at `n = 0` (`1 ≠ 0`) | Pass (r41) |
| `DeJong.alteration_theorem` | `ℙ¹_k`, `Z` a point; `Z = ⊥` | identity alteration with `n = 1`; `Z = ⊥` excluded | Pass (r41) |
| `DeJong.semistable_alteration_theorem` | `ℙ¹_{k[[t]]}`, `Z = X_s`; `Z = ∅` | `R₁ = R`, `H = ∅`; `Z = ∅` fails `hZspecial` | Pass (r41) |
| `weil_bound` | `ℙ¹/𝔽₂`, `ℙ¹/𝔽₃`; `y² = x³ − x` over `𝔽₃` | `0 ≤ 0`; `|4 − 4| = 0 ≤ 2√3` | Pass (r41) |
| `Coherent.DQCoh.affineEquiv` | `A = ℤ`; `ℤ[0]`, `(ℤ/2)[0]` | `Ext¹(ℤ, ℤ/2) = 0` on both sides; `j_!O_U[0]` lies outside the essential image | Pass (r41) |
| `Picard.lineBundleClass_spec_equiv_pic` | `R = k`; Dedekind `R` with non-principal `P` | trivial groups; `P~ ↦ [P] ≠ 1`, which refutes the inverse convention | Pass (r41) |
| `Curve.vectorBundleDegree_pullback` | `t ↦ u²`, `O(m)` | `finrank = 2`, `deg = 2m`; constant map excluded | Pass (r41) |
| `Chow.CH_coprod`, `coprodOver`, `coprod_locallyOfFiniteType` | `∐ 𝔸¹_κ`, `Σ[0_n]`; `∐ Spec κ`; `I = ∅` | `Σ div(t_n) ∈ RatEquiv`; `RatEquiv = 0` on points; the empty scheme is locally of finite type | Pass (r41) |
| §2.7 local cohomology (README only) | `I = 0`, `I = A`, `R/(π²)`; `K ⊗ K/R` | images `M`, `0`, all of `R/(π²)`; the map is `0 → 0` | Pass (r41) |
| §0.23 nil kernel and affine criterion | `k[x_i]/(x_i^i)`; `𝔽_{p²}/𝔽_p`; the cusp | `x_{m+1}^m ∈ I^m ∖ 0`; two `𝔽̄_p`-points against one | Pass (r41) |
| §5.9–§5.11 pairings | blow-up of `ℙ¹_R`; `E × E`; `ℙ¹ × ℙ¹`; symbolic `g, q` | `E² = −1`, kernel `(1,1)`; `ρ = 4, 6, 3`; signature `(1,1)`; `Γ₀·Δ₀ = N − q − 1` | Pass (r41) |
| Checks of §§0.12, 0.18, 1.5, 1.6, 1.14, 2.17, 2.20, 2.23, 3.2, 4.14, 4.20, 5.12 | r41 rows 110–126 | as computed in r41 | Pass (r41) |
| `Curve.cohomologyDim` junk value | infinite-dimensional `H¹` | guarded by `FiniteDimensional` | Pass (r41) |

### Remarks on untouched text

These are not findings and ask for no change:

- `instance IsNormalScheme.isDomain_stalk'` (`Suggested.lean:390`) has no docstring.
- `PredeformationFunctor.map` (`README.md:5130`) carries no locator.

## Not verifiable

- I did not elaborate `Suggested.lean` at the pins the README now names (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). This review may run Lean only in the pull request's worktree, which has the older pins. The static checks under R01 are what was done; the gate's build after the merge is the test.
- I did not re-read the eleven seeded targets that r41 did not cover (0.1, 0.2, 0.24, 1.15, 1.20, 2.11, 2.19, 4.8, 4.10, 4.12, 5.5). They fall outside the changed lines, so an incremental review does not re-read them.
- Hartshorne 1977, Liu 2002, Fulton 1998, Kleiman 1966 and Grothendieck 1957 are settled as uncertified or have no legal text, as recorded in r41. They are not cited by the changed lines.
- Ownership against open pull requests was checked through `roadmaps overlaps` and through `roadmaps grep` for the changed names (`derivationToDualNumberEquivLift`, `derivationToTrivSqZeroExtEquivLift`, `exists_etale_matrix_splitting`). I did not read every open README.

## Source issues

- none
