# GATE-ImplicitAtlases~2: answers to the review of 50ab7a5

Repairs are in commit `66eee12` on the pull-request branch (not pushed). Only `TauCetiRoadmap/ImplicitAtlases/README.md` and `TauCetiRoadmap/ImplicitAtlases/Suggested.lean` changed. The review's six numbered findings are H01–H06. The review text ends in a truncated table of pinned inputs; it contains no further findings and no instructions.

## H01 (CBirkbeck) — applied

The witness is correct. With s(x) = x² on X_α = ℝ, ℤ/2 reflecting X_α and acting trivially on E_α = ℝ, d = 0, X = {0}, X_∅^reg = ∅, every axiom of Pardon Definition 3.1.1 holds. The stabilizer at 0 acts on `o_ℝ ⊗ o_ℝ^∨` by −1. The deformation space is {t > 0, e = x²/t}, and ℤ/2 acts on `H_1(D, D∖Z) = ℤ` by −1, so the rational H_vir^0 is 0, while Čech^0 of a point with any rank-one coefficient sheaf is ℚ. Pardon assumes local orientability in Definition 4.1.3 (p. 35, `pardon2016 line 1460`; the notion itself is Definition 4.1.2, p. 34, `pardon2016 line 1448`), Lemma 4.3.1, Theorem 4.3.4 (p. 39, `pardon2016 line 1623`), Definition 5.1.1 and Lemmas 5.2.1–5.2.6.

Old: "Define local orientability … Construct the rank-one locally constant virtual orientation sheaf". New, README §3.1: the sheaf is constructed for locally orientable atlases only. A Conventions row states that every orientation, Čech-comparison, virtual-class and law statement assumes local orientability, and Layers 1–2 and the chain constructions do not. The pattern is repaired throughout:
- §3.2: the homotopy K-sheaf property and the lower bound hold for every finite atlas; the H^0 identification needs local orientability.
- §3.4, §4.3 and Layer 5 ("Throughout this layer atlases are locally orientable") carry the hypothesis.
- §6.3 (Pardon Prop. 6.2.3) and §6.5 assume it.
- §6.4 proves that a product of locally orientable atlases is locally orientable, since stabilizers are products.
- §7.1 proves that the fiber-product atlas is locally orientable, since ν_Δ∘(f_I×g_J) is Γ-invariant.
- §6.2 requires the normal-line identifications to be Γ_I-equivariant with trivial action on o_s. Without this, the restricted atlases on strata need not be locally orientable: ℤ/2 reflecting across a codimension-1 face acts by −1 on its normal line.

The reflection atlas is a Check in §1.1 and a negative Check in §3.1 and §3.4. The trivial action and the simultaneous reflection with s(x) = x (sign (−1)(−1) = +1) are positive Checks.

## H02 (CBirkbeck) — applied

AbelianSchemesAndArithmeticModuliPartII §B2.9 (open head, README line 1376) states, for every m ≥ 0, that a continuous injection from an open U ⊆ ℝ^m to ℝ^m is an open embedding, with the manifold consequence. That roadmap is at merge-order position 190, before this one. The pinned Mathlib has no invariance-of-domain theorem: a grep for the name and the statement found nothing. Old README V6.2: "The invariance-of-domain proof is an owned target. For n≥2, restrict an injection …" (the whole proof paragraph). New: README §6.2 derives only the cell-like-stratum consequences (Pardon Lemma 6.1.5, p. 47) "from invariance of domain (AbelianSchemesAndArithmeticModuliPartII, §B2.9)". The proof is deleted, and the supplier appears in Scope and ownership, in a new `### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII` contract, in the §6.2 *Needs:* line and in the Layer 6 Dependencies.

## H03 (CBirkbeck) — applied

`Suggested.lean` is now `import Mathlib`, one module docstring titled "Implicit atlases and rational virtual fundamental classes: target signatures", and an empty `namespace TauCetiRoadmap.ImplicitAtlases`. All twelve old declarations are deleted: `CoveringGroup`, `ObstructionTuple`, `NonnegativeParameters`, `activeIndices`, `Thickening`, `ZeroFiber`, `expectedDimension`, `RegularCoordinateAt`, `no_regularCoordinate_of_negative`, `RelativeChains`, `obstructionPair` and `VirtualKComplex`, together with the three Tau Ceti imports. The docstring lists each headline and the carrier it lacks at the pins:
- the Čech comparison and the virtual class need the implicit-atlas structure, the Layer 2 virtual complex and cover-colimit Čech cohomology with sheaf coefficients (Mathlib's `CategoryTheory.cechComplexFunctor` covers one fixed cover only);
- the Layer 5 laws also need relative Čech cohomology and the section atlas;
- the Layer 6 results need stratified atlases and the Čech external product with local-system coefficients;
- the Layer 7 identity needs supported Čech cohomology and the diagonal Thom class.

Invariance of domain, the only statable candidate, belongs to its owner (H02).

## H04 (CBirkbeck) — applied

`no_regularCoordinate_of_negative` is deleted as part of H03. Both computations are now README Checks in §1.1. With d = −2 and m_α = 1, n = −1 has no natural solution, so X_α^reg = ∅ and a nonempty X has no atlas on {α}. With d = −1 and m_α = 1, n = 0 is allowed, giving an atlas on a point whose virtual class is the zero functional on Čech^(−1) = 0 (§4.3 Check).

## H05 (CBirkbeck) — applied

The README is rewritten in house form. It has `# Roadmap:` with a `**Summary.**`, then Scope and ownership, Conventions, Exact supplier contracts (per supplier, declarations checked at the pins Mathlib f6090c7 and Tau Ceti 358314d) and How to read the build. Layers 0–7 follow, with `### k.n` targets. The gate requires digit-only target ids, so each layer heading keeps its old label in parentheses ("(V0)" … "(V7)"), and the consumers' citations of "ImplicitAtlases V0–V6" still resolve. Every definition has API bullets in prose and at least three computed Checks. Every target has a *Needs:* line, and every layer ends with Examples and Dependencies. The verification list became Checks:
- §0.2: o₀ = ℤ; reflection on o_ℝ acts by −1 (a determinant model would give 2 for x ↦ 2x); swapping two odd factors acts by −1.
- §7.3, with ν(x, y) = x − y and the increasing θ orientation: i_!(1, 0) = η and i_!(0, 1) = −η; the opposite normal negates both; i_!(1, 1) = 0 = 1 ⌣ ū.
- §4.3: xⁿ gives 0 or 1, zⁿ gives n, and the ineffective ℤ/2 point gives 1/2 (1/4 with a second quotient factor, 1 without the trace weight).
- §5.1–§5.2: the [0, 1] connecting map (a, b) ↦ b − a with outward-first orientation, and a − b with inward-first.
- §6.1: the corner versus codimension-collapse Check.
- §6.1: the two-point zero-fiber compatibility Check.

## H06 (CBirkbeck) — applied differently

Every sourced claim now carries a theorem/definition locator with its printed page in arXiv v6, which was fetched through the sources service. The page markers of the extraction coincide with the printed folios. Examples:
- §2.1 Definition 4.2.1, p. 35;
- §3.4 Proposition 4.3.3, p. 38 and Theorem 4.3.4, p. 39;
- §4.3 Definition 5.1.1, p. 41;
- §5.6 Lemma 5.2.6, p. 43, Definition 5.3.1, p. 44 and Proposition 5.3.4, p. 45;
- §6.1–§6.2 Definition 6.1.6, p. 48;
- §2.3 Definition A.7.2, p. 128 and Lemma A.4.9, p. 121.

The References entry lists all of them. Constructions of this roadmap are labelled as such:
- the weighted trace in §4.2, with its correction stated mathematically: Pardon's (4.2.12) is the unweighted pushforward on flag length 0, which is not a cocone for arrows weighted by |Γ_(J∖J')|⁻¹; the weights |Γ_J|⁻¹ satisfy |Γ_J'|⁻¹|Γ_(J∖J')|⁻¹ = |Γ_J|⁻¹;
- the suspension isomorphism in §3.2;
- the Čech external product in §6.5;
- the fiber-product identity in Layer 7, which Pardon's §5 introduction (p. 40) lists as a desired property the paper does not prove.

The `sources.toml` part is not done. This job may edit only README.md and Suggested.lean, and the fetch did not write the manifest. The worker should record `pardon2016` (arXiv:1309.2370v6, open repository, the locators above) in `TauCetiRoadmap/ImplicitAtlases/sources.toml` under that single key. No text is missing, and no `needs-references.toml` was written.

## Build, gate and dependency check

Repairs are in commits `66eee12` (H01–H06) and `7218354` (the dependency direction, below), neither pushed.

### Dependency direction (worker check `depcheck=1`)

The check `UPWARD: ImplicitAtlases (#215) -> TopologicalSheafCohomology (#317)` was a real defect. TopologicalSheafCohomology is an open new-roadmap pull request that comes later in the merge order, and it is not in this roadmap's list of permitted suppliers. The notions this roadmap used from it therefore move down into this roadmap as Layer 0 targets, each stated from Pardon's Appendix A with printed-page locators (arXiv v6, `pardon2016`):
- §0.5 gains the independent-parity complexes (Convention A.0.3, p. 114). This was TS0.
- New §0.6: K-sheaves, homotopy K-sheaves, the open/compact indexing equivalence and the relative-singular-chain axioms (A.1.1–A.1.8, A.2.5, A.2.11–A.2.12, A.3.3–A.3.6, A.6.3). This was TS2, first half.
- New §0.7: colimit-over-covers Čech cohomology on compact Hausdorff spaces with its comparison, stalk and long-exact-sequence statements (A.4.1–A.4.21). This was TS1, without the comparison with derived cohomology, which nothing here used. The Mathlib `CategoryTheory.Sheaf.H` contract bullet is replaced by `TopCat.Sheaf`, `TopCat.Presheaf.stalk`, `TopCat.Sheaf.pushforward` and `TopCat.Sheaf.pullback`, all checked at the pin.
- New §0.8: purity and the purity formula (A.5.1–A.5.5). This was TS2, second half.
- New §0.9: extension by zero, finite-fiber pullback and finite quotients (A.3.5, A.4.7–A.4.9). This was TS3.
- New §0.10: orientation sheaves with and without boundary, upper vanishing (Hatcher, Lemma 3.27(b), p. 236, `hatcher2002`, author's page) and closed-subset duality (A.6.1–A.6.4). This was TS4.
- New §0.11: finite interval diagrams, their totals, the product total and pure gluing (A.7.1–A.7.5, A.8.1–A.8.2). This was TS5.

Every "TS*n*" citation in the README, the `### From TauCetiRoadmap.TopologicalSheafCohomology` contract and the Scope bullet is replaced by the Layer 0 subsection. The Scope ownership line for Layer 0 now lists this sheaf theory. The backticked `alphaCompact` (a TopologicalSheafCohomology name) became the notation `(−)^K` of §0.6. The `Suggested.lean` docstring now cites Layer V0.11 and V0.7 instead of TS5 and TS1. The README no longer mentions TopologicalSheafCohomology. When that roadmap merges after this one, it should import §0.6–§0.11 from here rather than re-plan them.

Sources: `hatcher2002` (https://pi.math.cornell.edu/~hatcher/AT/AT.pdf, author page, fetched through the sources service) is new. The worker should record it in `sources.toml` together with `pardon2016`, because this job may not edit the manifest. No text is missing, and no `needs-references.toml` entry was added.

### Outcomes

- `lake build TauCetiRoadmap.ImplicitAtlases.Suggested`: `Build completed successfully (8976 jobs).` There are no warnings, and the file has no declarations.
- Gate summary line: `gate ImplicitAtlases: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Movable dependency check. It shows no UPWARD, CYCLE or moved line:

```text
depcheck: 162 roadmaps, 1169 edges, 0 problem(s)
```

- `roadmaps resolve` on the README: no unresolved citations and no Lean names found nowhere.
- Signature check: `Suggested.lean` declares nothing, so there are no `#check @name` lines to elaborate and no dropped binders.
- Ownership: the new supplier (AbelianSchemesAndArithmeticModuliPartII §B2.9) was checked at its open head and against the merge order. CharacteristicClasses §C1.2b and §C2 item 1, AlgebraicTopology Stages 2, 3 and 6, and DGAInfinity Layer 0 were checked on main (2b363a2). The sheaf theory of §0.6–§0.11 is owned here because its only other planner, TopologicalSheafCohomology, comes later in the merge order; Mathlib at the pin has sheaves, stalks, pushforward, pullback and the fixed-cover Čech complex, but no K-sheaves, extension by zero or colimit-over-covers Čech cohomology. The roadmap grep service over the open heads and main finds no other owner of implicit atlases or virtual fundamental classes; the hits are the consumers named under Downstream consumers.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §3.1 local orientability needed for o_X | reflection atlas x², Γ = ℤ/2 | stabilizer sign (−1)(+1) = −1; H_vir^0 = 0 versus Čech^0 = ℚ | hypothesis needed | added everywhere (H01) |
| §3.1 positive cases | trivial action; s(x) = x, both reflected | +1; (−1)(−1) = +1 | pass | Checks |
| §3.1 boundary restriction preserves local orientability | half-space chart, stabilizer fixing boundary point | inward side preserved, normal sign +1 | holds | API bullet |
| §6.4 product locally orientable | stabilizers (Γ_I)_x × (Γ_J)_y | +1 · +1 = +1 | holds | API bullet |
| §6.2 restricted atlas locally orientable | ℤ/2 reflection across face {0} of ℝ | normal-line sign −1 | needs equivariance | equivariance required; negative Check |
| §7.1 fiber atlas locally orientable | invariant ν_Δ∘(f_I×g_J) | normal sign +1 | holds | API bullet |
| §1.1 negative dimension | d = −2, m = 1; d = −1, m = 1 | n = −1 impossible; n = 0 allowed | as stated | Checks (H04) |
| §1.1 freeness axiom | ℤ/2 trivial on a point, X_∅^reg = ∅ versus X | vacuous versus violated | discriminates | Check |
| §2.1 deformation space | s = x on ℝ | D ≅ ℝ × ℝ_≥0, dim 2; Z a closed noncompact half-line | as stated | Check |
| §2.2 partial complex | s = x | H_1(D, D∖Z) = ℤ, H_2 = 0, so H^0 = ℤ | as stated | Check |
| §2.2 weights | uniform w versus |Γ_(J∖J')|⁻¹ | w² ≠ w; multiplicative weights | uniform weight fails | Check (corrected wording) |
| §2.3 flag total | B = {α} | flags ∅, {α}, ∅ ≺ {α}: two length-0 summands, one length-1 summand | first draft miscounted | corrected (Pardon A.7.2) |
| §4.1 generator invariance | ℝ with −1; ℝ² with −id | (−1)(−1) = +1; (+1)(+1) = +1 | as stated | Checks |
| §4.2 trace pair map at K ≠ X | s = x, K = ∅ | point (0, t, 0) has e = 0 ∉ E∖0 | no pair map | Check |
| §4.2 reindexing sign | d = 1, q = 2; q = d | −1; +1 | as stated | Check |
| §4.3 weights | ineffective ℤ/2 point | 1/2 (weights); 1/4 (double); 1 (none) | as stated | Check |
| §4.3 class values | xⁿ, zⁿ | 1 or 0; n | as stated (Pardon Ex. 2.3.2) | Check |
| §5.1 connecting sign | [0, 1], outward-first | δ(a, b) = b − a; inward gives a − b | as stated | Check |
| §5.2 concordance | x³ + t x, t ∈ [0, 1] | zero set {0} × [0, 1]; classes 1 and 1 | holds | endpoints corrected to x³ and x³ + x |
| §5.5 wild source | Warsaw circle | Čech^1 = ℚ, singular H_1 = 0 | realization only on target | Check |
| §5.6 Euler | sin θ on S¹; TS² | 1 − 1 = 0; 2 | as stated | Checks |
| §6.1 cell-like | quadrant versus edge collapse | L-shape ≅ line with interior origin | collapse not cell-like | Check |
| §6.4 products | zⁿ × z^m; ℤ/2 point squared | nm; 1/4 | as stated | Checks |
| §6.5 Künneth | S¹ × S¹; Warsaw circle × pt | Čech^1 = ℚ²; ℚ versus singular 0 | as stated | Checks |
| §7.1 dimensions | d_X = d_Y = 0, n = 1, m_I = 1 | vdim −1, chart dim 0 | W need not be empty | Check |
| §7.2 shift sign | n = 1, q = d_Z + 1; q = d_Z | −1; +1 | as stated | Check |
| §7.3 Gysin | sin θ on S¹ over ℝ, ν = x − y | i_!(1, 0) = η, i_!(0, 1) = −η, i_!(1, 1) = 0 = 1 ⌣ ū | as stated; opposite ν negates | Checks |
| §3.3 footprint inclusions | chart X × ℝ with X_∅^reg = X or ∅ | X ⊆ X; ∅ ⊊ X | inclusion can be strict | Checks |
| §0.6 K-sheaf axioms | two-point discrete X, K ↦ ℤ for K ≠ ∅ | image Δℤ ≠ kernel ℤ² | fails exactness | negative Check |
| §0.6 colimit axiom | K ↦ all functions on ℝ at {0} | germs → ℤ onto, kernel contains germ of 1_(ℚ∖0) | fails continuity | negative Check |
| §0.6 local homology values | ℝ; K = {0}, [0, 1], {0, 1} | ℤ, ℤ, ℤ² (3 components) | consistent with MV | Check |
| §0.7 Čech colimit | S¹, two arcs versus {S¹} | (a, b) ↦ (b − a, b − a): Ȟ⁰ = ℤ, Ȟ¹ = ℤ; one set: Ȟ¹ = 0 | colimit needed | Check |
| §0.7 versus singular | Warsaw circle | Ȟ¹ = ℤ, singular H¹ = 0 | differ | Check |
| §0.7 empty space | X = ∅ | empty cover final, Ȟ = 0 | as stated (Remark A.4.2) | Check |
| §0.8 purity formula | C_(1−•)(ℝ, ℝ∖K) on [0, 1] | H⁰ = ℤ = Ȟ⁰([0, 1]; o), higher 0 | holds | Check |
| §0.8 non-pure | ℤ in degree 1 on a point | predicted H¹ = 0, actual ℤ | purity hypothesis needed | negative Check (first draft said "any compact X"; not a homotopy K-sheaf on S¹, restricted to a point) |
| §0.8 discrete | n points | H⁰ = ⊕ stalks, higher 0 | holds | Check |
| §0.9 j_! versus j_* | (0, 1) ⊆ [0, 1] | j_!: ℤ in degree 1; j_*: ℤ in degree 0 | differ | Check |
| §0.9 finite quotient | ℤ/2 reflection and antipodal on S¹, over ℚ | invariants 0 and ℚ = Ȟ¹ of interval and circle | holds | Check |
| §0.9 order invertible | antipodal over ℤ | pullback ×2, cokernel ℤ/2 | hypothesis needed | negative Check |
| §0.10 duality | ℝ with Z = {0}, ℝ | ℤ at q = 0; ℤ at q = 1 | matches Ȟ_c | Check |
| §0.10 rel∂ coefficient | [0, ∞), N = ∅ | H₀ = ℤ at q = 1 = Ȟ¹_c((0, ∞)); with o_M: Ȟ_c = 0 | o_(M rel∂) needed | negative Check |
| §0.10 upper vanishing with boundary | half-space, K convex meeting boundary | H∖K contractible, all H_q(H, H∖K) = 0 | bound holds | route stated |
| §0.11 terminal object | S = {0 < 1}, identities | x ↦ (−x, x): H⁰ = ℚ, H⁻¹ = 0 | holds | Check |
| §0.11 hypothesis | same S, zero maps | H⁰ = ℚ², H⁻¹ = ℚ | quasi-iso hypothesis needed | negative Check |
| §0.11 pure gluing | A = ∅ | total = F_∅∅ | reduces to G ≅ H⁰ | Check |
