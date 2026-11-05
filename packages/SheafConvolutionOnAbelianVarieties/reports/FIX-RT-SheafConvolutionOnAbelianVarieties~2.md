# FIX-RT-SheafConvolutionOnAbelianVarieties~2

Two red-team passes of round 2: pass a (F01–F08) and pass b (F01–F04). Overlapping findings are settled once: 2a/F01 with 2b/F02 (effectiveness and torsion in §4.3), 2a/F03 with 2b/F01 (Schneider–Lang supplier), 2a/F02 with 2b/F04 (ownership of A♮ and of the Fourier–Mukai transform). Every finding was checked against the cached source lines, the supplier roadmaps at their current copies (main, or the open head printed by `roadmaps show`), and the pins. Eleven findings hold; one (2a/F07) holds as a build-order defect but its suggested repair is itself not completable from the literature, so it was applied differently.

Files changed: `packages/SheafConvolutionOnAbelianVarieties/README.md`, `.../design/plan.json` (top-level `gaps` only), `.../sources.toml`, and `.../Suggested.lean` (header only: the file is now a module-system file, see the build note under the checks; no declaration, docstring or statement changed).

## RT-SheafConvolutionOnAbelianVarieties~2a/F01, RT-SheafConvolutionOnAbelianVarieties~2b/F02 (P1) — applied

Verified: K2 line 677 (Theorem 2.2.3) composes the weight map with `h_*`, the pushforward to A/Γ_tors; K2 lines 776–784 (Remark 2.3.2) require G connected for Theorem 2.3.1 and say the Λ_i need not be effective, only the `g_*Λ_i`; the witness δ_a with 2a=0 (μ₂, two distinct cycles Λ_a≠Λ₀ with the same restriction to G°=1) holds, and so does the V₄⊂SO₃ witness (Ψ²U restricted to V₄ is ε₁+ε₂+ε₃−1).

Old → new (§4.3): (e) now compares characters of a maximal torus of G_u with the fibre of `h_*cc(N)` on A/(X_u)_tors, and each Weyl orbit is realized by a unique effective clean cycle on that quotient; (f) now assumes G_u connected (achieved by f_*K with K₀⊂ker f), gives Λ_i=cc(Ψ^eU_i) of degree dim U_i, effective only up to isogeny, and states `[et]_*cc(N)=S([t]_*Λ_i)` with effective factors. The API bullet and proof route follow. §4.4's route now pushes to A/K₀, applies (f) there, and returns to A along the isogeny with `q′∘f=[k]`, so m=etk. Four Checks added: δ_a of order two, V₄⊂SO₃, the SL₂→PGL₂ degrees after pushforward, and the torsion-quotient reading of (e).

## RT-SheafConvolutionOnAbelianVarieties~2a/F02, RT-SheafConvolutionOnAbelianVarieties~2b/F04 (P1, P3) — applied

Verified: Sch lines 574–613 define the D-module transform on A♮ and cite Laumon–Rothstein for coherence and the equivalence; Sch line 1242 (Proposition 16.2) uses base change to points; AbelianSchemesAndArithmeticModuli §A4.2 at its open head constructs `AbelianVectorExtension` and identifies E(Â) with the moduli of rigidified line bundles with connection on A; AbelianSchemesAndArithmeticModuliPartII §P1.1 (sibling checkout, earlier in the merge order) supplies P♮ with its universal relative connection and §P2.3 is the ordinary coherent Poincaré transform only. No roadmap owns the D-module transform (`roadmaps grep` for Laumon, Rothstein, Fourier–Mukai: only ClassicalAdicEtaleCohomology's unrelated nearby cycles, ASAM-II §P2.3 and AnalyticStacks' gerbe transform).

Old → new: §0.7 imports A♮=E(Â) from AbelianSchemesAndArithmeticModuli §A4.2 instead of constructing it; new §0.8 owns the transform FM_A with (a) coherence and base change to points, (b) the Laumon–Rothstein equivalence and Theorem 10.5 compatibilities, (c) Schnell's codimension bounds, reflexivity and reconstruction for simple modules, (d) Chern-class vanishing and Pic(A♮)=π⁎Pic(Â); old §0.8 is §0.9 and consumes §0.8(a), with "M regular holonomic" replaced by a bounded complex with regular holonomic cohomology. The holonomic-realization gap (README and plan.json) now names the bounded derived Riemann–Hilbert equivalence with its twist compatibility. New supplier contracts: AbelianSchemesAndArithmeticModuliPartII §P1.1 and SchemeAndStackFoundations §2.18 (`torIndependent_baseChange`). References to §0.8 in Layer 7 (§7.3 Needs, a Check, Dependencies) and in §0.4 now read §0.9. Parts (b)–(d) of §0.8 exceed what §0.9 alone needs; they are the inputs of the Euler-one route (2a/F07) and of §4.3(d), whose source proof (K1 Theorems 3.2 and 3.4) uses the reconstruction of FM_A(M) and the inverse transform.

## RT-SheafConvolutionOnAbelianVarieties~2a/F03, RT-SheafConvolutionOnAbelianVarieties~2b/F01 (P1) — applied

Verified: DiophantineApproximationAndTranscendence §3.5 on main (README lines 2336–2380) states Schneider–Lang only in Waldschmidt's exponential form for 𝔾_a^r×𝔾_m^s; Sim lines 379–398 apply the criterion for a connected commutative algebraic group to the extension 1→𝔾_m→G→A→1; `roadmaps grep` finds no owner of the group form (only EllipticPeriods' meromorphic-function form and DAT itself).

Old → new: the DAT contract keeps §3.5 for the exponential form and declares `gap:schneider-lang-commutative-groups` with the statement of Sim line 379 (2a's slug and statement); the same slug is in plan.json `gaps`. The application (Sim Proposition 3.4) is owned here as §0.7(c): a Q̄-point of A♮ with Q̄-valued holonomy is torsion, proved through the extension G; (b) now goes through (c) and the lifting argument of Sim's proof of Theorem 3.3 (Sim line 399). 2b's narrower slug was not used because the general criterion is the library statement and the extension argument is this roadmap's. The ρ=(2,1) Check now records the (c) conclusion explicitly.

## RT-SheafConvolutionOnAbelianVarieties~2a/F04 (P2) — applied

Verified at the open head of AbelianSchemesAndArithmeticModuli (`roadmaps show`, README lines 952–1041): §A1.8 part (1) states Weil's criterion over every normal locally Noetherian base for a smooth source; the sentence "states only over a connected Dedekind base" was outdated.

Old → new: `gap:rational-map-extension-to-abelian-varieties` deleted from the README and plan.json; the ASAM contract now consumes §A1.8(1) with the two-line deduction (DVR local rings at codimension-one points, properness, Weil's criterion, uniqueness by separatedness) and keeps the nodal-curve counterexample. §§1.5, 4.6 and 9.4 and the Layer 4 and 9 dependency lists cite §A1.8(1).

## RT-SheafConvolutionOnAbelianVarieties~2a/F05 (P2) — applied

Verified: for g=0 both moduli are a point and Φ is the identity. Old → new: §0.7 states "for g>0 it is not algebraic, and for g=0 it is the identity of a point"; a Check records the g=0 computation and that the elliptic connection line stays nonalgebraic.

## RT-SheafConvolutionOnAbelianVarieties~2a/F06 (P3) — applied

Verified: each listed bullet was a scope reminder, a repeated definition, or a restatement. Old → new: §0.6's last two Checks replaced by the two instance Checks (End of Q(δ₀⊕F_E[1]) has dimension 1 versus 2 before localization; End Q(δ₀⊕δ₀)=M₂(F)). Deleted at the listed locations: §1.1 (cancellation bullet), §2.1 (two), §2.3 (two, replaced by a Kummer-character computation and the δ₀⊗V normalizer computation), §2.4 (replaced by the Q̄⊂C instance), §3.3 (replaced by the n=2 row), §4.4, §4.5 (both, including the repeated minuscule definition), §4.7, §4.8 (three, the two parity restatements as well), §5.1, §5.2 (seed and ℤ-interpretation bullets; the (1,1) non-solution added), §5.4, §6.1 (replaced by the explicit ratios 0,0,1,0,0), §6.7 (restated n≥4 bullet replaced by the n=4 computation; n=2 bullet deleted), §7.1 (two, replaced by the translated-family and diagonal-group instances), §7.6, §8.1 (two, replaced by the order-p collision computation), §8.2 (replaced by the order-4 counting instance), §9.2, §9.4 (three, replaced by the d=1 and Néron–Severi-orbit instances). The S₃ Check was added to §2.1. Every section keeps at least three discriminating Checks.

## RT-SheafConvolutionOnAbelianVarieties~2a/F07 (P1) — applied differently

Verified: KW lines 795–814 prove Proposition 10.1(b) through the index formula and Lemmas 10.3–10.4 for simple X of dimension at least two and cite [44] for the nonsimple case; §1.5 listed none of these. The suggested repair is not completable from the sources: [44] (Weissauer, Degenerate perverse sheaves on abelian varieties, arXiv 1204.2247v3, fetched and read) proves only the Euler-zero classification, by induction with characteristic-p methods, and its lines 970–974 cite KW 10.1(b) on simple fibres; no written reduction of the Euler-one statement to simple factors exists in the sources, and KW's own argument does not cover dimension one. The complete proof for every abelian variety is K1 Lemma 3.5 (K1 line 1036): the Fourier–Mukai transform of a simple module of Euler characteristic one has reflexive rank-one H⁰, hence a line bundle, of vanishing first Chern class, hence π⁎P_x=FM_A(δ_x), and the equivalence gives δ_x.

Old → new: §1.5 keeps its place and statement (now explicitly for every dimension) and its route is the Fourier–Mukai argument, with Needs §0.4, §0.8 and the holonomic-realization contract; the index/conormal/purity targets were not added because this route does not use them, and the relocation to Layer 4 is unnecessary since §0.8 is in Layer 0. §4.8 and §7.1 consume §1.5 unchanged. A Check shows the dimension-one content (rank-two local systems on a punctured elliptic curve, tr[A,B]=2 criterion).

## RT-SheafConvolutionOnAbelianVarieties~2a/F08 (P1) — applied

Verified: K2 lines 595–598 count isomorphism classes of all subquotients; the genus-two witness holds over C (Ext¹ of dimension four, the classes e₁+λe₂ pairwise non-isomorphic for distinct λ, constituents i_*C_C[1] of Euler characteristic 2). Over the countable field F=Q̄_ℓ the family is countable, so the §4.3 context now states that coefficients are extended to C along ι:F→C (the same wording replaces "F is identified with C by a field isomorphism" in §0.9, which was false as stated since Q̄_ℓ is countable).

Old → new: the §4.3 route chooses u from the countable set of tensor words and bases of their Hom spaces, extends sub-local systems uniquely over the finite étale Gauss cover by surjectivity of π₁ from a dense open, and only then passes to vector-bundle germs; the uncountability of ⟨K⟩ is a Check.

## RT-SheafConvolutionOnAbelianVarieties~2b/F03 (P3) — applied

BSS, Sch and Sim added to the References with their locators and version notes; the K1 and K2 entries list the newly cited results.

## Checks run

- Build form of `Suggested.lean`: the worker's targeted build of the file with the plain `import Mathlib` header reported the toolchain warning that Mathlib at the pin is designed for the module system (every warning other than `sorry` is a build problem for the worker), so the header is now `module`, `public import Mathlib` and `@[expose] public section` before the namespace, the form of the newest roadmap merged on main (CoboundaryExpansion, `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean`); the gate's import rule accepts `public import Mathlib` as the single Mathlib import. Nothing after the header changed: the nine declarations, their docstrings, statements and `sorry` bodies are identical.
- `lake env lean packages/SheafConvolutionOnAbelianVarieties/Suggested.lean` from the content checkout, after the header change: elaborates; output is exactly five `declaration uses sorry` warnings (lines 73, 81, 93, 110, 127, the five headline theorems) and no other warning, exit code 0.
- `#check @name` sweep over all nine declarations in one scratch file (a copy of the module-form file with the nine `#check` lines appended, elaborated once): every elaborated type is identical, token for token, to the worker's signature record; no `variable` block exists, so no binder can be lost. Nothing changed.
- Dependency gate, verbatim: `depcheck: 207 roadmaps, 1789 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Notation repair after the worker's check (28 brace-scripted TeX superscripts and subscripts in text added this round, all in `packages/SheafConvolutionOnAbelianVarieties/README.md`): rewritten in the README's Unicode style (`⁎` for pullback, single-character scripts, `O♮` named once in §0.8 for the structure sheaf of A♮, `𝔾_a^r×𝔾_m^s`, `H²ⁱ`, `D^(≥0)_coh`), together with every caret-asterisk pullback in the same text and the same fragments in this report; no statement changed. `Suggested.lean` is untouched by the notation repair. The dependency gate rerun after it gives, verbatim, `depcheck: 207 roadmaps, 1789 edges, 0 problem(s)`, and `roadmaps resolve` the same three leads.
- `roadmaps resolve`: the same three leads as before (SpringerResolutionAndCharacteristicCycles §D, LieHighestWeightPartII §N2, StableReductionPartII §MC.4), all board design packages earlier in the merge order; no unresolved Lean name.
- Citations resolved at their current copies: AbelianSchemesAndArithmeticModuli §§A1.8(1), A2.2, A4.2 (open head via `roadmaps show`); AbelianSchemesAndArithmeticModuliPartII §P1.1 (sibling checkout); SchemeAndStackFoundations §2.18 (`torIndependent_baseChange`, `DQCoh`, `totalDirectImage`) and DiophantineApproximationAndTranscendence §3.5 (main); ComplexComparisonPartII §C5.6 (open head). All are earlier in the merge order.
- Sources: no new manifest key. The K1, Sch and Sim locators were extended (K1 §3; Sch Theorems 3.2, 4.1, 10.3, 10.5, 19.1, 21.1, Corollaries 21.5, 25.3, Propositions 19.2, 22.1, 25.1; Sim Proposition 3.4). The cached Sch text is arXiv v1 with 26 sections; K1 cites the published numbering (its Propositions 21.1 and 24.1 are Propositions 22.1 and 25.1 of v1), recorded in the version note. Four texts were fetched to settle 2a/F07 and are not cited (Weissauer: arXiv 1204.2247v3, math/0610923v4, 0704.1238v2, 1110.0095v3); they stay in the cache and are not in the manifest. No needs-references file was written.
- Ownership by object (roadmap service over main and the open heads, the sibling checkouts, the board packages): the D-module Fourier–Mukai transform and Laumon–Rothstein equivalence, Schnell's structure theorems, Simpson's torsion criterion for A♮ and Euler-one rigidity have no other owner; the universal vector extension (ASAM §A4.2) and the Poincaré connection (ASAM-II §P1.1) are imported. Open pull requests beyond the indexed ones and the sibling checkouts were not checked.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.7(c) torsion criterion | E/Q̄, ρ=(2,1); torsion ρ | 2^k≠1 for all k≥1, so not torsion, hence not a Q̄-point of E♮; G′ of dimension g=1 surjects onto E, kernel G′∩𝔾_m finite | holds; hypotheses on both Betti and de Rham sides needed |
| §0.7 Φ algebraic | g=0; E | point ↦ point, identity; t↦(e^(−t),e^(−tτ)) Zariski dense | g=0 excepted, g>0 unchanged |
| §0.8(a) fibre formula | δ_a; O_A, g>0; g=0 | fibre of π⁎P_a is one line; H^•(A,C)[g] at the trivial connection and 0 elsewhere; identity functor | holds |
| §0.8(c) codimension | O_A | S^k at the origin, codim 2g≥2·abs(k) for −g≤k≤g; H⁰ a skyscraper, χ=0 | simple-module part correctly excluded |
| §0.8(b) twist formula | δ_a | δ_a⊗(L,∇)=δ_a; t⁎π⁎P_a=π⁎P_a by translation invariance of P_a | both sides agree |
| §0.9 realization | δ₀⊕δ₀[1] | two nonzero cohomology modules | bounded-complex form needed |
| §1.5 Euler-one | E, j_*L[1], L irreducible rank 2 | χ=2−dim L^T; fixed vector ⟹ tr[A,B]=2 ⟹ reducible; so χ=2≠1 | dimension-one content, covered by the FM route |
| §1.5 route | simple M, χ=1 | generic fibre dimension 1 ⟹ rank H⁰=1; c₁(F)=Σ(−1)^k c₁(H^k)=c₁(ℒ) since codim Supp H^k≥4 | holds |
| §2.1 Check | δ₀⊗V, V the 2-dimensional S₃-module | End dimensions 1 (arithmetic) and 4 (geometric) | holds |
| §2.3 Check | δₓ, x=mz versus x∉mA(k) | Kummer character trivial versus nontrivial for suitable χ | normalization is a scalar, normalizes 𝔾_m |
| §2.4 Check | Q̄⊂C, δ_y with y of infinite order | category of Q_C: {δ at ny}, group 𝔾_m; δₓ for x∉A(Q̄) absent | holds |
| §3.3 Check | n=2 | d copies of 0 and of −1, total 2d | holds |
| §4.3(e) torsion | δ_a, 2a=0≠a | G_u=μ₂, G_u°=1, Λ_a≠Λ₀, images under quotient by ⟨a⟩ both Λ₀ | quotient needed |
| §4.3(f) effectiveness | SL₂→SO₃, V₄ | Ψ²U on T=e²+e⁻², Ψ²U on V₄=ε₁+ε₂+ε₃−1 | effectiveness only after isogeny |
| §4.3(f) degrees | SL₂→PGL₂ | degrees 2 and 3, unchanged by [2] and [t] | holds |
| §4.3(b) countability | genus two, K=i_*(E₁⊕E₂)[1] | dim Ext¹=4; classes e₁+λe₂, λ∈C, pairwise non-isomorphic; constituents of χ=2 | uncountable over C; countable over Q̄_ℓ, hence the ι convention |
| §4.4 m | f,[e],[t],q′ | m=etk; degrees of q′_*[t]_*Λ_i′ equal dim U_i | holds |
| §5.2 Check | (1,1) | 1−4+1=−2≠2 | non-solution |
| §6.1 Check | 1[−1]+23[0]+1[1], k=5 | r=4, t=19, ratios 0,0,1,0,0, sum 1=A(3,2) | holds |
| §6.7 Check | n=4, d=1 | row 1,11,11,1, no realization; n=3 gives 1,4,1 from 0,0,1,1 | holds |
| §7.1 Checks | translated family; constant family | K₀ constant with G* irreducible; diagonal G, not G×G | hypothesis necessary |
| §8.1 Check | characters of exact order p | σψ trivial, p²ⁿ−1 collisions for (1,2) | prime-to-p needed |
| §8.2 Check | ψ of order 4 on E/Q | at most 96 (the order of GL₂(Z/4)) conjugates; 4^4=256>96; exact order 2^r, r≥3, avoids them | holds |
| §9.4 Checks | d=1; NS class | h⁰(L)=1, M a point or empty; translation orbit of dimension n; Picard-fixed translates in ker φ_L, finite | holds |
| F04 deduction | smooth X over k, A proper | codimension-one local rings are DVRs; valuative criterion; A1.8(1) | gap redundant |

## Notes for the maintainer

- Section numbers: the old §0.8 (structure of exceptional loci) is now §0.9; the new §0.8 is the Fourier–Mukai transform. No roadmap on main or at an open head cites this roadmap (`roadmaps grep`), so nothing outside the package needs updating.
- Gaps: `rational-map-extension-to-abelian-varieties` removed; `schneider-lang-commutative-groups` added (DiophantineApproximationAndTranscendence §3.5); `holonomic-riemann-hilbert-index` restated in the derived form. Eighteen gaps remain, each in plan.json and under its README contract.
- The §4.3 target now declares its dependence on §0.8: K1's proofs of its Theorems 3.2 and 3.4 (the component-group description used in §4.3(d)) use the reconstruction of the transform and its inverse.
- The coefficient convention for the Betti and de Rham statements of §§0.9 and 4.3 is extension of scalars along a fixed embedding Q̄_ℓ→C; the earlier wording claimed a field isomorphism, which does not exist.
- `Suggested.lean` is now a module-system file (`module`, `public import Mathlib`, `@[expose] public section`), the form of the newest merged roadmap; with the plain `import Mathlib` header the pinned toolchain emits a non-`sorry` warning that the worker's build treats as a problem. Its declarations are unchanged.
- No suspicious instructions were found in the reviews.
