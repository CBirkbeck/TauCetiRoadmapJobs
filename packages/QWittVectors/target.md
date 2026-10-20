Verdict: design
Name: QWittVectors
Base: none
Owner: none

## Scope

Own the general arithmetic Λ-ring and q-Witt library supplying the Habiro cluster, with exports QW.0–QW.6 below. There is no existing q-Witt roadmap in the supplied main checkout, completed roadmaps, or available packages. Existing p-typical Witt vectors and characteristic-p perfection are suppliers, not a base roadmap whose continuation this would be.

Arithmetic Λ-rings mean special λ-rings, equivalently coalgebras for the big Witt comonad; on torsion-free rings they can be described by commuting Frobenius lifts. Keep the coalgebra definition on rings with torsion. Perfect means that all Adams operations are invertible. Perfectly covered means admitting a faithfully flat Λ-map to a perfect Λ-ring. Neither notion means simply a perfect characteristic-p ring.

The degree-zero relative construction exists for every commutative unital Λ-ring A and every commutative unital A-algebra R. Perfect coverage, smoothness, étaleness, and torsion bounds are hypotheses of particular theorems, not of that construction. Include the absolute degree-zero theory for commutative rings without a unit, as Wagner permits. Include every positive truncation index, arbitrary divisor-closed truncation sets where the sources provide them, and every prime, including 2. A fixed divisor system for m needs only the Λ-operations at primes dividing m. No Noetherian, field, finite-étale, F-finiteness, or prime-invertibility restriction is imposed globally.

The boundary is the reusable algebra and framed calculus. Habiro completions and cyclotomic gluing, Habiro rings, q-Hodge filtrations and their descent, refined trace invariants, and geometric cohomology comparisons remain with their named roadmaps. In particular, QW.4 supplies the explicit completed relative Frobenius below; it must not be replaced by an unspecified prismatic Frobenius. QW.5 owns the shared positive-degree q-Witt operations; QW.6 owns the shared complete framed difference calculus, so consumers import these rather than rebuild them.

These are triage endpoints, not an implementation plan. A later Suggested.lean must use a single `import Mathlib`, only easy headline statements on existing carriers, proved checks of its own definitions, no sorry'd data and no `set_option`.

## Final targets

Use W_S(R) for ordinary big Witt vectors; W_m means S = {d > 0 : d divides m}, not length-m p-typical vectors. Write Q_m(R/A) for relative q-Witt vectors, A[ζ_d] = A[q]/Φ_d(q), and hats for derived completion unless an ordinary-completion comparison is stated. Each statement below is in our own notation; locators refer to the versions in Sources.

1. **QW.0 — big Witt and arithmetic Λ input.** For any commutative unital ring R and any divisor-closed S of positive integers, supply the functorial ring W_S(R), with ghost components w_n(x) = ∑_{d|n} d x_d^(n/d), ordinary restrictions, F_n, additive V_n and multiplicative Teichmüller maps. Supply the big Witt comonad and its Λ-coalgebras, Adams operations ψ_1 = id, ψ_a ψ_b = ψ_ab, and ψ_p(x) ≡ x^p modulo p. Include prime-set Λ_P variants and comparison of W_{p^a} with existing p-typical vectors of length a+1. Ordinary Witt vectors preserve étale maps and their Frobenius base-change squares are pushouts. Locators: hesselholt Proposition 1.2, Lemmas 1.3–1.5, Proposition 1.19, Definition 1.21, Lemma 1.24 and Theorem 1.25, pp. 7–9, 17–20 (hesselholt line 268, line 354, line 711, line 753, line 798, line 811); borger §§1.16–1.18, Corollary 5.4 and Theorem 9.2 (borger line 603, line 1323, line 1995); pridham Definition 2.1 (pridham line 506).

2. **QW.1 — perfect coverage and relative perfection.** Construct the colimit perfection of an arithmetic Λ-ring A by inverting all Adams operations. Prove equivalence of: a faithfully flat Λ-map A → B with B perfect; faithful flatness of every ψ_m; and faithful flatness of A → A^perf. Perfectly covered A is torsion-free as an abelian group. Define relative perfection of a Λ-A-algebra R by invertibility of each linearized ψ_p: R ⊗_{A,ψ_p} A → R. For such R over perfectly covered A, both relative comparison maps in QW.2 are isomorphisms. Include ℤ, perfect Λ-rings, free Λ-rings, and polynomial rings with ψ_m(T_i) = T_i^m as checks, without restricting the theorem to these examples. Locators: wagner Remark 2.47 and footnote 2.3, p. 32 (wagner line 1621); wagner-habiro §1.22(e), p. 12, and §2.7, pp. 15–16 (wagner-habiro line 493, line 647); bhatt-scholze Lemma 2.28, p. 20 (bhatt-scholze line 778).

3. **QW.2 — relative degree-zero q-Witt rings and operators.** For any Λ-ring A and A-algebra R, the system Q_m(R/A), m > 0, is initial among relative q-FV systems. For d|m, F_{m/d}: Q_m → Q_d is an A[q]-algebra map and V_{m/d}: Q_d → Q_m is A[q]-linear; their composites are F V = m/d and V F = [m/d]_{q^d}. Include composition, coprime interchange, projection formula, and multiplicative Teichmüller maps τ_m with F_{m/d}τ_m(r) = τ_d(r)^(m/d). The ghost maps have the twisted targets

   gh_{m/d}: Q_m(R/A) → R ⊗_{A,ψ_d} A[ζ_d].

   Their first component is the quotient by the proper-divisor Verschiebung images. For a Λ-A-algebra R, there are comparison maps

   R ⊗_{A,ψ_m} A[q]/(q^m−1) → Q_m(R/A) → R[q]/(q^m−1),

   whose composite is linearized ψ_m. Include the absolute possibly nonunital theory, its injective W_m(R) → Q_m(R), and its injective Verschiebungen. Over perfectly covered A, relative Verschiebungen are injective; do not assert this for arbitrary A. Locators: wagner Definitions 2.8–2.10, §2.13, Corollary 2.19, Proposition 2.28, §§2.40–2.47, pp. 11–12, 18, 23, 30–32 (wagner line 475, line 552, line 981, line 1194, line 1504, line 1565, line 1573, line 1621).

4. **QW.3 — base change, ghosts and completions.** For a Λ-map A → A′ and any R/A, Q_m(R/A) ⊗_A A′ ≅ Q_m(R ⊗_A A′/A′). For every étale R → R′ over any Λ-ring A, Q_m(R/A) → Q_m(R′/A) is étale, and for d|m,

   Q_m(R′/A) ⊗_{Q_m(R/A),F_{m/d}} Q_d(R/A) ≅ Q_d(R′/A).

   The analogous square for each twisted ghost map is also a pushout, both ordinarily and derived. Retain the absolute torsion and completion results: ghosts are jointly injective if R is p-torsion-free for p|m; Q_m commutes with p-completion when the derived p-completion of R is discrete; the corresponding (q^n−1)-completion is discrete when those p-completions are discrete for all p|m, with bounded torsion conclusions under the stated bounded p-primary torsion hypotheses. Transfer these conclusions to perfectly covered relative bases by the base-change comparison. Locators: wagner Lemma 2.23, Corollaries 2.24 and 2.26, Lemma 2.46, Remark 2.47, Proposition 2.48 and Corollary 2.51, pp. 20–22, 31–34 (wagner line 1064, line 1083, line 1118, line 1583, line 1621, line 1651, line 1715).

5. **QW.4 — exact relative completed Frobenius interface.** Let A be perfectly covered and R étale over A. For every prime p, let R̂_p be its p-completion. Supply the unique Frobenius lift φ_p: R̂_p → R̂_p extending ψ_p on A and reducing to x ↦ x^p modulo p, and the equivalence

   φ_{p/A}: (R̂_p ⊗^L_{A,ψ_p} A)^∧_p ≃ R̂_p,
   induced by r ⊗ a ↦ φ_p(r)a.

   These p-completions are ordinary rings, and the interface includes the comparison with ordinary completed tensor products. For each d > 0, export its ψ_d-twist with the common cyclotomic completion topology as the A[q]-linear equivalence

   ((R̂_p ⊗^L_{A,ψ_{pd}} A)[q])^∧_{(p,Φ_{pd}(q))}
   ≃ ((R̂_p ⊗^L_{A,ψ_d} A)[q])^∧_{(p,Φ_d(q))},

   induced by r ⊗ a ↦ φ_p(r) ⊗ a and fixing q. Include the comparison of the two completion ideals, naturality, iterations, and compatibility with the relative ghost square reduced modulo p. For pd|m this is exactly the overlap map between the d and pd cyclotomic pieces that Habiro gluing needs. The uncompleted étale R need not admit any Frobenius lift. Do not confuse this q-fixed map, or the q-fixed truncated F_{m/d}, with the framed complex Frobenius sending q to q^p in QW.6. Locators: wagner-habiro §2.7, pp. 15–16, and the ghost/deformation diagrams in the proof of Theorem 2.9, pp. 16–17 (wagner-habiro line 647, line 657, line 679, line 709). The theorem uses the standing hypothesis “R étale over A” of §2.2 even though its displayed heading abbreviates it. The Habiro objects in that theorem remain downstream.

6. **QW.5 — shared positive-degree q-Witt calculus.** For every Λ-ring A and A-algebra R, construct the initial q-V differential graded system Q_mΩ^*_{R/A}, with degree zero Q_m(R/A), Q_1Ω^* = Ω^*_{R/A}, and its unique Frobenii making it initial as a q-FV system too. Include twisted differential ghost maps, Λ-base change, étale base change, projection and Teichmüller identities, F_n d V_n = d, V_n d = n d V_n and d F_n = n F_n d. F_n is a map of graded algebras, generally not a chain map. For smooth R over perfectly covered A, prove degreewise integer torsion-freeness and bounded (q−1)-power torsion, identifying ordinary and derived degreewise (q−1)-completion. Include 2; retain the source's strict alternating convention. Locators: wagner Definitions 3.1 and 3.6, Propositions 3.12 and 3.17, §§3.15–3.16, Proposition 3.31, Proposition 4.1 and Lemma 4.6, pp. 37–42, 50–51, 54–56 (wagner line 1822, line 1893, line 1956, line 2011, line 2044, line 2053, line 2552, line 2686, line 2810). The displayed formula in Lemma 3.7 has a typographical error; its proof gives the d F_n identity just stated.

7. **QW.6 — complete framed difference calculus.** For an étale framing A[T_1,…,T_r] → R, construct commuting automorphisms γ_i of R[[q−1]] extending T_j ↦ q^(δ_ij)T_j and commuting operators D_i determined by (γ_i−id)(f) = (q−1)T_i D_i(f). Prove the twisted product rule, D_i(T_i^n) = [n]_q T_i^(n−1) for n ≥ 1, extension through the framing, the Koszul complexes for D_i and (q−1)D_i, and their specializations at q=1. For the p-completed framed smooth case over perfectly covered A, supply the coordinate Frobenius φ_□ extending ψ_p, with T_i ↦ T_i^p and q ↦ q^p, and the compatible action on the scaled complex sending dT_i to T_i^(p−1)dT_i. Do not assert the QW.4 equivalence for a general smooth R. Locators: wagner §§4.7–4.9 and §4.28, pp. 57–58, 67 (wagner line 2830, line 2858, line 2882, line 3292); pridham Definition 1.22 and Lemma 2.9 (pridham line 371, line 635); scholze §3, pp. 6–7 (scholze line 296). Polynomial, zero-variable, q=1 and p=2 cases are Checks. Intrinsic q-crystalline cohomology and its comparison are supplied elsewhere: bhatt-scholze Construction 16.19 and Theorem 16.22 (bhatt-scholze line 4316, line 4378).

## Suppliers

The required direction is earlier foundations → HabiroCyclotomicCompletions → QWittVectors → Habiro consumers. Insert QWittVectors after its last supplier; do not add a consumer as a supplier to resolve a missing foundation.

| Supplier | Imported ownership |
| --- | --- |
| Pinned Mathlib, `6b7abb3c7686292736be2955bd3eb9ebf63b456a` | `WittVector`, `TruncatedWittVector`, `WittVector.map`, `ghostComponent`, `ghostMap`, `frobenius`, `verschiebung`, `teichmuller`; existing rings, polynomials, tensor products, étale algebras and completion carriers. These are p-typical Witt vectors, not QW.0 or QW.2. |
| Pinned Tau Ceti, `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` | `WittVector.isAdicComplete_span_p_teichmuller` and `TauCeti.WittVector.continuous_frobenius` / `continuous_frobeniusEquiv_symm`; reuse their p-typical scope. |
| DerivedModuleAlgebra §§0.K.1, 0.2, 1.1–1.8 | Koszul infrastructure, derived tensor, towers, derived completion, comparison with ordinary completion and complete flatness. |
| DGAInfinity Layers 0–1 | Graded signs, differential graded algebras, morphisms and cohomology algebra; QW.5 adds the q-Witt-specific relations. |
| EnhancedDerivedSheaves §0.3; E2:towers; E4.1–E4.4; E5:abstract | Enhanced derived tensor/limits and completion, and algebra objects. Its E5:animation is imported only if animated extensions are included; it does not own arithmetic Λ-perfection. |
| SchemeAndStackFoundations §§0.23a, 0.24, 0.29 | Étale topological invariance and characteristic-p scheme perfection/Frobenius when needed; keep these separate from arithmetic Λ-perfection. |
| HabiroCyclotomicCompletions | Import its cyclotomic polynomial/ideal, completion and gluing results. Its text and section identifiers are absent from the supplied inputs; exact section binding remains to be checked. QW.4 owns the relative coefficient Frobenius for that gluing. |
| PrismaticCohomology; DerivedDeRhamCohomology | Allowed earlier suppliers for δ-rings, intrinsic q-crystalline/de Rham objects and their comparison, not owners of the new relative QW.4 map. Their roadmap texts are absent; exact section contracts must be verified before the design claims those imports. Source §16 in bhatt-scholze is not a substitute for a roadmap section. |

## Consumers

- **HabiroCohomologyFoundations:** QW.1–QW.4, especially its filed §0.3 completed interface; QW.5–QW.6 for shared calculus. Its twenty-one references are reported by the issue and could not be counted in the available inputs.
- **HabiroRings:** QW.0, QW.1, relative degree zero and the full QW.4 perfect-cover/completed linearization contract.
- **RefinedTraceMethods:** shared q-Witt structures and framed calculus as needed for trace/cohomology comparisons.
- **HabiroCohomologyFoundationsPartII:** the same supplier interfaces for its extensions; no return dependency.

These consumer assignments preserve the filed ownership. Their package texts are absent, so section-level matching beyond the filed §0.3 is unverified, not invented. None may be used as a source of constructions this roadmap must supply.

## Sources

All seven works were fetched through the sources service from arXiv; all are **open-repository, certified** in sources.toml. Cite the versions read, not unverified published numbering. Page numbers above are the pages printed in the papers; cache page markers can differ substantially, especially in Wagner's q-Witt PDF. The `source id line N` locators above refer to the service's numbered extractions.

| Id | Work and legal version | Needed locators |
| --- | --- | --- |
| hesselholt | Lars Hesselholt, *The big de Rham–Witt complex*, [arXiv:1006.3125v3](https://arxiv.org/abs/1006.3125v3) | §1, Proposition 1.2, Lemmas 1.3–1.5, Proposition 1.19, Definitions 1.21/1.23, Lemma 1.24, Theorem 1.25: big Witt and Λ foundations. |
| borger | James Borger, *The basic geometry of Witt vectors, I: The affine case*, [arXiv:0801.1691v6](https://arxiv.org/abs/0801.1691v6) | §§1.16–1.18, Corollary 5.4, Theorem 9.2 and Corollary 9.4: prime-set Λ-rings and Witt étale input. |
| pridham | J. P. Pridham, *On q-de Rham cohomology via Λ-rings*, [arXiv:1608.07142v4](https://arxiv.org/abs/1608.07142v4) | Definition 1.22, Theorem 1.23, Definition 2.1, Theorem 2.8 and Lemma 2.9: complete framed calculus and residue-characteristic hypotheses. |
| wagner | Ferdinand Wagner, *q-Witt vectors and q-Hodge complexes*, [arXiv:2410.23078v5](https://arxiv.org/abs/2410.23078v5) | §§2.2–2.6, §§3.1–3.4, Proposition 4.1, Lemma 4.6, §§4.7–4.9/4.28; Theorem 5.1 (wagner line 3846) for the functoriality exclusion. |
| wagner-habiro | Ferdinand Wagner, *q-Hodge complexes over the Habiro ring*, [arXiv:2510.04782v2](https://arxiv.org/abs/2510.04782v2) | §1.22(e), §2.7 and Theorem 2.9 proof: exact perfect coverage and completed relative Frobenius interface. Later Habiro descent stays downstream. |
| scholze | Peter Scholze, *Canonical q-deformations in arithmetic geometry*, [arXiv:1606.01796v1](https://arxiv.org/abs/1606.01796v1) | §3, pp. 6–7; distinguish the construction from Conjecture 3.1. |
| bhatt-scholze | Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*, [arXiv:1905.08229v4](https://arxiv.org/abs/1905.08229v4) | Lemma 2.28; Construction 16.19 and Theorem 16.22: torsion and supplier/comparison boundary. |

The filed arXiv:2205.05073 identifies an astronomy paper, not Wagner's work; it is excluded from the manifest and mathematical references. No needed paper remains legally unavailable, so no missing-reference table is required.

## Risks

- **Input mismatch:** the named Habiro packages, PrismaticCohomology and DerivedDeRhamCohomology are absent from the provided checkout and packages; attempted public main-path reads also returned 404. ORDER.txt contains HabiroCyclotomicCompletions and the two allowed cohomology suppliers, but neither QWittVectors nor the four named consumers. Verify their actual accepted section contracts and final placement before design acceptance. This triage cannot certify the claimed five-package hold or the twenty-one citations.
- **Substantial new foundations:** neither pinned library supplies the discovered big Witt/Λ/q-Witt carriers. QW.0 and QW.1 are genuine general library work. Derived completion and graded foundations already have owners and must be imported; absent supplier contracts cannot be replaced by axiomatic data or a route-specific definition.
- **Generality boundaries:** relative definitions and étale base change do not need perfect coverage; relative V-injectivity and smooth torsion/completion comparisons do. QW.4's equivalence needs étale R/A. Ghost injectivity needs its torsion hypotheses. Never silently extend these conclusions to arbitrary bases or smooth algebras.
- **False extra structure:** ordinary restrictions do not generally descend to q-Witt vectors (wagner §2.14, wagner line 581); do not promise an ordinary restriction-based untruncated q-Witt ring. A framed difference complex has twisted multiplication; do not impose ordinary graded commutativity on that model. The unrestricted functorial q-Hodge package with the prescribed Witt/Frobenius reductions is obstructed over a non-rational perfectly covered base (wagner Theorem 5.1, wagner line 3846). Additional q-Hodge filtration data belongs downstream.
- **Source defects and versions:** retain the standing étale hypothesis in wagner-habiro Theorem 2.9 and correct the d F_n typo by its proof. The cache's distorted PDF pagination makes the recorded line locators essential. No mathematical claim relies on the wrong arXiv id or on the survey's conjectures.
