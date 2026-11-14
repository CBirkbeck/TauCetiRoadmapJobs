# DESIGN-SpectralSequencesAndConvergencePartII: design report

Design of `SpectralSequencesAndConvergencePartII`, the Part II of `SpectralSequencesAndConvergence`.
Files: `packages/SpectralSequencesAndConvergencePartII/design/README.md`,
`packages/SpectralSequencesAndConvergencePartII/design/plan.json`,
`packages/SpectralSequencesAndConvergencePartII/sources.toml`. Six layers, 24 targets, 85 tests, 0 gaps.

## What the design covers

| Layer | Targets | Content |
| --- | --- | --- |
| 1 Double complexes | 1.1–1.5 | product totalisation; column and row filtrations, `′E`, `″E := ′E(flip)`, first and second pages; convergence for finite antidiagonals (base §5.3), for `Tot^⊕` (base §5.4) and for `Tot^Π` (base §7.5); comparison of totals; acyclic assembly in eight cases plus augmented forms |
| 2 Resolutions and hyper-derived functors | 2.1–2.6 | horseshoe and relative horseshoe; `RⁿF` of `rightDerivedFunctorPlus` with the comparison to `Functor.rightDerived`, vanishing, truncation, Leray's acyclicity lemma; Cartan–Eilenberg resolutions (existence, split rows, total complex, lifting); first and second hypercohomology spectral sequences with independence, naturality and the descent of `″E` to `D⁺`; F-acyclic resolutions; duals through `𝒜ᵒᵖ` |
| 3 Composite functors | 3.1–3.4 | composition transformation and Grothendieck's criterion (with the effaceability form); composite-functor sequence of a complex in `D⁺`; five-term and extended sequences, naturality in the functors; right exact and mixed-variance composites |
| 4 Tor and Ext | 4.1–4.4 | balancing Tor in a monoidal abelian category; universal-coefficient sequences (Tor form for unbounded complexes, covariant and contravariant Ext forms); Künneth spectral sequence on `D⁻`; three change-of-rings sequences |
| 5 Products | 5.1–5.3 | Massey's conditions and the Leibniz rule on every page of an exact couple; pairings of filtered complexes; pairings of double complexes with the sign rules and the flipped pairing |
| 6 Bockstein | 6.1–6.2 | Bockstein exact couple and its identification with the `f`-adic filtration of `M[1/f]`; towers, higher universal-coefficient sequences, higher Bocksteins, stabilisation, limit page, (weak) convergence criterion |

### Generality and route decisions (against the triaged target)

- **Half-plane convergence.** The target's four half-plane cases became two conditions per
  totalisation, stated per total degree: `K^{p,n−p} = 0` for `p ≫ 0` (for `′E` on `Tot^⊕`) and for `p ≪ 0`
  (for `′E` on `Tot^Π`, with regularity), and their flips. Each half-plane is an instance. Generality: the
  classes in which base §5.4 and §7.5 hold; `ModuleCat R` is in both.
- **Acyclic assembly** is stated in eight cases. Converting Weibel's homological indexing
  (`C_{p,q} = K^{−p,−q}`) gives his four cases among them; the other four follow by the same
  argument. The staircase double complex (README 1.1) is a computed counterexample to each
  over-generalisation and separates `Tot^⊕` from `Tot^Π` (`H⁰ = 0` against `ℤ`).
- **Cartan–Eilenberg uniqueness up to homotopy is not planned.** No final target needs it: the
  independence and naturality of both hypercohomology sequences follow from the existence of lifts,
  since a morphism of spectral sequences is determined by one page (the `comm` field of Mathlib's
  `SpectralSequence.Hom`) and the page-1 (resp. page-2) components `R^qF(f^p)` (resp.
  `R^pF(H^q f)`) do not depend on the lift. Grothendieck's own argument (grothendieck1957 line
  1523–1529) is of this form. No open source writes the homotopy uniqueness out.
- **Relative horseshoe in a stronger form.** The source side may be any short exact sequence of
  resolutions (not necessarily split, not necessarily injective); the target side is a degreewise
  split sequence of injective resolutions. The proof uses only Stacks Lemmas 18.4, 18.6, 18.7
  (stacks-05QI line 3269–3378). This gives both the lifting of chain maps between Cartan–Eilenberg
  resolutions and the comparison of Grothendieck's F-acyclic variant (grothendieck1957 line
  1295–1298) with the injective one.
- **Duals.** Through `𝒜ᵒᵖ` and Mathlib's `CochainComplex.opEquivalence`, not through new projective
  constructions; Mathlib has no `D⁻` left derived functor at the pin.
- **Tor balance** moved from Layer 1 to Layer 4 (4.1) and is stated in a monoidal abelian category
  with exact tensoring by projectives. The triage's "Tor needs a symmetric monoidal category" is
  inaccurate: Mathlib's `CategoryTheory.Tor` needs only `MonoidalCategory`, `MonoidalPreadditive` and
  `HasProjectiveResolutions` (`Mathlib/CategoryTheory/Monoidal/Tor.lean`); module Tor needs `R`
  commutative because the monoidal structure on `ModuleCat R` does.
- **Universal coefficients, Tor form**: extended to unbounded `K` through `Tot^⊕` and 1.3(b);
  Stacks states it for bounded-above `K` (stacks-more-algebra line 7121–7134).
- **Künneth on `D⁻`**: Stacks proves `D^b` through filtered K-flat resolutions (line 7382–7412). The
  design uses instead the filtered complex `Tot(P) ⊗ L` with `P` a projective Cartan–Eilenberg
  resolution of `K`, filtered by resolution degree; `E₁` by the Künneth isomorphism for split complexes,
  `E₂` by balance 4.1. Convergence is degreewise finite (base §5.3).
- **Change of rings (a)** follows Stacks's route (4.2(a) over `S` applied to `P ⊗_R S`), not the
  composite-functor route of the target. **(c)** is stated for commutative `R`, `S`:
  `ModuleCat.extendScalars` and `ModuleCat.extendRestrictScalarsAdj` exist only for commutative rings at
  the pin (`Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean` line 399, 878). **(b)** holds for
  any rings (`coextendScalars`, line 519, 658).
- **Products.** 5.1 (exact couples) is the route to 5.2 (filtered complexes), as in May's primer.
  Douady's products of spectral systems (proof "left to the reader", douady1959 line 165–166) and
  products on hypercohomology and composite-functor sequences (no written source) are not planned.
  The sign rules for pairings of double complexes in Mathlib's convention are computed and pinned:
  `d₁(xy) = d₁x·y + (−1)^{p+q} x·d₁y`, `d₂(xy) = (−1)^{p′} d₂x·y + (−1)^q x·d₂y`, flipped pairing
  `(−1)^{pq′+p′q}`.
- **Bockstein.** `f` need only act injectively on the terms of `M`; `f` need not be a nonzerodivisor of
  `A`. The open source for the higher universal-coefficient sequences and the limit page is May's
  primer Example 2.3 (may-primer line 136–168), which the triage did not locate. The convergence
  statement is phrased for the canonical comparison: base §3.2's structures carry arbitrary
  isomorphisms (the issue found in the base's round-4 review), so "converges weakly iff" is stated as
  "the canonical comparison is an isomorphism iff".

### Not planned, with reasons

- uniqueness of Cartan–Eilenberg resolutions up to homotopy of double complexes (see above);
- Grothendieck's Proposition 2.5.5 and Corollaire (commuting squares with resolving functors,
  grothendieck1957 line 1530–1570): no final target or consumer needs it, and its source generality is
  that of resolving functors;
- Douady's spectral-system products and products on hypercohomology / composite sequences (no
  written proof; CohomologyOfGroups obtains the multiplicativity of its extension sequence through
  filtered-complex pairings, 5.2);
- stacks-012K Lemmas 26.2 and 26.3 (tags 09IZ, 09J0: resolutions with exact kernel or cokernel
  complexes), used by Stacks for K-flat resolutions that Tau Ceti already has;
- the unbounded hypercohomology sequences for functors of finite injective dimension (signalled
  without proof at grothendieck1957 line 1299–1304; the target already excluded it).

## Ownership

- **Against main and the open roadmap pull requests** (`roadmaps grep` over main and 455–468 open
  heads, by object): product totalisation (only the Hom-complex and cosimplicial totalisations of
  DerivedModuleAlgebra, PerfectoidSpaces, DerivedDeRhamCohomology and RefinedTraceMethods; none states
  the product total complex of a double complex); Cartan–Eilenberg resolutions (only inside the proof
  routes of ArithmeticGaloisDuality §D7.1 and NoncommutativeAndEquivariantIwasawa); horseshoe lemma
  (GrothendieckEulerForms on main and Tau Ceti `TauCeti.ExactStructure.FiniteResolution.horseshoe`: finite
  projective resolutions in exact categories, not injective resolutions in an abelian category);
  Bockstein spectral sequence (no match); Künneth spectral sequence (AlgebraicTopology §5.1: the
  singular-chain instance; EllipticCohomology: a Künneth spectral sequence of spectra, a different
  object; TorsionCohomologyInfrastructure: a consumer); acyclic assembly (no match); Tor balance (no
  match); multiplicative spectral sequences (TangentialBordism uses them abstractly; DGFloer Layer 1
  item 2 owns the Serre instance); hypercohomology/hyperhomology (SchemeKTheoryOperations §6.7 owns the
  group-hyperhomology instance; K3BlochGroups, EtaleDualityAndPerverseSheaves, ArithmeticKTheory,
  InverseGaloisAndArithmeticFundamentalGroupsPartII use instances); composite-functor sequence
  (ArithmeticGaloisDuality §D7.1 owns the object case and is imported; CrystallineCohomology uses
  SchemeAndStackFoundations §2.2's Leray sequence and owns no general one).
- `roadmaps overlaps` for ArithmeticGaloisDuality and DerivedModuleAlgebra: no open pull request
  changes them or drops an id cited here.
- No declaration name proposed in `plan.json` is the fully qualified name of a declaration of a
  roadmap I could read (DerivedModuleAlgebra uses the `DoubleComplex.*` namespace; this design uses
  `HomologicalComplex₂.*`, `CategoryTheory.Functor.*`, `ModuleCat.*`, `CochainComplex.*` with new names).
- **Tau Ceti and Mathlib at the pins** were grepped for the objects: no product total complex
  (`totalProd`, `TotPi`, `productTotal`: no match), no Cartan–Eilenberg resolution, no `Tor ≅ Tor'`
  (Mathlib's file records it as missing), no comparison of `Functor.rightDerived` with
  `rightDerivedFunctorPlus` (Mathlib's documentation records it as missing), no injective horseshoe,
  no Bockstein spectral sequence (Tau Ceti has only first-order Bockstein maps of continuous
  cohomology).
- Every backticked Mathlib and Tau Ceti name of the README was checked by hand at the pins (the
  resolver cannot check them on this host); all exist, with the namespaces cited.

## Notions moved down from later roadmaps

None. No notion of a later roadmap is needed.

## The base and the merge order

The base `SpectralSequencesAndConvergence` is a board design, not in `ORDER.txt` and not on main;
the dependency tool does not see it. When accepted it is inserted after its last supplier
(StableHomotopyKTheory, line 17), before ArithmeticGaloisDuality (line 61), after which this roadmap is
placed. Every base section cited here (§§1.3, 1.4, 2.1, 2.2, 3.1–3.6, 4.3, 5.1–5.4, 6.1–6.3, 7.4, 7.5)
exists in the base design README on the board. The base's last review (round 6) has findings on the
limit side of §7.4, the restricted recipes of §4.1, §1.1's identity presentation, a §5.3 Check and an
example; none touches what this design uses (the colimit side, §7.5, §5.4, §4.3, §6.2). If the base
renumbers its sections, the citations here follow.

## Proposed Part IIs

- **Products on derived-functor spectral sequences**: pairings on the hypercohomology and
  composite-functor spectral sequences compatible with the abutment product, through the filtered
  derived category (Stacks §13.26) or multiplicative resolutions; and Douady's spectral-system products
  with a written proof.
- **Spectral-object form of the Grothendieck spectral sequence**: the second hypercohomology and
  composite sequences as spectral sequences of Mathlib's `CategoryTheory.Triangulated.TStructure.spectralObject`
  pushed through `RF`, with naturality on `D⁺` for free, and their comparison with the
  Cartan–Eilenberg construction here; and the filtered derived category with the uniqueness of
  Cartan–Eilenberg resolutions.
- **Noncommutative change of rings** once Mathlib has extension of scalars for noncommutative rings.

## Gaps

None declared: every prerequisite is a pinned declaration, a section of a roadmap on main or earlier
in the merge order, a base section, or an earlier target.

## Sources

All cited texts are in the manifest. Read in the cache and cited by line: `stacks-012K`,
`stacks-05QI`, `stacks-more-algebra`, `grothendieck1957`, `may-primer`, `hatcher-at`, `douady1959`.
Uncertified, cited by locator only (settled; not requested again): `weibel1994`, `mccleary2001`,
`cartan-eilenberg1956`, `massey1954`. No text was missing, so no `needs-references.toml` was written.
The manifest's `locator` and `cited_for` fields were updated to the design's citations; the
service-recorded fields are unchanged. `sources check`: 0 problems; `sources cache` finds every
certified text.

Line locators read in this run, beyond the triage's: stacks-05QI line 2872–3011 (§16, tags 05TC,
015A, 05TD, 015C, 05TE, 015E), line 3240–3448 (§18, tags 013J, 013K, 013R, 013P, 013S, 013T); stacks-012K
line 3236–3438 (Lemmas 25.1–25.5 and 26.1–26.4, the complex `Tot_π` at line 3400–3409); stacks-more-algebra
line 7114–7166 and 7380–7422; may-primer line 100–180 (Example 2.3); grothendieck1957 line 1500–1535
(Proposition 2.5.4).

## Dependency check

```
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2164 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name
found nowhere.

## Candidate headlines for `Suggested.lean` (for packaging)

Statable on the pins with simple local definitions and no sorry'd data: the balance
`Nonempty (Tor C n ≅ Tor' C n)` under 4.1's hypotheses; the comparison
`Nonempty ((F.rightDerived n).obj A ≅ RⁿF(A))` of 2.2(i); the existence of a Cartan–Eilenberg resolution
(with the structure of 2.3 as a local definition); Grothendieck's criterion 3.1 as an `Iff` about `IsIso`
of the composition transformation; the acyclic assembly lemma 1.5 for `ModuleCat R` with the product
total complex as a local definition. Statements that need the base's convergence structures or limit
pages (Künneth, universal coefficients, Bockstein limit page) are headlines of the README only until the
base has a `Suggested.lean`.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Total sign `d₁ + (−1)^p d₂` (Conventions, 1.1) | unit square of `ℤ`'s; column-`1` complex `ℤ →(×2) ℤ` | `D(1) = (1,1)`; `K^{1,0}→K^{1,1}` is `−1`, `K^{0,1}→K^{1,1}` is `+1`; `D² = −1 + 1 = 0`, unsigned `2`; column-1 total `ℤ →(−2) ℤ`, `H² = ℤ/2` | holds; `(−1)^q`, `(−1)^{p+1}` give `+2` | witnesses added as Checks |
| Flip sign `(−1)^{pq}` and `″d_1` (1.2) | `K^{1,0} →(×2) K^{1,1}` | ours `″d_1 = +2`; Stacks Lemma 25.1(4) `−2`; `σ(1,0) = +1`, `σ(1,1) = −1`; `″E_2^{1,1} = ℤ/2 = H²` | conventions differ by the flip, intertwined | stated as a Check |
| `′d_1 = H^q(d₁)` (1.2) | `ℤ →(×2) ℤ` horizontally | `′d_1 = +2`, matching the base's native witness; `′E_2^{1,0} = ℤ/2`, `′E_2^{0,0} = 0` | holds | Check |
| `Tot^⊕` vs `Tot^Π` (1.1, 1.3) | staircase `D_p = K^{p,−p}`, `O_p = K^{p+1,−p}` | degree-0 differential `x ↦ (x_p − (−1)^p x_{p+1})`; kernel on `∏` spanned by `(1,1,−1,−1,…)`; `⊕` iso; `H⁰(Tot^⊕) = 0`, `H⁰(Tot^Π) = ℤ`; rows exact, only column 0 has cohomology | 1.3(b) for `″E` gives 0, 1.3(c) for `′E` gives `ℤ`: consistent; `′E` on `⊕` and `″E` on `Π` would be wrong and are excluded by the hypotheses | per-degree bounds adopted; Check |
| 1.3(c) regularity hypothesis | staircase | `′E_1 = ℤ` only at `(0,0)`, regular | holds | criterion "first page bounded below in degree `n+1`" (base §2.2) |
| 1.4 comparison | projection of staircase to column 0 | quasi-iso on columns; `Π`: `ℤ → ℤ` iso; `⊕`: `0 → ℤ` not iso | statement exact with hypotheses | Check |
| 1.5 acyclic assembly, eight cases | staircase; `ℤ →(id) ℤ`; Weibel's four cases converted with `C_{p,q} = K^{−p,−q}` | staircase: rows exact, `q ≤ 0`: `Tot^⊕` acyclic, `Tot^Π` has `H⁰ = ℤ`; Weibel: upper ↔ lower, right ↔ left | the row condition for `Π` cannot be relaxed to the lower half-plane | dictionary bullet; class of augmented forms made explicit |
| 2.1(a) horseshoe | `0 → ℤ →(×2) ℤ → ℤ/2 → 0`, `I₁ = ℚ → ℚ/ℤ`, `I₃ = ℚ/ℤ →(×2) ℚ/ℤ` | middle terms `ℚ ⊕ ℚ/ℤ`, `ℚ/ℤ ⊕ ℚ/ℤ`, cohomology `ℤ` in degree 0; untwisted sum `H⁰ = ℤ ⊕ ℤ/2` | twisting needed | Check |
| 2.1(b) relative horseshoe | split sequence; transported horseshoe by `(u,v) ↦ (u + h v, v)` | `α ⊕ β` works when split; identity fails for the transported target, `(u,v) ↦ (u + hv, v)` works | off-diagonal part needed | stronger source hypothesis (any resolutions) proved through Stacks 18.4, 18.6, 18.7 |
| 2.2 `RⁿF`, `R⁰F = F` iff left exact | `Hom(ℤ/2, −)` at `ℤ`; `− ⊗ ℤ/2` at `ℤ`; exact `F` | `R⁰ = 0`, `R¹ = ℤ/2`; `R⁰(− ⊗ ℤ/2)(ℤ) = ker(ℚ⊗ℤ/2 → ℚ/ℤ⊗ℤ/2) = 0 ≠ ℤ/2` | left exactness needed for `R⁰F = F` | non-example Check |
| 2.3 CE definition | `A[0]`; `0`; `ℤ →(×2) ℤ` with columns `ℚ → ℚ/ℤ`, `d₁ = ×2`; `A →(id) A` | non-CE: `H_I^1 = (ℚ/2ℚ, (ℚ/ℤ)/2) = (0,0)` but `H¹(K) = ℤ/2`; also `Z^0` resolved by `(0, ℤ/2)` ≠ `0`; `A →(id) A`: `Z⁰ = 0`, `B¹ = A`, `H = 0` resolved | column resolutions are not CE | Checks |
| 2.4 first hypercohomology | `Hom(ℤ/2, −)`, `K = ℤ →(×2) ℤ` | `′E_1^{0,1} = ′E_1^{1,1} = Ext¹(ℤ/2, ℤ) = ℤ/2`, `′d_1 = 0`; abutment `ℤ/2` in degrees 1, 2 = `Ext^{n−1}(ℤ/2, ℤ/2)` since `K ≃ ℤ/2[−1]` | holds | Check |
| 2.5 second hypercohomology | same `F`, `K`; column resolution with `F = id` | `″E_2^{0,1} = Hom(ℤ/2,ℤ/2) = ℤ/2`, `″E_2^{1,1} = Ext¹ = ℤ/2`; non-CE: class at `(1,0)` (kernel of `×2` on `ℚ/ℤ`, row 1) instead of `(0,1)` | CE conditions needed for `E₂ = R^pF(H^q K)` | Check |
| 2.5 independence from page 2 | two lifts of `f` | page-2 components `R^pF(H^q f)` equal; page-1 components `F(H_I^q(f̃))` may differ | independence only from page 2 | stated from page 2 |
| 2.6 duals, index | `− ⊗ ℤ/2`, `K = ℤ →(×2) ℤ` in degrees `−1, 0`; `ℤ/2` | `E^1_{0,0} = E^1_{1,0} = ℤ/2`, `d^1 = 0`, `L_0 = L_1 = ℤ/2 = Tor_n(ℤ/2,ℤ/2)`; `L_1F(ℤ/2) = ℤ/2` | indexing `K^{−p}` correct; `K^p` puts a term in degree `−1` | Check; `K°` witness in Conventions |
| 3.1 criterion | `F = G = Hom(ℤ/2, −)` at `ℚ/ℤ`; `F = id`; coextension | `R¹(G∘F)(ℚ/ℤ) = 0`, `H¹(RG(RF ℚ/ℤ)) = Ext¹(ℤ/2,ℤ/2) = ℤ/2` | `t` not iso when the condition fails | Check |
| 3.2 composite sequence | `ℤ/4 → ℤ/2` coextension at `ℤ/2`; AGD's counterexample | `R^qF(ℤ/2) = Ext^q_{ℤ/4}(ℤ/2,ℤ/2) = ℤ/2` all `q` (self-injective `ℤ/4`), `G` exact, `E₂` column 0, abutment `ℤ/2` each degree; would-be `E₂^{1,0} = ℤ/2` vs actual `R¹ = 0` | holds; acyclicity needed | Checks; injective resolution corrected in the Check text |
| 3.3 five-term, `m`-version | coextension example; `m = 1`; `F` exact | `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2`, middle iso; `m = 1` gives five-term; base §3.6's `m = 0` failure excluded by `m ≥ 1` | holds | Check |
| 3.4 mixed variance | `ℤ → ℤ/2`, `F = extendScalars`, `G = Hom_{ℤ/2}(−, ℤ/2)`; `F = − ⊗ ℤ/2`, `G = Hom_ℤ(−, ℤ)` | `E₂^{0,q} = ℤ/2` (q = 0, 1), abutment `Extⁿ_ℤ(ℤ/2,ℤ/2)`; second: `G ∘ Fᵒᵖ = 0` but `R¹G(op L₀F ℤ) = Ext¹(ℤ/2, ℤ) = ℤ/2` | hypothesis needed; "F exact" alone insufficient | added "and preserves projectives" to a Check |
| 4.1 balance | `Tor_1(ℤ/4, ℤ/6)`; `n = 0`; projective `X` | `ker(×6 on ℤ/4) = {0,2}`, `ker(×4 on ℤ/6) = {0,3}`, both `ℤ/2` | holds | Checks |
| 4.2(a) UCT Tor | `ℤ/2 ⊗^L ℤ/2`; `K = ⊕_n ℤ/2[n]` | `E₂^{0,0} = E₂^{−1,0} = ℤ/2`; unbounded: `Hⁿ = (ℤ/2)²` | holds for unbounded `K` | generality widened (Tot^⊕) |
| 4.2(c) contravariant Ext | `X = ℤ →(×2) ℤ`, `M = ℤ`; `M` injective | `E₂^{1,0} = Ext¹(ℤ/2, ℤ) = ℤ/2`, `E₂^{0,0} = 0`, `H¹(Hom(X,ℤ)) = ℤ/2`; injective `M`: column 0 | agrees with Tau Ceti's Kronecker sequence | Check |
| 4.3 Künneth | `ℤ/2[0] ⊗^L ℤ/2[0]`; `k[ε]/(ε²)`, `K = L = k`; `K = R[0]`; `R = 0` | `H⁰ = H^{−1} = ℤ/2`; `E₂^{p,0} = k` for all `p ≤ 0`, one row, `H^{−n}(k ⊗^L k) = k`; `R[0]` gives `H^q(L)`; `R = 0`: everything zero | holds; two columns insufficient in general | Checks |
| 4.4(a) change of rings | `ℤ → ℤ/4`, `M = N = ℤ/2` | `E²_{p,q} = ℤ/2` (`p ≥ 0`, `q ∈ {0,1}`), abutment `ℤ/2` for `n = 0,1`, `0` for `n ≥ 2`; forces `d² : E²_{p,0} ≅ E²_{p−2,1}` for `p ≥ 2` | consistent, nonzero differential | Check |
| 4.4(b),(c) | `ℤ/4 → ℤ/2`; `ℤ → ℤ/2`; `f = id` | (b) column 0, `ℤ/2` each degree; (c) `ℤ/2` in degrees 0, 1 | holds; (c) restricted to commutative rings (pin) | generality fixed to the pin |
| 5.1 Massey `μ_n` | zero pairing; Bockstein couple of `ℤ`; product on `E^{0,0}` only for `ℤ →(×2) ℤ` | `d(1·1) = 2` vs `d(1)·1 + 1·d(1) = 0` | `μ_0` = Leibniz; non-example fails | Checks |
| 5.2 filtered pairings | `𝔽₂[x,y]/(x²)`, `dx = y`, filtration `(y)^p` | `E₁`: `y^p` at `(p,p)`, `xy^p` at `(p,p+1)`, `d₁(xy^p) = y^{p+1}`, `d₁(xy) = y² = d₁x·y + x·d₁y`; `E₂ = 𝔽₂` at `(0,0)` = `H(A)` | holds | Check |
| 5.3 double-complex pairing signs | `A ⊠ B`; `x = 1⊗b`, `y = a′⊗1`, `p′` odd; `ℤ[ε]/(ε²)` | `d₂(xy) = (−1)^{qp′} a′⊗db = (−1)^{p′} d₂x·y`; naive rule gives `(−1)^{(q+1)p′}`; `(1⊗ε)(ε⊗1) = −ε⊗ε` | vertical rule needs `(−1)^{p′}`; flip sign `(−1)^{pq′+p′q}` from `σ` | rules pinned, Checks |
| 6.1 Bockstein couple | `ℤ →(×p) ℤ`; `ℤ →(×p²) ℤ`; `ℤ[0]`; `ℤ/p[0]` | `d_1 = +1` iso; `k(1) = [p]`, `j([p]) = 0`, `d_1 = 0`; `k = 0`, `E_r = ℤ/p`; `ℤ/p[0]`: `×p = 0`, no short exact sequence | torsion-freeness needed; sign `+1` | Checks |
| 6.2 higher UCT, stabilisation | `ℤ →(×p^r) ℤ` | `E_s⁰ = E_s¹ = ℤ/p` for `s ≤ r`, `0` after; `d_r` iso; stabilises from `r + 1 = max(0, r) + 1` | holds | Check |
| 6.2 limit page without stabilisation | `⊕_k (ℤ →(×p^k) ℤ)` | `E_r⁰ = ⊕_{k≥r} ℤ/p ≠ 0` all `r`, `⋂ p^r H¹ = 0`, `E_∞⁰ = 0`, `H⁰[1/p] = 0` | consistent | Check |
| 6.2 convergence criterion | `ℤ → ℤ[1/p]`; `f` a unit | `H¹ = ℤ[1/p]/ℤ` divisible, `H¹[p] = ℤ/p`, `E_r⁰ = ℤ/p`, `H⁰[1/p] = 0`: no isomorphism at all; `f` unit: `E₁ = 0`, `gr = 0`, weak convergence holds, filtration not separated (`⋂ f^s H̄ = H ≠ 0`) | criterion sharp; ordinary convergence needs separation | "iff" restated for the canonical comparison (base §3.2 isomorphisms are arbitrary) |
| 6.2 vs Hatcher 3E.3 | summands `ℤ`, `ℤ/p`, `ℤ/p^k` (`k > 1`) of `Hⁿ` | `r = 2`: `ℤ` → `ℤ/p` in `E₂ⁿ`; `ℤ/p^k` → `ℤ/p` in `E₂ⁿ` and `E₂^{n−1}`; `ℤ/p` → nothing | agrees with hatcher-at line 13330–13337 | Check |
| Context: `HasDerivedCategory`, `EnoughInjectives`, universes | all derived-functor targets | `rightDerivedFunctorPlus` needs `[HasDerivedCategory]` on both sides and `[EnoughInjectives 𝒜]`; `ModuleCat.{u} R` with `R : Type u` for `AB5`/`AB4Star` | in scope through Conventions and per-target hypotheses | Conventions |
| Degenerate rings | `R = 0`; `f = 0`; `f` a unit | `ModuleCat 0` trivial, all statements trivial; `f = 0` injective only on `M = 0`; unit `f`: above | no false instance | none |

## Suspicious text

None. No issue, pull-request, roadmap or fetched text contained instructions addressed to the worker.

## Not done

No Lean was run (the brief names no Lean command for this stage, and the design stage has no
`Suggested.lean`). No GitHub writes.
