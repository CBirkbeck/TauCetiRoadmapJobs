# PORT-InverseGaloisAndArithmeticFundamentalGroupsPartII

## Result

- Branch: `roadmap/inverse-galois-and-arithmetic-fundamental-groups-part-ii`, from `42813dd`.
- Head commit: `5cf2ffdf` — "InverseGaloisAndArithmeticFundamentalGroupsPartII: roadmap (README, Suggested.lean, metadata)".
- Folder: `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder changed.

### Build

`lake build TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroupsPartII.Suggested`:

    Build completed successfully (18250 jobs).

Warnings: 2 `declaration uses 'sorry'` (`Suggested.lean:475:8` `hurwitz_homological_stability`,
`Suggested.lean:492:8` `uniform_betti_bound`). Lake also prints its module-system advisory
("imports `Mathlib` from package `mathlib`, which is designed for use with the module system;
consider adding `module`"), twice, once per build phase. The gate classifies that line as Lake's advisory, not a lint
(it is filtered with the `sorry` warning), and the file keeps the single `import Mathlib` header
the brief prescribes. No other warning, no error.

### Gate

    gate InverseGaloisAndArithmeticFundamentalGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

(The first run, before the commit, failed only on `dirty=1`: the untracked folder.)

### Dependency direction

    depcheck: 214 roadmaps, 1892 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This roadmap proves the homological stability theorem of Ellenberg, Venkatesh and Westerland for
Hurwitz spaces of branched covers of the disc with monodromy in a nonsplitting conjugacy class of a
finite group, and its arithmetic consequence: a bound `C^(i+1)` on the `i`-th étale Betti numbers
of the Hurwitz schemes over `𝔽̄_q`, uniform in the number of branch points. It is Part II of
InverseGaloisAndArithmeticFundamentalGroups, which builds the Hurwitz braid action, the braid-orbit
monoid, the topological and arithmetic Hurwitz spaces and their comparison one degree at a time,
and stops short of stability. The plan works backwards from the end theorems. The components of
all Hurwitz spaces form a graded noncommutative ring `R`, and a central sum `U` of constant blocks
stabilizes it (Layer 0). A Koszul-type K-complex then controls `U`-stability of any graded
`R`-module through two homology groups (Layer 1). The Hatcher–Wahl connectivity of the arc complex
of the punctured disc resolves each Hurwitz space (Layer 2), and the rows of the resulting spectral
sequence are K-complexes (Layer 3). An induction on homological degree gives stability with
constants uniform in the coefficient field, for marked, full-monodromy and unmarked Hurwitz spaces
and every finite group (Layer 4). Salvetti cell models then turn stability into uniform Betti
bounds, topological and étale (Layer 5). `Suggested.lean` states the two headlines that are
statable at the pins, `hurwitz_homological_stability` and `uniform_betti_bound`, in braid-group
homology with permutation coefficients, on Tau Ceti's `TauCeti.BraidGroup`. It names the étale
bound, EVW Theorem 4.2 and the arc-complex connectivity as not statable, with the carrier each
lacks.

## Dependencies still in pull requests

- InverseGaloisAndArithmeticFundamentalGroups (merge order line 53; this roadmap is line 225):
  §§IG.3.2, IG.5.1, IG.5.2, IG.5.3, IG.5.5. Every cited heading was resolved at its open head.

All other suppliers are on main: ReductiveGroups (Layer 11A, 11B), ClassifyingSpaces (Stage 4,
items 16–17), AlgebraicTopology (Layers 2, 4, 5, 8), GeometricTopology (Layers 1, 3, §§1.7.2,
3.3, 3.4), DGAInfinity (Layer 5). The eight declared gap contracts are unchanged.

## What moved from the Lean to the README

Nothing. The package file already met the form. It states the two headlines with only the data
they need. Every data declaration has a real body: the Hurwitz move and action, the fibres
`HurwitzFibre`/`UnmarkedFibre` with their actions, `shiftHom`, `glue`, `glueRepHom`,
`markedStabilizer`, `unmarkedGlueSum` and `unmarkedStabilizer`. Every proved theorem in the file
discharges a proof obligation of one of those bodies:

- `hurwitzMove_comm` and `hurwitzMove_braid` are arguments of `TauCeti.BraidGroup.lift`;
- `hurwitzAction_iff` and `hurwitzAction_comm` are used by `hurwitzFibre_prop_iff`,
  `hurwitzAction_shift` and `smul_conjFibre`;
- `glue_smul` and `unmarkedGlueSum_eq_of_mk_eq` are the equivariance fields of the two
  representation morphisms.

So none of them is padding. I checked each against the pinned Mathlib: there is no
`ConjClasses` closure-under-conjugation lemma to replace `conj_mem_carrier` (only
`mem_carrier_iff_mk_eq` and `Group.conj_mem_conjugatesOfSet` for `conjugatesOfSet`). The only Lean
edits are docstrings: the module docstring and `hurwitzAction` now say that the action is
InverseGaloisAndArithmeticFundamentalGroups §IG.3.2's, restated because a roadmap module cannot be
imported.

`#check @name` for all 36 declarations, elaborated once by appending the lines to the module and
building (then removed): every elaborated type matches its README statement. `markedStabilizer`,
`unmarkedGlueSum` and `unmarkedStabilizer` carry `[Fintype G]` and `[Field k]` in their own
signatures. Both headlines carry `IsNonsplitting c`, `[Fintype G]` and
`(Fintype.card G : k) ≠ 0`. The full-monodromy condition is the actual
`Subgroup.closure (Set.range tuple) = ⊤`. Nothing changed as a result.

## Supplier replacements and duplication removals

- **The Hurwitz action is the parent's.** §0.3 used to plan it as a target here ("Define … Prove
  far commutativity … define `hurwitzAction`"). InverseGaloisAndArithmeticFundamentalGroups
  §IG.3.2 *The Hurwitz braid action* plans the same object: `TauCeti.BraidGroup r →* Equiv.Perm
  (BranchTuple r G)` with `BranchTuple r G = Fin r → G`, the same moves and the same invariants. §0.3
  (now *The Hurwitz representation on the fibres*) consumes it and names the Lean copy, which the
  headlines need. The roadmap now owns only the fibres, the conjugation quotient and the
  equivariance facts on them. Scope records this.
- **AlgebraicTopology numbering.** Main renumbered Stages to Layers, with a mapping table, so the
  old citations were valid. All 20 citations now use the current numbering: Layer 2, §§4.1–4.3,
  §4.7, §5.1, §5.3, §5.5, §8.1, §8.2, §§8.3–8.5. The three AlgebraicTopology gap contracts say
  Layer 4/5/8.
- **CW approximation.** §0.5's route cited "CW approximation, AlgebraicTopology Stage 8".
  AlgebraicTopology lists CW approximation as a Tau Ceti supplier contract, so it is now cited
  directly from Tau Ceti, each checked at the pin:
  - `TauCeti.cwApproximation`, `TauCeti.cwApproximationMap` and
    `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap` (path-connected target), in
    `TauCeti/AlgebraicTopology/Homotopy/CWApproximation/Basic.lean`;
  - `ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`, in
    `TauCeti/AlgebraicTopology/Singular/Homotopy/WeakHomotopyEquivalence.lean`.

  The step in between is now stated in the sketch: the pulled-back cover maps to the original
  cover by a weak equivalence. A *From Tau Ceti* row was added.
- **Based-pair exact sequence.** It is now cited to AlgebraicTopology §8.1, which consumes Tau
  Ceti's `TauCeti.BasedTopPair` and `TauCeti.RelHomotopyGroup`.
- **`AlgebraicGeometry.Scheme.EllAdicCohomology`.** The Mathlib contract now says the declaration
  is not consumed (the pins have no Hurwitz scheme to apply it to). It used to be "recorded only to
  say what the pins contain".
- **Duplication sweep.** I searched by object across main and all 442 open heads (`roadmaps grep`):
  nonsplitting classes, arc complexes, Hatcher–Wahl, the mapping class group of the marked disc,
  Hurwitz stability, and homological stability in general. I also read the parent's IG.5 targets.
  - The parent's *Configurations and punctured-disc groups* explicitly excludes the identification
    of `B_n` with the mapping class group of the punctured disc, so §2.1 is not a duplicate.
  - The parent's *Component bound from finite étale degree*, *Fixed-degree uniform Hurwitz point
    estimate* and *The product-one component monoid* are fixed-`n`, product-one or arithmetic
    statements. None is §0.6, §0.8 or §5.2.
  - HomologicalStabilityOfGeneralLinearGroups names this roadmap as the owner of Hurwitz stability.
  - No other owner was found for the arc complexes, the coset model, the K-complex or the
    nonsplitting property.

  Nothing was removed.

## Fixes a reviewer would flag

1. **A false ownership claim in Scope.** The package said "The two statements have a single owner
   in the build order". With ArithmeticStatisticsPartVIII at merge-order line 146 and this roadmap
   at 225, both own EVW §§3–7, so that is false. The sentence is removed. The paragraph now states
   what each roadmap contains, that nothing here is cited from ArithmeticStatisticsPartVIII, and
   that every supplier here precedes it.
2. **§0.3 re-planned the parent's target.** Fixed as described above.
3. **§0.5's proof route named an input its citation did not supply.** The cited
   "AlgebraicTopology Stage 8" has no CW approximation of its own. Now named and pinned.
4. **Downstream consumers used build-order narrative.** "No roadmap on main or earlier in the
   build order consumes …" is replaced by one bullet per roadmap that mentions this one.

## Adversarial mathematics pass

The group computations were done by a scratch script: permutations composed right to left,
positive move `(a, b) ↦ (a b a⁻¹, a)`, braid orbits closed under moves and inverse moves, ranks by
exact Gaussian elimination. The other rows are hand computations. Here P = k[t], deg t = 1.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 `IsNonsplitting` | S₃ transp.; S₄ transp.; C₆ involution; A₄ 3-cycle class; trivial group | S₃: generates, every subgroup splits no pair → true. S₄: H = ⟨(12),(34)⟩ contains (12), (34), not H-conjugate → false. C₆: closure of {s} has order 2 ≠ 6 → false (generation). A₄: class of size 4, true. G = 1: true | definition separates the five cases as the Checks say | none |
| §0.2 involution class, `|G| = 2s` | D₅, D₇, D₉ (orders 10, 14, 18); C₆; S₄ | dihedral: one class of 5/7/9 involutions, nonsplitting true; C₆: unique involution, no generation; S₄: 24 = 2·12, two involution classes (sizes 6, 3) | correct; generation is an extra hypothesis | none |
| §0.3 positive move (parent's object, Lean `hurwitzMoveFun`) | S₃, (a, b) = ((12),(23)) | move → ((13),(12)), product (123) = (12)(23); inverse move → ((23),(13)); plain swap ((23),(12)) has product (132) | convention witnessed; swap excluded | §0.3 re-attributed |
| §0.3 fibres, `HurwitzFibre`, `UnmarkedFibre` | S₃ transp., n = 0…6; full and unmarked at n = 2 | braid orbits 1, 3, 5, 6, 6, 6, 6; n = 2 orbit sizes 1, 1, 1, 3, 3 with products 1, 1, 1, (123), (132); full fibre 6 points; conjugation classes on c² 2 (sizes 3, 6) | matches Checks and Worked examples | none |
| §0.4 `shiftHom`, gluing | n = 0; m = 1, n = 2; m = n = 2 | `shiftHom m 0 = 1` out of B₀; σ₀ ∈ B₂ ↦ σ_{1+0} = σ₁ native in B₃; castAdd indices ≤ m − 2 = 0, natAdd indices ≥ m = 2, difference ≥ 2 → commute | correct | none |
| §0.5 braid-group homology | G = 1; S₃, n = 2; X = S₂ | H₀ = k^(#orbits) = k⁵; PConf₂ ≃ S¹: H₀ = H₁ = k, trivial action on S₂ would give H₀ = k² | correct | route repaired (CW approximation) |
| §0.6 component ring | S₃, n = 2; G = 1 | dim R₂ = 5; r_(12) r_(23) and r_(23) r_(12) have products (123) ≠ (132), so R is not commutative; G = 1: R = k[t] | correct | none |
| §0.7 `U_D`, `markedStabilizer` | S₃, D = 1, 2 | U₁ = Σ r_g² has degree 2 (3 summands); U₁² contains (g, g, h, h), g ≠ h, outside the support of U₂ = Σ r_g⁴ (computed: true) | `U_{2D} ≠ U_D²` confirmed | none |
| §0.8 stability on components | S₃, U₁ : R_n → R_{n+2}, n = 0…4, over ℚ, 𝔽₅, 𝔽₃, 𝔽₂ | shapes 5×1, 6×3, 6×5, 6×6, 6×6; ranks ℚ/𝔽₅: 1, 3, 5, 6, 6 (bijective from n = 3); 𝔽₃: 1, 3, 3, 3, 3 (the S₃ stratum has coefficient |c ∩ S₃| = 3 = 0); 𝔽₂: full rank | theorem's permitted-field hypothesis is sufficient, and 𝔽₃ shows it is needed for this proof | none |
| §1.1 degrees, shift | k[1]₀; zero module | (k[1])₀ = 0, whereas ℕ-subtraction would read M_{0−1} = M₀ = k; deg 0 = −∞ ≤ b for all b | correct | none |
| §1.2 torsion, δ | P, U = t, M = P and M = k | M = P: kernel 0, P/tP = k → A = 0; M = k: M[U] = M/UM = k, Tor₁(k, k) = k[1] | correct | none |
| §1.3 change of rings | M = P | Tor_j^P(R̄, P) = 0 for j > 0, E² = Tor_i^{R̄}(k, R̄) = k (i = 0), 0 else | correct | none |
| §1.4 tensor estimate | N = k[2], M = k[3]; N = 0 | k[2] ⊗ k[3] = k[5], 5 ≤ 2 + 3; N = 0 gives −∞ | correct | none |
| §1.5 Tor over R̄ | R̄ = k[r]/(r²), deg r = 1 | minimal resolution P_i = R̄[i], Tor_i(k, k) = k[i], i ≤ i·1 + 0; generation degrees ≤ i·deg R̄ by induction (kernel of P_i → P_{i−1} sits in degrees ≤ (i+1) deg R̄) | correct | none |
| §1.6 A(M) ≤ δ + A1 | general; P, U = t, M = k | deg M[U] ≤ max(deg R[U] ⊗ M, δ − a) ≤ max(A1 + δ, δ − a); deg M/UM ≤ δ ⇒ A ≤ δ + A1; example 0 ≤ 1 + 1 | correct | none |
| §1.7 higher Tor | P, U = t², M = k | R̄ = k[t]/t², Tor₀ = k, Tor₁ = k[2], higher 0; δ = 2, A1 = 2: 2 ≤ 4 | correct | none |
| §1.8 Nakayama | k[t, t⁻¹] over P; V = R̄ | Laurent module has zero coinvariants, nonzero → lower bound needed over R; deg R̄ ≤ 0 + deg R̄ | correct | none |
| §1.9 δ bound | P, U = t; M = k, M = P | M = k: δ = 1 ≤ max(0, 1) + 4 = 5; M = P: δ = deg R̄ = 0 ≤ 4 | correct | none |
| §1.10 general Tor bound | N = M = k over P | Tor₁ = k[1]: 1 ≤ 0 + 1 + 1 + 4 | correct | none |
| §1.11 K-complex, d² = 0 | S₃, K(R) chains of length ≤ 3 on degree-1 coefficients; A₄ g = (123), h = (134) | d² = 0 on all S₃ instances (0 failures); with conjugation h g h⁻¹: products h² g h⁻¹ ≠ g h (computed) and g does not commute with h², so the terms do not cancel; correct convention: h (h⁻¹ g h) = g h | convention pinned by a nonabelian witness | none |
| §1.13 generator homotopy | S₃, q ≤ 2, coefficient of length ≤ 1, every g | d S_g + S_g d = right multiplication by r_g: 156 instances, 0 failures; constant prefix model: 6 of 9 instances on (∅; r_h) fail (all h ≠ g) | correct; wrong model excluded | none |
| §1.14–1.15 regular K-homology | P | d: K_{q+1} → K_q is t for q even, 0 for q odd; H_q = k in degree q (q even), 0 (q odd); q ≤ A2 + q = 2 + q | correct | none |
| §1.16 universal coefficients | M = k, q = 3 | H₃K(k) = k[3]: 3 ≤ 1 + 3 + 4 + 2 = 10; with the source's A1 = 0, A2 = 1: bound 2 < 3 | package constants needed (source erratum recorded) | none |
| §1.17 low K vs Tor | M = k, G = 1 | H₂K(k) = k[2], Tor₂^P(k, k) = 0 (global dimension 1) → only degrees 0, 1 compare | correct | none |
| §1.18 higher K-homology | M = k | h₀ = 0, h₁ = 1, h_q = q ≤ 1 + 7q; both low groups zero ⇒ k ⊗ M = 0 ⇒ M = 0 (nonnegative grading) | correct | none |
| §1.19 stabilization | M = P, b = 0; general | t : P_n → P_{n+1} bijective for all n ≥ 0; A(M) ≤ b + 5A1 < b + 6A1 + a = b + A0 | correct | none |
| §2.1 Mod(D, P) ≅ B_n, convention witness | n = 0, 1, 2; ∗ = −i, P₁ = 0, P₂ = 1/√2 | n = 2: boundary-free model is Mod of a sphere with 3 points fixing one, ℤ/2, so the half twist has order 2 there vs infinite order in Mod(D, P) ≅ ℤ; pointwise-P model gives 2ℤ. With h_*(γ₁) = γ₂, h_*(γ₂) = γ₂⁻¹γ₁γ₂: h_*⁻¹(γ₁) = γ₁γ₂γ₁⁻¹, so f∘h_*⁻¹ = (a b a⁻¹, a); h_*(γ₁γ₂) = γ₁γ₂ (boundary fixed) | positive move = push-forward; consistent with §0.3 | none |
| §2.2 arc order | ∗ = −i, P₁ = 0, P₂ = 1/√2 | directions from ∗: arguments 90° (P₁) and arctan √2 ≈ 54.7° (P₂); P₁ first in clockwise order, deleted by ∂₀ | correct | none |
| §2.3–2.4 coset model | n = 0, 1, 2, 3 | A(0) = ∅; A(1)₀ = pt, A(1)₁ = ∅; A(2)₀ = A(2)₁ = B₂ ≅ ℤ, faces of b: bσ₁, b; n = 3, q = 0: L = ⟨σ₂⟩ (native 1) | correct, truncation needed at n = 1 | none |
| §2.5 stabilizers, face formula | n = 2, q = 1 | stabilizer trivial; σ₁·a₀ = a₁, so ∂₀ v₁ = s_{1,0} v₀ = a₁ and ∂₁ v₁ = a₀ | correct with clockwise order | none |
| §2.6 connectivity | n = 1, 2; join S⁰ * S⁰ | point (−1-connected), real line (0-connected); S¹: 0 = −1 + (−1) + 2 | correct | none |
| §3.1 modules M_p | G = 1; nontrivial G, full | (M₀)₀ = k; full-monodromy (M₀)₀ = 0 since CHur₀ = ∅ | correct | none |
| §3.2 Borel resolution | n = 0, 1 | n = 0: ∅ → pt, H₀ ranks 0 vs 1 (excluded); n = 1: fibre a point | stated for n ≥ 2 | none |
| §3.3 rows = K-complexes | q = 1, i = 0, ((12),(23)) | inverse move: ((23),(13)) → ((23); (13), x), and (12)^{(23)} = (23)(12)(23) = (13) = the K-differential prefix; positive move gives ((13); (12), x), which does not match | correct face braid s⁻¹ | none |
| §3.4–3.5 arc spectral sequence, edge sequence | G = 1, p = 0, n = 1 | coker(K₂ → K₁)₁ = k (K₂ starts in degree 2), H₁K(P)₁ = 0; sequence 0 → 0 → k → k → 0 → 0 | correct; column zero is a cokernel | none |
| §4.1 inductive bound | indices | E²_{j,P+1−j}: A2 + A0(3(P+1−j) + j + 1) = A2 + A0(3P + 4 − 2j) ≤ A2 + 3A0P for j ≥ 2; E²_{j,P−j}: ≤ A2 + A0(3P − 1) for j ≥ 1; n > 2 + 21P ⇒ P < n − 2 | correct | none |
| §4.2 marked stability | G = 1, D = 1 (A1 = 1, A2 = 2, A0 = 7, A = 21, B = 11); p = 1 | p > 0: n ≥ 21p + 12 ≥ b + A0 = 21p + 9; p = 0: n ≥ 12 ≥ A2 + 1 + A0 = 10. Threshold necessary: H₁(B₁; k) = 0 → H₁(B₂; k) = k is not bijective | correct; headline not vacuous | none |
| §4.3 full monodromy | S₃, H of order 2 | |c ∩ H| = 1, diagonal coefficient 1 (not 3); the 𝔽₃ computation in §0.8 keeps exactly the three order-2 strata (rank 3) | correct, source (6.1.6) erratum recorded | none |
| §4.4 conjugation quotient | S₃, n = 2; C₂ on S² over 𝔽₂ | H₀ marked dim 5 → conjugation coinvariants 2 = #classes of c² up to braids and conjugation = unmarked dim 2; ℝP²: H₁ = 𝔽₂ vs H₁(S²)_{C₂} = 0 | correct; invertibility needed | none |
| §4.5 unmarked stability, `unmarkedStabilizer` | S₃, a = (12), b = (23), m = 2, n = 1 | single summand: (a) ↦ (a, a, a), (b) ↦ (a, a, b), not conjugate; full sum for either input: [(t, t, t)] + 2[(t, t, t′)] (S₃ acts simply transitively on ordered pairs of distinct transpositions) | sum descends, single gluing does not | none |
| §5.1 cell models | n = 2, 3; transport | 2^{n−1} cells: (1, 1) circle, (1, 2, 1) presentation complex of B₃; 0 ↦ 0, 1 ↦ 1/√2, 2 ↦ 2/√5; cover of degree ≤ |G|ⁿ: ≤ 2^{n−1}|G|ⁿ ≤ (2|G|)ⁿ | correct | none |
| §5.2 uniform Betti bound, `uniform_betti_bound` | general exponent; S₃, i = 0 | (A + B + a + 1)(i + 1) − (Ai + B + a) = (B + a + 1)i + A + 1 > 0; S₃ H₀ dims 1, 3, 5, 6, 6, 6, 6 bounded | correct; `C` chosen before field, i, n | none |
| §5.3 étale bound | G = 1, n = 0, 1; S₃, n = 2, q = 5, ℓ = 7 | G = 1: dims 1 at (0, 0), else 0 (scheme empty for n ≥ 1) while Conf₁ has H₀ = k → identity case treated separately; S₃: all 6 generating pairs have 3-cycle product, CHur₂/G one point; 7 > max(6, 5, 2) | correct | none |

Context and generality: both headlines carry `hc : IsNonsplitting c` and the field hypothesis as
explicit binders. `G` and `k` are in `Type`, as the Conventions say. The README states §§4.2–4.5
and §5.2 at the same generality as the Lean (every finite `G`, every permitted field, both values
of `full`). No hypothesis contains its conclusion. `m` in `hurwitz_homological_stability` is tied
to the class by `0 < m` and `g ^ m = 1` on `c`.

## Ownership against open pull requests

Checked with `roadmaps grep` and `roadmaps show` over main and the 442 open heads, by object (see
the duplication sweep above). Overlaps tool: no open pull request changes this roadmap or drops an
id it cites.

## Unresolved

- **ArithmeticStatisticsPartVIII §5.16.** It states the component-ring stability, the graded
  `Tor` spectral sequences, the K-complex bound, the arc spectral sequence, EVW Theorem 6.1, the
  centreless Corollary 6.2, the cell models and the étale bound. This roadmap states the same
  theorems in larger generality. ArithmeticStatisticsPartVIII is earlier in the merge order
  (line 146 against 225), so under the single-owner rule it would be the owner. Earlier rounds
  recorded the dispute as settled for this package by a board decision, and the accepted review
  kept it. This port keeps that decision and does not cite or import ArithmeticStatisticsPartVIII.
  The decision itself was not supplied, and the overlap remains. Every supplier of this roadmap
  precedes line 146, so the board can resolve it by moving this roadmap before
  ArithmeticStatisticsPartVIII and having its §5.16 cite this roadmap.
- **Source observations not added.** The accepted review lists EVW16 observations that are not in
  "Notes on the sources": the bound inside the proof of Lemma 4.6 (EVW16 line 863), and the
  retraction composition and "Dehn twists" wording in the proof of Proposition 5.6 (EVW16
  lines 1191–1195, 1214). The cached EVW16 text was not available to this job, so those locators
  were not re-verified and the notes were not added. The review marked them as observations, not
  requests. The README's §1.6 bound already absorbs the Lemma 4.6 point; I recomputed it in the
  table above.
- **Line length.** 23 README lines from the package exceed 100 characters, the longest being the
  117-character title (Unicode count). The gate does not check this, and they were left as they are.
- **Suspicious passages.** No fetched or read text asked for any action outside the job.


Pull request: #2263 (roadmap/inverse-galois-and-arithmetic-fundamental-groups-part-ii at 5cf2ffd)
