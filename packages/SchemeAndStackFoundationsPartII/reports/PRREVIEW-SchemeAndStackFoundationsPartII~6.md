# Review of SchemeAndStackFoundationsPartII (pull request #2272 at de80147)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every sampled statement of Layers 1–3 agrees with its source at the locator given (hypotheses, theorem number, page), the Checks recompute to the stated values, both Lean theorems elaborate with `sorry` as the only warning and neither closes by one tactic, and every cross-roadmap citation and pinned declaration resolves. There are three small corrections and two format notes, none blocking. Two things are left to the humans who approve: the sections run parallel to the numbered results of one article (in an order the dependency lines force), and the acceptance is conditional on the twenty declared supplier contracts and on the SchemeAndStackFoundations revision that adds §2.9a.

## C01 — The opening says the roadmap "follows" two articles, although its order is the one its own dependency lines force

A reader of the first paragraph (`TauCetiRoadmap/SchemeAndStackFoundationsPartII/README.md`, line 3: "It follows Česnavičius–Scholze, *Purity for flat cohomology*, §§5.6–5.7, and Bouthier–Česnavičius …") is told that the plan is a source's arrangement. It is not: §1.3 needs §§1.1–1.2, §1.4 needs §1.3, §1.5 needs §1.4, §1.6 needs §1.5, §2.2 needs §1.6 and §2.1, §2.3 needs §2.2, §2.4 needs §2.3, §2.5 needs §2.2, §2.6 needs §2.5, and §3.2 needs §3.1 and §1.5 (the *Needs:* lines at 87, 101, 115, 129, 242, 258, 272, 286, 300, 339), so the chain is forced, and §2.0 and the three-layer split are the roadmap's own.

The smallest change is to credit the results without presenting the sources as the plan, for instance "Its theorems are those of Česnavičius–Scholze, *Purity for flat cohomology*, §§5.6–5.7, with the algebraization criterion of Bouthier–Česnavičius, §2.1."

## C02 — The description's dependency blocks name a supplier the README does not cite and omit the one its prose names

The blocks `depends-on` and `merge-order` of the description list FunctorOfPoints (#2465) as a supplier that must merge first. The README cites no roadmap of that name: the only occurrence of the word is the Tau Ceti file `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean` in the supplier row of `AlgHom.mapValue` (line 408). In the other direction, the prose says that #2531, which adds SchemeAndStackFoundations §2.9a, "has to merge before this pull request", and neither block lists it. A reader of the blocks would wait for an unrelated pull request and not for the one that matters.

The text that would be right: the chain HeightsRationalPointsAndObstructions (#1017) → PurityForFlatCohomology (#1840) → the SchemeAndStackFoundations revision (#2531) → this pull request, with FunctorOfPoints removed from both blocks.

## C03 — Several Checks are the identity case and hold for every candidate statement

The Checks "For (R,0) the comparison is the identity" (§1.2, line 68), the identity cosimplicial algebra (§1.4, line 95), "For I=0, Â=A" and the constant functor (§2.1, lines 222–223), "For I=0" (§2.2, line 237), the discrete ring (§2.3, line 251) and "For R→R" (§2.6, line 295) are true, but each holds for any functor in place of flat cohomology and for any degree range, so they cannot tell the stated theorem from a wrong variant. They may stay as sanity checks if marked as such.

One that could fail, for §2.1: with (A,I)=(ℤ_(p)^h,(p)) and F(C)=Hom_A(ℤ_p,C), which does not commute with filtered colimits, the reduction ℤ_p→𝔽_p in F(A/I) lifts to the identity in F(Â) but F(A) is empty (an A-algebra map ℤ_p→A composed with A→ℤ_p is a ring endomorphism of ℤ_p, hence the identity, which would make the countable ring A surject onto ℤ_p). So the finitary hypothesis is needed.

## N01 — Three locators name the wrong kind of item or one page too many

"CS24 §4.1.2, p.36" (Conventions, line 35) is Example 4.1.2; "§§4.1.5–4.1.6" in the References is §4.1.5 and Lemma 4.1.6; BC22 Proposition 2.1.4 with its proof is on p.7 alone, not pp.7–8 (line 434).

## N02 — Four rows of the Tau Ceti supplier table are consumed by no *Needs:* line

`TauCeti.AffineGroupSchemeCat.algebraPointsFunctorIsoCoordinatePointsFunctor`, `TauCeti.smoothAffineGroupSchemeProperty_inverseImage`, `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual` and `…cartierDualBaseChangeNatIso` (lines 409, 410, 413, 414) appear only in the table. The contracts gap:classical-affine-group-adapter and gap:begueri-resolution speak of "the pinned point comparison" and "native Cartier dual"; naming these declarations in their *Needs:* lines would say where the rows are used.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 derived complete ⇒ henselian (CS24 Lemma 5.6.2, p.71, line 2974) | A=ℤ_p, I=(p); ℤ, I=(p); A=𝔽_p⊕𝔽_p[1], I=0 | ℤ_p henselian; Jac(ℤ)=0 so p∉Jac, hypothesis fails; I=0 trivially henselian | agrees with source; "derived a-complete for all a∈I" is §5.6.1's definition | none |
| §1.2 H² over henselian pair (Lemma 5.6.3, p.71) | (ℤ_p,p), μ_p; ℂ[[t]], μ_n | Pic=0, Br(ℤ_p)=0 so H²=0=H²(𝔽_p,μ_p); H¹=ℤ_p^×/p=ℤ/p (p odd) | true | none |
| §1.3 continuity with bound (Lemma 5.6.4, pp.72–73, line 3000) | A=ℤ_p, a=p, μ_p; a=1 | H^i(ℤ_p,μ_p)=H^i(𝔽_p,μ_p)=0 for i≥2; a=1: A≃Rlim A/^L1=0 | hypotheses and equivalence with π₀ form match source | none |
| §1.4 principal complete descent (Lemma 5.6.5, pp.74–75) | a=1; split cover A→A×A | a=1 forces all rings 0, both sides 0; split Čech nerve contracts | matches line 3081: A, A^j complete, hypercover mod a | none |
| §1.5 complete continuity (Theorem 5.6.6, p.75) | r=0; A=ℤ/p², a=p | r=0: constant tower; ℤ/p²/^Lp has π₀=π₁=𝔽_p (ker and coker of p) | matches line 3138 | none |
| §1.6 ordinary quotients (Example 5.6.7, pp.75–76) | ℤ_p, μ_p, p odd | μ_p(ℤ/p^(n+1))=1+p^n→1 so lim¹=0; (ℤ/p^n)^×/p=ℤ/p for n≥2, lim=ℤ/p; H¹(𝔽_p,μ_p)=0 | surjective, not injective, in degree 1; sequence as at line 3174 | none |
| §1.7 henselian failure (Remark 5.6.8, p.76) | 𝔽_p{t} vs 𝔽_p[[t]], μ_p | (1+th₁(t^p))/(1+th₂(t^p))∈𝔽_p[[t^p]] forces k=1, h₁=h₂: uncountably many classes; 𝔽_p{t} countable | true | none |
| §2.0 points, coefficient sheaf, flat cohomology | μ_p(ℤ/p²); α_p(𝔽_p[t]/t^p); ℤ/2(ℚ×ℚ); μ_(p²)→μ_p on 𝔽_p[t]/t^p; H¹(ℤ₂,μ₂); A=0 | 1+pℤ/p²≅ℤ/p; ideal (t), dim p−1; 4 idempotents, (ℤ/2)²; (1+m)^p=1; (ℤ/2)² on −1, 5; 0 | all Checks true; sheafification fails at universe u and exists at u+1 at the pin | none |
| §2.0 `IsHenselianNonunitalSubring` (BC22 §2.1.1, p.5, line 214; SP Lemma 15.11.6) | 0; ℤ⊂ℤ; 3ℤ_(3); pℤ_p | y=0, root T=1; 2(1+y)=1 unsolvable; T²−T−3 has discriminant 13, no rational root; henselian | Gabber's criterion as in source; quasi-inverse clause = Zariski; wrong model (quasi-inverses only) excluded by 3ℤ_(3) | none |
| §2.1 finitary functors (BC22 Lemma 2.1.3, pp.6–7, line 253) | (ℤ_(p)^h,p), F(C)=C; F=Hom_A(ℤ_p,−) | ℤ_(p)^h→ℤ_p injective; non-finitary F: F(A)=∅, F(Â)∋id | hypotheses (Noetherian, regular fibres, filtered colimits) match | C03 |
| §2.2 and `flatCohomology_henselian_invariance` (Corollary 5.6.9, p.76) | (ℤ_(p)^h,p), μ_p; (𝔽_p[[t]],t), α_p; I=⊤; n=0 | H¹=ℤ/p→0 (units of ℤ_(p)^h that are p-th powers in ℤ_p are so in ℤ_(p)^h); 𝔽_p[[t]]/𝔽_p[[t]]^p≠0→0; I=⊤ forces R=0; n=0 asserts nothing | Lean = README: surjective n≥1, bijective n≥2, no finiteness on I | none |
| §2.3 and `flatCohomology_algebraization` (Corollary 5.6.10, p.76) | B=A, B′=I coarse topology; (ℤ_(3),3ℤ_(3)); indiscrete ℚ; discrete B | B̂=A/I; Br(ℤ_(3))[3]∋class with invariants 1/3, −1/3 at 2, 5 vs H²(𝔽₃,μ₃)=0; Br(ℚ)[2]≠0 vs 0; identity | hypotheses needed and stated; Lean basis clause = open B′-ideals inside every neighbourhood | none |
| §2.4 Laurent puncture (Example 5.6.11, p.77) | R=𝔽_p, μ_p | Br(𝔽_p((t)))[p]=ℤ/p; unit classes countable vs uncountable in degree 1 | B=R{t}[1/t], B′=tR{t} as in source | none |
| §2.5 punctured comparison (Corollary 5.6.12, p.77) | I=(0); I=(1); ℤ_(p)^h→ℤ_p | cofibre C with C⊗π₀A=0 connective ⇒ C=0, U=∅; (1)⊂Jac ⇒ zero ring; 𝔽_p⊗^Lℤ_p=𝔽_p | matches line 3223 | none |
| §2.6 Noetherian neighbourhoods (Corollary 5.6.13, p.77) | I=0; ℤ_(p)^h→ℤ_p, U=D(p) | n=1 gives R≅R′; Br(ℚ_p)[p]=ℤ/p both sides | matches line 3239; injectivity input is BC22 Corollary 2.3.5(c), pp.30–31 | none |
| §3.1 perfectoid discreteness (Lemma 5.7.1, p.78) | A=𝔽_p, M=A[1]; M=0 | A[1] has π₀=0, π₁≠0: not flat, hypothesis fails; 0 discrete | matches line 3261 | none |
| §3.2 descent with supports (Theorem 5.7.2, pp.78–81) | I=(1); empty tuple; A=𝔽_p[t^(1/p^∞)]→A×𝔽_p | supports 0=0; RΓ_∅-complement = RΓ, fpqc hyperdescent; 𝔽_p/^Lt=0, A-torsion factor not flat | matches line 3288; structure map a↦s(a^(p^n)) makes φ A-linear (s(a^(p^n))^p=s(a^(p^(n+1)))) | none |
| Conventions: V−1 fibre, indexing | ℤ/p and μ_p over 𝔽_p; k⊕k[1], G_a | V=σ⁻¹=1: H⁰=H¹=𝔽_p=H^i(𝔽_p,ℤ/p); V=0: fibre 0=H^i(𝔽_p,μ_p); π₁=k ↔ H⁻¹ | agrees with CS24 Example 4.1.2, line 1495 | N01 |
| gap:split-etale-refinements | étale cover S of R̃/J lifted to S̃ by SP Lemma 10.143.10 | k+j=1 with D(k)⊂image: S̃×R̃[1/j] is a cover, its section reduces to S→R̃/J | contract true as stated | none |
| gap:henselized-formal-fibres | SchemeAndStackFoundations §0.21 on main | no statement of SP 0AH2/0AH3 there (only 07PV) | not already provided | none |

- Source locators checked against the text: 41 (CS24 22, BC22 6, SP 6 tags over three chapters, Y18 3, BG80 1, R70 1, C19 1, DJ 1); all confirmed except the three of N01.
- Library declarations opened at the pins: 12 Mathlib rows and 21 Tau Ceti rows of the supplier tables, each at the file and line given (for example `HenselianRing`, Mathlib/RingTheory/Henselian.lean:81; `TauCeti.Henselization.completionEquiv`, TauCeti/RingTheory/Henselization/Quotient.lean:155); all present with the stated content.
- Cross-roadmap citations resolved: 10 roadmaps, every cited section and name found (SchemeAndStackFoundations on main and §2.9a with `fppfCohomology_algSpec` at the head of #2531; PurityForFlatCohomology at #1840; HeightsRationalPointsAndObstructions §2.6c at #1017; the rest on main).
- Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates, `sorry` on the two theorems the only warnings; `#check @name` on all six declarations compared with the README, no binder lost. One-tactic probe (`rfl`, `simp`, `infer_instance`, `aesop`) closes neither theorem. Extra probes: `HasExt.{u+2}` exists for the sheaf category through `HasDerivedCategory.standard`; `HasSheafify` fails for `AddCommGrpCat.{u}` and holds for `.{u+1}`; `⊤ ⊂ ℤ` is not `IsHenselianNonunitalSubring`.
- Declared gaps: 20 slugs in the README, the same 20 in the plan; each names a supplier and a section. Headlines: §2.2 and §2.3 stated; §1.5 and §3.2 named in the module docstring as not statable (no animated rings at the pins: no declaration matching derived completeness or animated algebras in either library).
- Duplication: no declaration of the pins and no other roadmap, on main or open, states CS24 5.6.2–5.6.13 or 5.7.1–5.7.2 or defines the four Lean definitions.
- Overlap check: read PurityForFlatCohomology, ArcTopologyAndDescent, PrismaticCohomologyPartIII, PrismaticCohomology, SchemeAndStackFoundations (#2531); nothing shared. PurityForFlatCohomology owns CS24 §§5.2.4–5.5 and names this roadmap as importer; PrismaticCohomologyPartIII §6.0 owns animated flat cohomology, the Bégueri resolution and the deformation triangle; SchemeAndStackFoundations §2.9a owns fppf cohomology on the big site.

Source independence: 16 passages compared with 3 sources (CS24, BC22, SP), none copied; longest shared run 17 words, the conclusion of BC22 Lemma 2.1.3 (BC22 line 258; README line 217), a formulaic statement; largest share CS24, 46 of 71 source citations; contents compared with CS24: §§1.1–1.7 ↔ 5.6.2–5.6.8, §§2.2–2.6 ↔ 5.6.9–5.6.13, §§3.1–3.2 ↔ 5.7.1–5.7.2 in the same order, an order the *Needs:* lines listed in C01 force; three layers against two source sections, §2.0 and §2.1 from outside it.

Research link: Layers 1–3 state the continuity formula, henselian invariance and adic descent of Česnavičius–Scholze (2023), §§5.6–5.7, with the algebraization criterion of Bouthier–Česnavičius (2022), §2.1, used for torsors over complete and henselian rings and for flat cohomology of perfectoid rings; rests on the README's Summary and on CS24 lines 2954–3260.

## Not verifiable

- The published numbering of Y18 (2.8, 4.3, 6.9), which the README gives beside the preprint numbering: only the preprint was read.
- The claim of the description that four review rounds and two red-team rounds preceded the port: not a matter of the folder.

## Source issues

- **Gap** in CS24 at proof of Theorem 5.7.2, p.81: the source says supports cohomology of the non-Noetherian Witt ring along J is the colimit of RHom out of the quotients by powers of J, citing a lemma on the torsion functor; it should be justified by weak proregularity of J or replaced by the Koszul form; affects the proof.
- **Misprint** in CS24 at proof of Theorem 5.7.2, p.79: the source says the common fibre satisfies the analogues of the first display and twice the second; it should be the first, second and third displays, as on p.80; affects nothing.
- **Misprint** in CS24 at Example 5.6.7, p.75: the source says "for i ≥ 2" before a display that includes surjectivity for i ≥ 1; it should carry no restriction on i there; affects nothing.
- **Misprint** in CS24 at §5.6.1, p.71, and proof of Theorem 5.7.2, p.81: the source says the ideal is generated by a₁ up to a_n; it should be a₁ up to a_r, n being the exponent; affects nothing.

## For the human reviewers

- Arrangement: the README's sections correspond in order to CS24 5.6.2–5.6.13 and 5.7.1–5.7.2, and line 3 says the roadmap "follows" that article; the order is forced by the *Needs:* lines (C01).
- Conditional acceptance: twenty declared contracts ask SchemeAndStackFoundations, PrismaticCohomologyPartIII and DerivedModuleAlgebra, all on main, for statements they do not yet make; §2.9a exists only at the head of #2531.
- Wording: a 17-word run is shared with BC22 Lemma 2.1.3 (README line 217, BC22 line 258).
- Licence: DJ is an undated author note read from the author's page; it is cited once, for a convention (line 33).
