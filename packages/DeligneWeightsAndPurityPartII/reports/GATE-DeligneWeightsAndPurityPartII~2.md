# GATE-DeligneWeightsAndPurityPartII~2: answers to human review

Five unanswered comments by riccardobrasca (one review body and four inline comments), six points
(H01–H06). Commit `cdacab30` on top of `470e5da`, not pushed. Only
`TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md` changed (12 lines rewritten in place, no
line added or removed); `Suggested.lean` is unchanged. Line numbers below are the README at
`cdacab30`; they are the same as at `470e5da`.

## H01 (riccardobrasca) — answered

The review body lists the four repairs answered in H02–H05 and observes that `Suggested.lean`
contains no theorem declarations. That is intended: its module docstring names each headline (Scholze's
Theorem 9.6 and its corollaries, Deligne's equal-characteristic theorem, the tilting transfer, Ito's
uniform neighbourhood theorem) and the carrier it lacks at the pins. Neither pinned library has ℓ-adic
étale cohomology of varieties with its Galois action, a monodromy filtration or a Weil-number
predicate: a search of the pinned Mathlib and Tau Ceti for `MonodromyFiltration`, `IsWeilNumber`,
`weightMonodromy` and `EtaleCohomology` finds nothing.

## H02 (riccardobrasca) — applied

README line 637, the route of the uniform annular direct-image target. Old: "Shrink the disc until
the separable Galois part of Z_K is finite étale over it. That part is the normalization of Y_K in
the separable closure of its function field". New: the separable closure need not be Galois, so π
is first dominated by π′ : Z′ → Z → Y, with Z′ → Z proper surjective, Z′ integral, Z′_K smooth and
finite over Z_K, and the separable closure of the function field finite Galois. Adaptedness carries
over because both nearby-cycle properties are stable under base change (ITO20 line 1608). W is the
normalization of Y_K in that Galois extension. The disc is shrunk until its *punctured* disc lies in
the open set where W → Y_K is finite Galois étale; ramification at the centre persists for T ↦ S³
(ITO20 line 1619). Each annular component is Galois over its annulus, with group its stabilizer,
which is what the factorization through "a finite Galois étale map" and the annular sheaf comparison
need.

The same passage had a second gap, which the repair closes. Tameness and overconvergence are proved
on d(Ẑ′), not on the analytic W. Z′_K → W is finite, radicial and surjective, so the map from d(Ẑ′)
to the analytic W is a homeomorphism with purely inseparable extensions of completed residue fields,
and both properties pass to W (ITO20 line 1654). The References entry for ITO20 now lists line 1608,
line 1619 and line 1654.

## H03 (riccardobrasca) — applied

The bijectivity is repaired where the inverse is formed, §4.2 (line 764), with a pointer in the
§4.6 route (line 852). Old: §4.6 applied §3.6 to the integral equation model, and §4.2 inverted
"restriction from `Ỹ_C` to `Y_C^ad`". Neither said that §3.6 compares the tube with the model's
generic fibre `Y_eq` (the scheme-theoretic intersection of the c hypersurfaces over K). `Y_eq` has
`(Y_eq)_red` = `Y_K` and may be nonreduced, for example a double hyperplane. New: the tube stays the
one cut out by the equations, which §4.1 needs for the section-domain approximation (§3.1,
AnalyticToricGeometryPartII §5.1). The restriction to `Y_C^ad` is the composite of the bijective
restriction of §3.6 to `(Y_eq)_C^ad` with restriction along the thickening `Y_C^ad` ⊆ `(Y_eq)_C^ad`.
Algebraic–adic comparison for the proper `Y_eq` and Y carries the second map to restriction along the
thickening `Y_C` ⊆ `(Y_eq)_C`, which is bijective by étale topological invariance
(EtaleCohomologyFoundations §F.0.4, on main, consuming SchemeAndStackFoundations §0.23a; Stacks
04DZ). Both restrictions are site pullbacks defined over K, so G-equivariance and the cup-product
compatibility of §3.5 hold.

The letter W, which the comment uses, is already §§4.1 and 4.3's name for the integral image of g,
so the README calls this fibre `Y_eq`. The new citation is entered in §4.2's *Needs*, in the Layer 4
Dependencies (line 899) and in the EtaleCohomologyFoundations supplier contract (line 953). The
ClassicalAdicEtaleCohomology contract (line 969) now names `Y_eq` among the proper varieties whose
comparison is used.

## H04 (riccardobrasca) — applied

Line 337, §1.1 Check. Old: "Points of good reduction (f extends smoothly over x) give N = 0".
New: "f extends to a proper smooth morphism over x, as in §0.10". The comment's instance is added in
the same bullet as a negative control. Deleting the node (0,0) of the fibre y² = x²(x − 1) at λ = 0
leaves a flat morphism over C = ℙ¹ ∖ {1, ∞} whose fibres are all smooth, so it is smooth but not
proper. Its generic fibre is unchanged, and its H¹ still has N ≠ 0. No other passage has the defect:
§§0.8, 0.9, 0.10 and 1.2 already say "proper smooth".

## H05 (riccardobrasca) — applied

Line 874, §4.7 API (stated "for every field k and n ≥ 0"). Old: "O(−D₀) has no nonzero section".
New: "For n ≥ 1, O(−D₀) has no nonzero global section; for n = 0 it is O, with global sections k".
For n ≥ 1 no u ∈ ℕⁿ has −Σuᵢ ≥ 1. For n = 0, Σ₀ has no ray, D₀ = 0 and both bundles are O on
Spec k. The n = 0 Check (line 884) now records this as a negative control: O(−D₀) = O has the nonzero
section 1.

## H06 (riccardobrasca) — applied

Same line 874. Old: "The sections of O(D₀) are the characters χ^u … matching the n + 1 sections of
O(1)". New: these characters "form a k-basis of the global sections of O(D₀), corresponding to the
basis x₀, …, xₙ of the global sections of O(1)", and for n = 0 the basis is the character 1. The
pattern is also repaired in the Σ₂ Check (line 882): old "O(D₀) has the three sections 1, x₁/x₀,
x₂/x₀", new "the global sections of O(D₀) have the basis 1, x₁/x₀, x₂/x₀".

## Build and gate

- `lake build TauCetiRoadmap.DeligneWeightsAndPurityPartII.Suggested`: `✔ [18238/18239] Built
  TauCetiRoadmap.DeligneWeightsAndPurityPartII.Suggested (10s)`, `Build completed successfully
  (18239 jobs).`
- Gate after the commit: `gate DeligneWeightsAndPurityPartII: set_option=0 blob=0 latex=0 tex=0
  prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The first run, before the commit,
  reported `tex=1` at line 637 for the subscript `×_{Y_K}`. That phrase now reads "the fibre product
  of d(Ŷ) and W over Y_K".
- Dependency check: `depcheck: 19 roadmaps, 217 edges, 0 problem(s)`. There is no UPWARD and no
  CYCLE line.

## Lean signatures

`Suggested.lean` declares nothing, so there is no declaration to `#check`. No elaborated signature
was compared, and none changed.

## Ownership, citations and sources

- No new target, definition or carrier is added. The two new route steps, the Galois domination and
  the thickening, are proof inputs of existing targets. The only new cross-roadmap citation is
  EtaleCohomologyFoundations §F.0.4, which exists on main (`## F.0.4 Étale topological invariance`).
  No open roadmap pull request revises EtaleCohomologyFoundations, so no open pull request drops the
  id.
- No new source key. ITO20 is cached, and its new locators (line 1608, line 1619, line 1654) were
  read in the cached text, proof of Theorem 6.10, pp. 36–37. The comment's Stacks reference (04DY) is
  used through the supplier, which cites Stacks 04DZ. Nothing was added to `needs-references.toml`.
- The review text contained no instructions outside its mathematical requests.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.4 route: Galois domination keeps adaptedness | π′ = π when the separable closure is already Galois; T ↦ S³ with π = f, residue characteristic ≠ 2, 3 | K(S)/K(S³) is Galois of degree 3 because μ₃ ⊆ K and char K ≠ 3; π′ = π, and the nearby-cycle stalks are unchanged | holds | added |
| §3.4 route: W → Y_K is finite Galois étale over the punctured disc only | T ↦ S³ | the fibre over T = 0 is one point with e = 3, the fibre over T = c ≠ 0 is three points; at every radius the cover is étale on B(ε)∖{0} and ramified at 0 | "over the punctured disc" is needed; "over the disc" was false | corrected |
| §3.4 route: components over an annulus are Galois | Galois cover of degree 3 restricted to B(a,b), T ↦ S³ | one component B(a^(1/3), b^(1/3)) with stabilizer μ₃ of order 3 | holds | added |
| §3.4 route: tameness passes from d(Ẑ′) to the analytic W | Z′_K = W (separable case); Z′_K → W purely inseparable of degree p in characteristic p | the map is the identity in the first case; in the second, residue-field extensions are purely inseparable, so the Galois groups of the henselized completed residue fields agree | holds | added |
| §4.2: restriction `Ỹ_C` → `Y_C^ad` is bijective | c = 0 (`Y_eq` = Y = X_Σ); Y = V(x₀) ⊆ ℙ¹ with equation x₀² | first case: the thickening step is the identity. Second case: `Y_eq` = Spec k[x₀]/(x₀²), and H⁰ = ℤ/n on both `Y_eq` and Y, with 1 ↦ 1; Hⁱ = 0 for i > 0 | holds | added |
| §4.2: thickening restriction is G-equivariant and multiplicative | double hyperplane above | restriction sends 1 to 1 and a·b to a·b; σ ∈ G_K acts trivially in degree 0 on both sides | holds | added |
| §1.1 Check: good reduction needs a proper smooth extension | Legendre y² = x(x−1)(x−λ), p odd, node removed at λ = 0 | the fibre at 0 minus (0,0) is smooth and the morphism is flat, so the extension is smooth; it is not proper; the generic fibre has N ≠ 0 with grades −1 and 1 of weights 0 and 2 | old Check false, new Check true | corrected, negative control added |
| §4.7: characters form a basis of H⁰(O(D₀)) | n = 0, 1, 2 | n = 0: {1}, dimension 1 = h⁰(ℙ⁰, O); n = 1: {1, x₁/x₀}, dimension 2; n = 2: {1, x₁/x₀, x₂/x₀}, dimension 3 = h⁰(ℙ², O(1)); the section x₁/x₀ + x₂/x₀ is a combination, not a character | holds as a basis statement | corrected |
| §4.7: H⁰(O(−D₀)) = 0 | n = 0, 1 | n = 1: −u₁ ≥ 1 has no solution in ℕ, so 0 = h⁰(ℙ¹, O(−1)); n = 0: O(−D₀) = O, so h⁰ = 1 | false at n = 0 | restricted to n ≥ 1; n = 0 Check added |
