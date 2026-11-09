# Review of ComplexKahlerGeometry (pull request #1808 at 09909fe)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ComplexKahlerGeometry/` at 09909fe553a4 (211 README lines changed since a96d197; `Suggested.lean` byte-identical). Five of the previous review's seven findings are repaired (R01, R02, R05, R06, R07 there); R03 and R04 carry over. This review raises two new blocking findings (an end theorem that can be stated at the pins but is missing, and an object that two open pull requests both own) and six new P3s.

Mechanics. Worker gate: `outside-folder=2 … build=0 FAIL`, every other count 0. `git diff --stat origin/main...HEAD` outside the fifteen folders: `Completed/ArithmeticDirichletSeries/README.md`, `TauCetiRoadmap/SymplecticGeometry/README.md` (R04). Dependency check: `depcheck: 239 roadmaps, 2324 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean`: exit 0 in 10.6 s, 16 `declaration uses sorry` warnings and nothing else. Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9.

## R01 (P2) — Cartan's coherence theorem can be stated at the pins but is neither stated nor named as unstatable

Location: `README.md` lines 1059–1064: "Own **Cartan's coherence theorem** for the reduced ideal sheaf ((4.29)) as a separate local-algebra target: for every closed analytic subset `A` … construct a neighbourhood and finitely many holomorphic functions whose germs generate its reduced ideal". `Suggested.lean` lines 30–54 (module docstring): neither the "Stated here" list nor the "Not statable" list mentions it.

Claim: the Summary (line 7) names "Oka and Cartan coherence" among the roadmap's results, 3.4 owns Cartan's theorem as its own target, and RealAnalyticGeometry R3.2 consumes it. In its primitive local form it needs only the carriers `oka_coherence` already uses: analytic functions on opens of `Fin n → ℂ`, with germ equality written `=ᶠ[𝓝 y]`. It is therefore a statable headline that is absent.

Witness: the statement below elaborates against this head's pins (scratch copy of `Suggested.lean`, `lake env lean` exit 0, one `sorry` warning). #1234's copy of this same roadmap states it as `cartan_coherence_reducedIdeal` (line 244 of its `Suggested.lean`).

Repair: add after `oka_coherence`

```lean
/-- **Cartan's coherence theorem for the reduced ideal sheaf** (Demailly, Chapter II, (4.29)), in
its primitive local form: for the common zero set `A` of holomorphic `f₁, …, f_k` on an open
`U ⊆ ℂⁿ` and `x ∈ U`, there are a neighbourhood `V` of `x` and finitely many holomorphic `g_j`
on `V` vanishing on `A` whose germs generate, at every `y ∈ V`, the ideal of germs at `y`
vanishing on `A`. For `k = 0` the ideal is `0` and `N = 0` works. -/
theorem cartan_coherence {n k : ℕ} {U : Set (Fin n → ℂ)} (hU : IsOpen U)
    {f : Fin k → (Fin n → ℂ) → ℂ} (hf : ∀ i, DifferentiableOn ℂ (f i) U)
    {x : Fin n → ℂ} (hx : x ∈ U) :
    ∃ V : Set (Fin n → ℂ), IsOpen V ∧ x ∈ V ∧ V ⊆ U ∧
      ∃ (N : ℕ) (g : Fin N → (Fin n → ℂ) → ℂ),
        (∀ j, DifferentiableOn ℂ (g j) V) ∧
        (∀ j, ∀ z ∈ V, (∀ i, f i z = 0) → g j z = 0) ∧
        ∀ y ∈ V, ∀ h : (Fin n → ℂ) → ℂ, AnalyticAt ℂ h y →
          (∀ᶠ z in 𝓝 y, (∀ i, f i z = 0) → h z = 0) →
          ∃ c : Fin N → (Fin n → ℂ) → ℂ, (∀ j, AnalyticAt ℂ (c j) y) ∧
            h =ᶠ[𝓝 y] fun z ↦ ∑ j, c j z * g j z := by
  sorry
```

Also name it in README 3.4 ("Own **Cartan's coherence theorem** `cartan_coherence` …"), in the Summary's list of end theorems (line 16) and in the docstring's "Stated here" sentence. Tested instances:
- `k = 0`: `A = U`, the ideal is `0`, and `N = 0` works.
- `f₁ = 1`: `A = ∅`, and `N = 1` with `g₁ = 1` works.
- `f₁ = z²` on `ℂ`: `g₁ = z` gives the ideal `(z)` at `0` and the unit ideal at `y ≠ 0`, where `g₁(y) ≠ 0`.

## R02 (P2) — Two open pull requests both own the ℂPⁿ homeomorphism and its CW transport

Location: `README.md` lines 2283–2285: "Construct the homeomorphism from `TauCeti.ComplexProjectiveSpace n` to `Projectivization ℂ (Fin (n+1) → ℂ)`". Also lines 2293–2294: "Transport the pinned finite CW structure `ComplexProjectiveSpace.cwComplex` along it". Also lines 85–87: "7.2 owns the homeomorphism … the transport of the CW structure".

Claim: #1797 is an open revision of AlgebraicTopology by the same author. It gives AlgebraicTopology Stage 4.6 the same homeomorphism and the same transport, and states that this roadmap consumes them. The merge-order paragraph does not mention #1797. Once both pull requests merge, the object has two owners and each roadmap says the other consumes it.

Witness: `roadmaps show AlgebraicTopology --pr 1797`, lines 1256–1260: "Own the homeomorphism of that carrier with native `Projectivization ℂ (Fin (n+1) → ℂ)` … and the transport of the CW structure and characteristic maps along it. ComplexKahlerGeometry K7 consumes that topology and this cell structure." The same claim appears at its lines 2560 and 3361.

Repair: keep 7.2 as the owner. This pull request's own AlgebraicTopology Stage 7 item 4 (lines 2053–2056: "No complex-projective construction is required here") and CharacteristicClasses (lines 371–374) already agree with that. Add to the description's merge-order paragraph: "#1797 is rebased on this pull request and drops its AlgebraicTopology Stage 4.6 clause on the homeomorphism of `TauCeti.ComplexProjectiveSpace n` with `Projectivization ℂ (Fin (n+1) → ℂ)` and the transport of its cells (its README lines 1256–1260, 2560, 3361); ComplexKahlerGeometry 7.2 owns them." If AlgebraicTopology is to own them instead, move 7.2's paragraph (lines 2283–2307) into this pull request's AlgebraicTopology Stage 4 item 6 and cite it from 7.2. Either way, the two pull requests must say the same thing.

## R03 (P3) — The merge-order paragraph omits five other-author pull requests this folder depends on or conflicts with

Carried from the previous review (its R03); not repaired, since the description is unchanged.

Location: the description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**. It depends on no other author's open pull request." README lines that depend on other authors' pull requests:
- GeometricTopology §1.7/§1.7.1: lines 114–115, 471–478, 2365–2367, 2373, 2422, 2434.
- VariationalMethods and UnboundedOperators: lines 453–464 and 1847–1858.

Claim: GeometricTopology §1.7 and §1.7.1 exist only at the head of #903, a revision by kim-em. VariationalMethods (#1028) and `OperatorTheory/UnboundedOperators` (#1027) are new folders by kim-em. #1234 and #1398, also kim-em's, change this folder and conflict with this head (`scratch/overlaps.md`). The paragraph names none of them and says there is no other-author dependency.

Witness: `TauCetiRoadmap/GeometricTopology/README.md` on main has no `### 1.7` heading. At #903's head, `### 1.7` is at line 1049 and `### 1.7.1` at line 1101, and §1.7.1 item 2 (lines 1124–1127) builds the polygon/CW model that 7.3 now consumes.

Repair (description only): "#1101 → #1807 → this pull request. GeometricTopology §1.7/§1.7.1 are cited at #903's numbering, and #903 merges first. VariationalMethods (#1028) and OperatorTheory/UnboundedOperators (#1027) are consumed as new folders and merge first. #1234 and #1398 are rebased on this pull request's copy of `TauCetiRoadmap/ComplexKahlerGeometry/`." Add the #1797 sentence from R02.

## R04 (P3) — Two edits outside the pull request's folders; the gate fails

Carried from the previous review (its R04); not repaired.

Re-raised: R14 (earlier answered as being outside the folder). That answer does not settle the finding: the gate fails on exactly these two files, no acceptance is possible while it fails, and the repair is a revert on this branch rather than an edit in the folder.

Location: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (one line). Gate: `outside-folder=2`, verdict FAIL.

Claim: these two one-line rewordings come from #1807 commits e591d103 and 61e5385e. They are not this pull request's subject.

Witness: `git log --oneline origin/main..HEAD -- Completed/ArithmeticDirichletSeries/README.md TauCetiRoadmap/SymplecticGeometry/README.md` lists 61e5385e and e591d103 at 09909fe.

Repair: revert the two commits on this branch.

## R05 (P3) — Three cited VariationalMethods and UnboundedOperators names do not exist at those roadmaps' heads

Location: `README.md` lines 455–460: "VariationalMethods §2.2–2.4: the `RCLike` coercive solution operator with its `toRealBilin` comparison … §5.1–5.2: the represented operator `CompactFormPair.operator` … UnboundedOperators §4.7 (UO-D06): `closedFormOperator`". Lines 1848–1856 repeat all three names.

Claim:
- At #1028's head, VariationalMethods §2.3 consumes UO-D06's coercive solution and packages it as `S_α` and `F_α`.
- VariationalMethods declares no `CompactFormPair.operator`.
- `toRealBilin` occurs in no roadmap and in neither pinned library.
- At #1027, UnboundedOperators §4.7 names its operator theorem `existsUnique_selfAdjoint_of_closed_form` (line 728), not `closedFormOperator`.

Witness: VariationalMethods at #1028, lines 1061–1063: "for the represented operator, 5.1's graph characterization and `CompactFormPair.operatorDomainV` with `CompactFormPair.exists_compact_selfAdjoint_shifted_inverse` (there is no separate operator declaration". `roadmaps grep 'toRealBilin'` finds only this README.

Repair:
- At lines 455–462, write "VariationalMethods §2.3: the `RCLike` solution maps `S_α`, `F_α` of a shifted coercive form, identified at `𝕜 = ℝ` through Mathlib's `IsCoercive.continuousLinearEquivOfBilin` and Tau Ceti's `IsCoercive.formSolutionMap`; …; §5.1–5.2: the operator of a compact form pair (UO-D06's operator on the pair's data) with §5.1's graph characterization, `CompactFormPair.operatorDomainV` and `CompactFormPair.exists_compact_selfAdjoint_shifted_inverse`, compact resolvent and eigen-expansion. UnboundedOperators §4.7 (UO-D06): the coercive solution map over `[RCLike 𝕜]` and the closed-form representation theorem `existsUnique_selfAdjoint_of_closed_form`, …".
- Make the same three replacements at lines 1848–1856.
- `IsCoercive.formSolutionMap` is at the pin (`Analysis/InnerProductSpace/Variational/Spectrum.lean` line 103).

## R06 (P3) — Two consumer claims that the named roadmaps contradict

Location: `README.md`:
- Lines 87–88: "which AlgebraicTopology Stage 7 and CharacteristicClasses C1.5 consume".
- Lines 438–439: "Stage 7 consumes 7.2's transported cell structure".
- Lines 2306–2307: the same claim about AlgebraicTopology Stage 7.
- Lines 653–654: "LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary".
- Line 2587: the same claim about LieGroupoidsPoisson.

Claim: AlgebraicTopology at this head uses the pinned Tau Ceti value of `χ(ℂPⁿ)` and nothing of 7.2. LieGroupoidsPoisson on main says this roadmap is never its supplier. If the LieGroupoidsPoisson edge existed, it would close a cycle with 8.2–8.3's use of §G1.3a.

Witness: AlgebraicTopology at this head, lines 2053–2056: "`TauCeti.eulerChar_complexProjectiveSpace` on the pinned `TauCeti.ComplexProjectiveSpace`); consume them. No complex-projective construction is required here." LieGroupoidsPoisson on main, lines 85–86: "is a consumer of this roadmap (its K8 consumes §G1.3a) and is therefore never a supplier here".

Repair:
- Lines 87–88: end at "…, which CharacteristicClasses C1.5 consumes."
- Lines 438–439: "Nothing of Stage 7 is consumed here."
- Lines 2306–2307: "CharacteristicClasses C1.5 consumes this transported structure."
- Lines 653–654: delete "LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds the complex Lie algebroid structures."
- Line 2587: delete "LieGroupoidsPoisson consumes 1.3's eigenbundle and involutivity dictionary;".

## R07 (P3) — Layer 2 still depends on Layer 4 and 7.1 after the items that needed them moved out

Location: `README.md`:
- Line 899: "Demailly, Chapters I and IV; Layer 4 and 7.1 for the later items only."
- Lines 890–891: "the Riemann sphere of 7.1, where `H^(1,0) = 0`".
- Lines 491–492: "its bundle-valued comparison follows Layer 4".

Claim: the bundle-valued comparison is now in 4.2 (lines 1232–1237) and the ℂP¹ example is now a 7.2 Check (lines 2333–2336). No Layer 2 item needs Layer 4 or 7.1 any more. As written, the Layer 2 dependencies make Layer 2 depend on Layer 4, which itself needs 2.3–2.4: a layer-level cycle.

Witness: 2.4's `*Needs:*` (lines 884–886) ends at `MDifferentiable.exists_eq_const_of_compactSpace`. 4.2's `*Needs:*` (line 1251) reads "4.1; 1.2; 1.4; 2.3–2.4".

Repair:
- Line 899: end at "Demailly, Chapters I and IV."
- Lines 890–891: "The unit disc and the polydisc with the explicit primitives of 2.3; the punctured-plane products and their Laurent monomials of 2.1."
- Lines 491–492: "… and the Dolbeault theorem; the bundle-valued Dolbeault comparison is 4.2's."

## R08 (P3) — A false clause in a 2.4 Check: the union of two polydiscs need not be Stein

Location: `README.md` lines 881–882: "a cover by two polydiscs would be a Leray cover of a Stein union with `H¹ = 0`".

Claim: a cover by two polydiscs is a Leray cover, but the union of two polydiscs need not be Stein, and its `H¹(𝒪)` need not vanish.

Witness: take the cross `Δ(1, ε) ∪ Δ(ε, 1)` with `0 < ε < 1`. On `Δ(ε, ε)`, `g = Σ_k (z₁z₂/ε²)^k` has diagonal coefficients `a_kk = ε^(−2k)`. Any function holomorphic on either piece has `a_kk = O((ε(1−δ)²)^(−k)) = o(ε^(−2k))`. So `g` is not a sum of two such functions, and `[g] ≠ 0`.

Repair: replace the clause with "for the cover of the bidisc `Δ(1, 1)` by itself and `Δ(1/2, 1/2)` the same Čech group vanishes, whereas the union of two polydiscs need not be Stein: on the cross `Δ(1, ε) ∪ Δ(ε, 1)` the class of `Σ_k (z₁z₂/ε²)^k` is nonzero".

## R09 (P3) — 3.4's prime chain is one prime short

Location: `README.md` lines 1042–1044: "the primes `(z₁) ⊂ (z₁, z₂) ⊂ … ⊂ (z₁, …, z_n)`, with quotients the domains `𝒪_(n−k)`, form a chain of length `n`".

Claim: the listed chain has `n` primes, so its length is `n − 1`. The lower bound `dim 𝒪_n ≥ n` needs the chain to start at `(0)`, which is prime because `𝒪_n` is a domain.

Witness: for `n = 1`, the listed chain is `(z)` alone, of length `0`, while `dim ℂ{z} = 1`.

Repair: "the primes `(0) ⊂ (z₁) ⊂ (z₁, z₂) ⊂ … ⊂ (z₁, …, z_n)`, with quotients the domains `𝒪_(n−k)` for `0 ≤ k ≤ n`, form a chain of length `n`". At `n = 1` this gives `(0) ⊂ (z)`, of length 1.

## R10 (P3) — A wrong section for `[Λ, L]`, and four classical facts with no locator

Location: `README.md`:
- Lines 2083–2084: "`[Λ, L] = (n − k)` on degree `k` (Demailly, Chapter VI, §5.3)".
- 4.1, lines 1192–1193 (the section/reconstruction equivalence): no locator.
- 5.9, line 1969 ("Prove `dvol_g = ω^n/n!`"): no locator.
- 7.3, lines 2359–2360 (the torus's flat Kähler structure) and 2390 (the Hopf surface is not Kähler): no locator.
- 7.2, lines 2307–2308 (`H*(ℂPⁿ; ℤ) = ℤ[u]/(u^(n+1))`): no locator.

Claim: `[L, Λ] = (p + q − n)` is Demailly VI (5.9), which sits in §5.2 on p. 301; §5.3, starting on p. 302, treats primitive elements. The other statements are classical, and the cached Demailly text states each of them at the places given below.

Witness, all in demailly-agbook:
- Lines 14948–14949: (5.9), after the page-301 marker at line 14880.
- Lines 13161–13163: V §11, p. 267, holomorphic bundles are equivalent to locally free `𝒪`-modules.
- Line 14675: VI (4.2), `dV = ω^n/n!`.
- Lines 14697 and 14702–14706: VI (4.5) and (4.7), p. 297.
- Line 13812: V (15.10), p. 280.

Repair:
- Line 2084: "(Demailly, Chapter VI, (5.9), p. 301)".
- 4.1: "(Demailly, Chapter V, §11, after (11.1), p. 267)".
- 5.9: "(Demailly, Chapter VI, (4.2))".
- 7.3: "(Demailly, Chapter VI, (4.5))" for the torus and "(Demailly, Chapter VI, (4.7), p. 297)" for the Hopf surface.
- 7.2's cup ring: "(Demailly, Chapter V, (15.10), p. 280)".

## Previous findings

- **R01 (P1, ℂPⁿ cells had no owner): repaired.** 7.2 (lines 2283–2307) builds the homeomorphism from the pinned `TauCeti.ComplexProjectiveSpace n` and transports the pinned `ComplexProjectiveSpace.cwComplex` by `Topology.IsClosedEmbedding.relCWComplex`. AlgebraicTopology at this head (lines 2053–2056) no longer claims the cells, and CharacteristicClasses (lines 371–374) consumes K7.2's CW subitems. Two leftovers are new findings: the consumer wording (R06 here) and #1797's competing ownership (R02 here).
- **R02 (P2, genus model): repaired.** Lines 2373–2380 read "Consume §1.7.1's polygon/CW model of the standard surface (… one vertex, `2j` edges … one face attached along the word `[a₁, b₁]⋯[a_j, b_j]`". #903's §1.7.1 item 2 (lines 1124–1127) constructs this model with counts `F = 1`, `E = q + 2p + 2r`, `V = r + 1`.
- **R03: not repaired.** The merge-order paragraph is unchanged (R03 here).
- **R04: not repaired.** Gate `outside-folder=2` (R04 here).
- **R05: repaired.** Lines 821–824: "a definition by the open Euclidean ball `|z| < 1` would omit `(0.9, 0.9)`, which the polydisc contains, and a closed-polydisc definition would contain `(1, 0)`".
- **R06: repaired.** Lines 2092–2098 cite VII (1.3) as the Kähler case of (1.2) with `τ = [Λ, ∂ω]`, and cite (2.1) for the inequality. The References (lines 2608–2609) and line 321 ("(the same definition as Mathlib's)") are fixed.
- **R07: repaired.** `diff` against `roadmaps show ComplexKahlerGeometry --pr 1807`: all 145 differing lines lie in the R01, R02, R05 and R06 passages, and `Suggested.lean` is identical. #1807's earlier repairs (§1.7 citations, IV (6.13)–(6.15), the 3.4 dimension argument, 2.4's `*Needs:*`) are all present here.

## Verified sound

**Build and signatures.**
- `lake env lean` exits 0 with 16 sorry warnings.
- The one-tactic probe (`first | rfl | infer_instance | (simp; done) | (norm_num; done) | trivial | decide | …` on a scratch copy) fails on all 16 theorems, so none is padding.
- `#check @` of all 26 declarations matches the README statements:
  - `hodge_theorem_deRham` carries `[BoundarylessManifold I M] [T2Space M] [CompactSpace M]`, `RiemannianBundle` and `IsContMDiffRiemannianBundle`.
  - The Kähler theorems carry `[FiniteDimensional ℂ E] [T2Space M] [CompactSpace M]` and `IsKahlerForm E M κ`.
  - The nine definitions lack `[FiniteDimensional ℂ E]` because their bodies do not use it.
- `Manifold.Orientation I M (Fin m)` forces `m = dim` through `OrientationLift.card_eq` (Tau Ceti `Geometry/Manifold/Orientation/Lift.lean` line 57), so `hodge_theorem_deRham` has no case with a mismatched dimension.

**Layer 7 docstring.** The pinned `TauCeti.Geometry.Manifold.Instances.ComplexProjectiveSpace` imports cleanly beside `import Mathlib`, and Dolbeault and de Rham statements on `TauCeti.ComplexProjectiveSpace n` elaborate (scratch, exit 0). The docstring is still accurate for the README's carrier: the Layer 7 headlines (`ω_FS` and its integral, `O(k)`, `H⁰(O(k))`, `K ≃ O(−2)`) need line bundles, top-form integration or 7.2's own identification, and none of these is at the pins.

**Declarations opened at the pins (25).**

Tau Ceti:
- `ComplexProjectiveSpace`, `mk`, `mk_eq_mk_iff`, `isOpenQuotientMap_mk`, `continuousAt_lift`, `instCompactSpace`, `instT2Space`: `Topology/ComplexProjectiveSpace/Basic.lean` lines 58, 84, 102, 130, 140, 72, 77.
- `ratio`, `affineOpen`, `affineChart`, `affineChart_apply` (`ratio k (k.succAbove j)`): `Charts.lean` lines 40, 52, 166, 191.
- `instIsManifold : IsManifold 𝓘(ℂ, Fin n → ℂ) r`: `Geometry/Manifold/Instances/ComplexProjectiveSpace.lean` line 65.
- `cellMap`, `cellMap_apply` (the point `(v, √(1−‖v‖²), 0, …)`), `cwComplex`, `map_cwComplex`, `finite_cwComplex`, `nat_card_cell_cwComplex`, `finiteCWType`: `Topology/CWComplex/Classical/ComplexProjective.lean` lines 271, 332, 419, 433, 445, 452, 468.
- `cellularChainComplex_d_eq_zero`, `singularHomologyIso`, `isZero_singularHomology_of_odd`, `isZero_singularHomology_of_lt`: `AlgebraicTopology/Cellular/ComplexProjective.lean` lines 98, 124, 133, 139.
- `eulerChar_complexProjectiveSpace`: `Cellular/EulerCharacteristic/ComplexProjective.lean` line 68.
- `relCWComplex`, `relCWComplexCellEquiv`, `coe_map_relCWComplex`: `Topology/CWComplex/Classical/Image.lean` lines 84, 126, 132.
- `Homeomorph.finiteCWType`: `FiniteCWType.lean` line 98.
- `cellularSingularHomologyIsoUniv`: `AlgebraicTopology/Cellular/Comparison.lean` line 300.
- `affineOpenPartialHomeomorph` (coordinates `v (i.succAbove j) / v i`, so 7.2's chart comparison is the identity in coordinates): `Topology/Algebra/Projectivization.lean` line 311.
- `hodgeStar`: `Riemannian/HodgeStar.lean` line 296. `codifferential`: `Codifferential.lean` line 88.
- `IsCoercive.formSolutionMap`.
- No pinned map between `ComplexProjectiveSpace` and `Projectivization` exists (grep), so 7.2's homeomorphism duplicates nothing at the pins.

Mathlib:
- `Continuous.homeoOfEquivCompactToT2`: `Topology/Homeomorph/Lemmas.lean` line 479.
- `Homeomorph.isClosedEmbedding`: `Homeomorph/Defs.lean` line 298.
- `Projectivization.mk_eq_mk_iff`: `LinearAlgebra/Projectivization/Basic.lean` line 112.
- `IsRegularLocalRing`: `RingTheory/RegularLocalRing/Defs.lean`.
- `Topology/Algebra/Projectivization.lean` exists.

**Cross-roadmap citations resolved (28).**
- AlgebraicTopology at this head: Stage 4 (`cwSubcomplexNeighborhoods` line 890, `simplicialRealizationCW` line 1000), Stage 5.0 (line 1081), Stage 6.3, Stage 7 item 4 (lines 2053–2056).
- CharacteristicClasses at this head: lines 367–376.
- GeometricTopology at #903: §1.7 (line 1049) and §1.7.1 items 1–2 (lines 1101–1127).
- DifferentialGeometry on main: 0.1, 0.3, 0.4 (`legacySmoothTwoFormEquiv_isClosed_iff`, line 304), 1.1–1.3, 2.1–2.2, 5.2–5.5, 8.3–8.5, 12.1, 12.3, 12.4.
- SmoothBundlesConnections on main: B2.1–B2.4, B3.1–B3.3, B4.1–B4.2, B5.0, B5.2, B6.0–B6.3.
- PDE on main: §1.3 (A3), §1.7 (A7), §2.2 (B9), §5.3 (E22), §5.6 (E25).
- LieGroupoidsPoisson on main: §G1.3a.
- ComplexManifolds on main: Milestones 1–7.
- ComplexTori on main: Milestone 1.
- VariationalMethods at #1028: §2.2–2.4, §3.1 (finite orthogonal sums), Layers 3–4, §5.1–5.2.
- UnboundedOperators at #1027: §4.7 (UO-D06, at path `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`).

**Overlaps.**
- #1807's copy is this folder minus its repairs (R07 repaired).
- #1854 changes three lines of main's copy of this roadmap ("DGFloer" → "AlgebraicTopology Stage 5.0" in 8.1 and 8.3; RiemannianGeometry/SpinGeometry wording), and this head's 8.1, 8.3 and 5.1 already say the same.
- The three anchors this pull request drops (`#k2-…`, `#k5-…`, `#k7-…`) are covered by the old → new numbering list (lines 505–517).
- The seven `scratch/citations.md` leads are the K-labels of that list, not Lean names.
- `roadmaps grep 'namespace TauCetiRoadmap.ComplexKahlerGeometry'` finds only main, #1234, #1807, #1808 and #1854, all copies of this roadmap.

**Seeded sample, locators read in the text.**
- 2.3: Demailly I (3.2) p. 21 (line 883), (3.4) (line 918) and (3.29) (line 1288; the neighbourhood form, as 2.3 says).
- 3.5: Hartogs (3.28) p. 28 (line 1266).
- 2.4: IV (6.13)–(6.15) p. 216 (lines 10730–10742).
- 3.2 and 3.4, Chapter II: (2.1) and (2.3)–(2.4) p. 80; (2.7) p. 82; (2.10) (line 3931); (3.19) p. 89; (4.19) p. 95; (4.22) p. 97; (4.24) p. 98; (4.29) p. 99; (4.31) p. 100; (4.32) p. 101.
- 4.2: V (11.7) (line 13215, through (11.5)'s soft resolution) and (12.4) (line 13254).
- 6.1: VI (6.4) (line 15156, `[Λ, d″] = −i d′*`, `[Λ, d′] = i d″*`, the README's signs); VII (1.2), (1.3) and (2.1) (lines 16274, 16281, 16380).
- 7.2 and 6.2 locators beyond the sample: V (15.5)–(15.6) p. 278; VI (8.5)–(8.7), (8.12) p. 313, (8.17) p. 313.
- 4.2 and 6.1, Ballmann (ballmann-kahler): 3.18 (line 1400), 4.17 items 1–7 (line 1990), 4.23 (line 2090), 5.25 (line 2680, `Δ_∂ + Δ_∂^D = Δ_d^D`), 5.31 (line 2742), §5.1 (line 2626).
- 8.2: Sakane Theorem 1 and the central reduction `A = C^m(G)` on p. 189 (sakane-parallelisable lines 102–115); its example on p. 197 gives `h^(0,1) = 2`, `h^(1,0) = 3`, `b₁ = 4` (line 339).
- 2.1, which 2.2 consumes: Rainer Theorem 7.4, p. 15 (rainer-advanced-complex-analysis line 716).
- 1.2, 2.2, 5.6 and 5.8 cite pinned declarations and suppliers, not a source. The sampled targets that need a locator and lack one are in R10.

**Adversarial table.** Values were computed this round.

| statement | instance | left | right | result |
|---|---|---|---|---|
| `newlander_nirenberg` | `E = 0`; the `J` of 1.3 on `ℝ⁴`; `ofComplexManifold` | `E = 0`: every chart works | `N(∂_x, ∂_u) = ∂_x ≠ 0` fails the hypothesis; for `i` the identity chart works | holds |
| `dolbeault_grothendieck_polydisc` | `n = 1`, `φ = z̄ dz̄`; `n = 0`; `r ≤ 0` | `ψ = z̄²/2` | `|z|²` gives `z dz̄`; `n = 0`: `ψ = 0`; empty polydisc | holds |
| `hartogs_extension` | `K = {0} ⊂ ℂ²`; `n = 1`, `1/z`; shell `1 ≤ |z| ≤ 2` | extends | `n = 1` fails; shell: `Ω ∖ K` disconnected, `1`/`0` | both hypotheses present |
| `weierstrass_preparation` | `w² − z`; `e^z w`; `d = 0` | `u = 1`, `a₀ = −z`; `u = e^z`, `P = w` | `u = f`, `P = 1` | holds |
| `weierstrass_preparation_unique` | `n = 0` | `a i` constant `0` | `f = u w^d` forces `u` | holds |
| `isRegularLocalRing_holomorphicStalk` | `E = 0`; `E = ℂ` | stalk `ℂ`, dimension 0 | `ℂ{z}`, a DVR, dimension 1 | holds |
| `uniqueFactorizationMonoid_holomorphicStalk` | node `w² − z² − z³` | `(w − z√(1+z))(w + z√(1+z))` in `𝒪₂` | irreducible in `ℂ[z,w]` | Check consistent |
| `rueckert_nullstellensatz` | `f₁ = z²`, `g = z`; `k = 0`; `f₁ = 1` | `m = 2`, `a₁ = 1` | `k = 0`: `m = 1`; `f₁ = 1`: `m = 0` | holds |
| `oka_coherence` | `(z₁, z₂)`; `(z, z²)`; `k = 0` | Koszul `(z₂, −z₁)` | `(a, b) = b(−z, 1)`; `N = 0` | holds |
| `cartan_coherence` (R01) | `k = 0`; `f₁ = 1`; `f₁ = z²` on `ℂ` | `N = 0`; `g₁ = 1` | `g₁ = z`: `(z)` at `0`, unit ideal at `y ≠ 0` | true; elaborates |
| `hodge_theorem_deRham` | `T²`, degree 1; empty `M` | harmonic `dx`, `dy`, dimension `2 = b₁` | empty: zero form unique; `m ≠ dim` impossible | holds |
| `finiteDimensional_dolbeaultCohomology` | Hopf surface | `h^(0,1) = 1` | no Kähler hypothesis needed | holds |
| `finrank_dolbeaultCohomology_serre` | Hopf `(0,1) ↔ (2,1)`, `(1,0) ↔ (1,2)` | `1 = 1`, `0 = 0` | `p, q ≤ n` guards `ℕ` subtraction | holds |
| `finrank_complexDeRhamCohomology_eq_sum_dolbeault` | elliptic, `k = 1`; `ℂP¹`, `k = 2`; `k > 2n` | `2 = 1 + 1`; `1 = 0 + 1 + 0` | `0 = 0` | holds |
| `finrank_dolbeaultCohomology_symm` | elliptic; Hopf | `1 = 1` | Hopf `0 ≠ 1`, excluded (`H² = 0`, no Kähler form) | holds |
| `even_finrank_complexDeRhamCohomology_odd` | elliptic; Hopf | `b₁ = 2` | Hopf `b₁ = 1`, excluded | holds |
| `hard_lefschetz` | `k = n`; curve, `k = 0`; `n = 0` | `L⁰ = id` | `[f] ↦ [fω]`, `∫ω > 0` | holds |
| `IsKahlerForm` | `dx∧dy`; `−dx∧dy`; `κ_ε` | `κ(1, i) = 1 > 0` | `−1`; `κ(∂_(x₁), ∂_(x₂)) = ε ≠ 0 = κ(∂_(y₁), ∂_(y₂))` | discriminates |
| `lefschetzPow` | `ω` on `ℂ²`, `j = 2`, `α = 1` | `2 dx₁dy₁dx₂dy₂` | `/j!` would give the volume form | holds |
| `DolbeaultCohomology` | `H^(1,0)` of a compact curve | image of cocycles: finite-dimensional | ambient quotient: infinite-dimensional | holds |
| `polydisc` Check (2.3) | `(0.9, 0.9)`, `(1, 0)` | polydisc: in, out | open ball: out, out; closed polydisc: in, in | Check now true |
| `ComplexDeRhamCohomology` (5.6) | `ℂ ∖ {0}` | `Per(dz/z) = 2πi` | `Log₋ − Log₊`: `0` upper, `2πi` lower | holds |
| 1.2 implicit map | `G = v² − z` at `(1, 1)` | `F = √(z+w)`, `F(1,0) = 1` | `−√(z+w)` gives `−1` | holds |
| 2.1 Cauchy estimate | `1/(1−z)`, `r = 1/2`, `ρ = 3/4` | error `2^(−N)` | bound `8(2/3)^N` | holds |
| 2.2 solver | `f = 1`, radial cutoffs; `f = q⁻¹`; `f = q̄` | `T(ψ)(z) = (2/z)∫₀^|z| r dr = z̄`; `u = q⁻¹ z̄` | `∂̄_q ∂̄_z u = 0 ≠ ∂̄_q q̄ = 1` | holds |
| 2.4 Čech `H¹` of `ℂ² ∖ {0}` | Laurent `z₁^a z₂^b` | `a < 0`, `b < 0` survive | others in `𝒪(ℂ*×ℂ)` or `𝒪(ℂ×ℂ*)` | holds |
| 2.4 two-polydisc clause | cross `Δ(1,ε) ∪ Δ(ε,1)` | `a_kk(g) = ε^(−2k)` | pieces give `O((ε(1−δ)²)^(−k))` | false (R08) |
| 3.4 chain | `n = 1` | `(z)`: length 0 | `(0) ⊂ (z)`: length 1 `= dim` | off by one (R09) |
| 3.5 extension | `z₁/z₂`; `Sing(z² = w³)` | unbounded, no extension | `{0}`, dimension `0 < 1` | holds |
| 4.1 section sheaves | `O(1)`, `O(2)` on `ℂP¹` | `h⁰ = 2` | `h⁰ = 3` | holds; no locator (R10) |
| 4.2 Chern connection | `h = e^(−φ)`; `h = (1+|z|²)^(−1)` | `A = −∂φ`, `Θ = ∂∂̄φ` | `∂∂̄ log(1+|z|²) = −2πi ω_FS` | holds |
| 4.2 gauge | `(∂̄ + a)(e^(−u) f)` | `0` iff `∂̄u = a` | `e^u f` gives `2a e^u f` | holds |
| 5.3 local structure | `δ`, `m = 2`; `δ′`; `1/(1+2x)` | `H₂ = x₊`; `u₁ = 1` | `⟨δ^(n)/n!, φ⟩ = 2^n`; `m = 1` discontinuous | holds |
| 5.6 forms | `dz̄ ∧ dz`; `dz/z − dz̄/z̄` | `2i dx∧dy = d(i(x dy − y dx))` | `2i dθ`, period `4πi` | holds |
| 5.8 components | two circles, ranks 1, 2 | `ker Δ_d` multiplicity 3 | one per component: 2 | holds |
| 5.9 volume | `ℂ²` | `ω²/2! = dx₁dy₁dx₂dy₂` | `|dz|² = 2`, anticommutators 1, 0, 2 | holds; no locator (R10) |
| 6.1 Kähler identities | Demailly VI (6.4) | `[Λ, d] = i∂̄* − i∂* = −(d^c)*` | `[L, d*] = d^c` by adjoint | holds |
| 6.1 `[Λ, L]` | `ℂ`, `k = 0`; `k = 2` | `1` | `−1`; source is VI (5.9), §5.2 | locator (R10) |
| 6.1 BKN | VII (1.2) vs (1.3) | four terms | `τ = 0` when `dω = 0` | holds |
| 6.1 `[iΘ, Λ]` | line on a curve, `iΘ = aω` | `(1,1)`: `a` | functions: `−a` | holds |
| 6.2 Hodge–Riemann | `f dz`; `f dz̄`; `ω₁ − ω₂` on `ℂP¹×ℂP¹` | `2∫|f|²`; `2∫|f|²` | `(−1)·(−2) = 2 > 0` | holds |
| 7.2 transport | `(1/√2, 1/√2)`; `(1,0)`, `(i,0)` | `[1:1]`, ratio 1 in both charts | same line, so the quotient is needed | holds |
| 7.2 cells | `χ(ℂP²)`; `ℝP^(2n)` model | `3`; 0-skeleton `[1:0:⋯:0]` | `1`, differential `±2` | holds |
| 7.2 `ω_FS` | `ℂP¹`, chart `U₀` | `(1/π)·2π·(1/2) = 1` | unnormalized: `π` | holds |
| 7.3 polygon | `aba⁻¹b⁻¹`; `cc`; `c₁c₁c₂c₂` | `H₁ = ℤ²` | `ℤ/2`; `ℤ ⊕ ℤ/2`; orientation-blind torus `ℤ ⊕ ℤ/2` | holds |
| 7.3 Hopf | weights `2^(a+b+1)`, `2^(1−m−n)` | `h^(0,1) = 1` (constants) | Betti `1,1,0,1,1` = row sums | holds; no locator (R10) |
| 8.2 reduction | Heisenberg over `ℤ[i]`; `{(0,0,c) : c ∈ ℤ}` | `A/(Γ∩A) = ℂ/ℤ[i]` | rank-1 intersection, quotient not compact | holds |
| 8.3 Iwasawa | `dz₃ − z₁dz₂` and its conjugate | `∂ = −dz₁∧dz₂ ≠ 0`, `h^(1,0) = 3` | `h^(0,1) = 2`, `b₁ = 4` (Sakane p. 197) | holds |

## Not verifiable

- 1.4's Newlander–Nirenberg route (webster-nn), 5.3's Theorems 2.3.4–2.3.5 (hormander-alpdo1, a sampled target) and 2.4, 5.7 and 5.10 (wells-dacm) cite sources recorded as uncertified in the manifest. They are cited by locator and their text was not read.
- #1398 is not in the open-pull-request index of `roadmaps list`. Its conflict with this folder is taken from `scratch/overlaps.md`.
- Ownership against open pull requests was checked with `roadmaps grep` over all 468 indexed heads, and with `roadmaps show` for #1234, #1797, #1807, #1854, #1027, #1028 and #903. It was not checked object by object for every target.

## Source issues

- **Misprint** in demailly-agbook at Chapter IV, (6.13), p. 216: the source refers to the Dolbeault–Grothendieck lemma as "Lemma I-2.9", but Chapter I's (2.9) is a proposition on currents. It should be I-(3.29). Affects nothing.
- **Misprint** in demailly-agbook at Chapter V, §11, before (11.5), p. 267: the source refers to the Dolbeault–Grothendieck lemma as "lemma I-2.11", but Chapter I's (2.11) introduces a smooth map `F : M₁ → M₂` for direct and inverse images of currents. It should be I-(3.29). Affects nothing.
