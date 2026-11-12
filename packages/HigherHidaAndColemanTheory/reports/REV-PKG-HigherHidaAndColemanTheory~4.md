<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6788831051 -->
Review (codex) of e65c286

Verdict: needs_changes

1. **F01** (P1) Relative properness does not give finiteness over the coefficient ring

   **Location:** `packages/HigherHidaAndColemanTheory/README.md:345`, standing setting of Layer 2; consequences at lines 415, 435 and 457. The setting allows “a noetherian affine base S of finite type over ℤ”, whereas §2.4 concludes “bounded finite discrete A-cohomology”.

   **Claim:** Properness over the independently specified S suffices for finiteness, perfectness and the scalar finite-rank argument over A.

   **Witness:** Set A=𝔽₂ and S=X=C=Xbar=Cbar=Spec 𝔽₂[t], with identity projections, F=O, T=id and empty boundaries. Every stated strict/compact condition holds, but ordinary H⁰=𝔽₂[t] has infinite A-dimension.

   The structure maps to S are identities, hence proper. F is coherent and A-flat. Both boundary ideals are the unit ideal, so every strict inequality and compact containment holds. The correspondence extends everywhere. Localization at the identity does nothing. Thus §2.4 is false on this input, and the perfectness assertion of §2.6 fails too. The identity of this infinite-dimensional vector space cannot factor through a complex with finite A-cohomology. In §2.8(a), “over the proper core” must not conceal this distinction between relative coherence and scalar finiteness. BP-Hida line 955 explicitly identifies S with Spec A before Theorem 2.5.1; lines 958–961 give the finite-A conclusion in that setting.

   **Exact repair:** Identify S=Spec A in the scalar finiteness/perfectness/finite-rank statements and their common standing hypotheses, with A noetherian of finite type over ℤ and with the Artinian restriction where required. Describe coefficient extensions together with the corresponding base change. General relative dynamical compactifications may remain general, but their relative coherent output cannot be called finite over an unrelated A. Propagate the qualification through §§2.4–2.8 and add this affine-line negative control. **Repair test:** Spec 𝔽₂[t] is not proper over Spec 𝔽₂, so it is excluded from the scalar theorem; the proper point Spec 𝔽₂ gives ordinary H⁰=𝔽₂, dimension 1 and a perfect complex.

2. **F02** (P2) A pure cocharacter is sufficient, not necessary, for a pure-power ratio

   **Location:** `packages/HigherHidaAndColemanTheory/README.md:516`: “Only when t=λ′(p) for a cocharacter λ′ is c_w′(t) the pure power p^(n_w′)”.

   **Claim:** A comparison character can have unit part 1 only if the torus element itself has trivial unit part.

   **Witness:** For GL₂, p=3, κ=(2,0), take t=diag(2,6). The two normalization characters have values 1/12 and 1/36. Their ratio is 3, although t is not λ′(3) for any cocharacter.

   In the lower-Borel convention, ρ=(−1/2,1/2), ν_id=(−1,−1), ν_long=(0,−2), and the ratio character is (−1,1). The nontrivial central unit diag(2,2) lies in its kernel. Valuations (0,1) place t in the same strict positive cone as diag(1,3). No cocharacter of the split torus evaluates to first coordinate 2 at 3. This is an overclaim added while repairing the genuine unit-loss defect; the revised character-ratio identity itself is correct.

   **Exact repair:** Replace “Only when” by a sufficient statement: “For t=λ′(p), the scalar is the pure power p^(n_w′).” Alternatively state the exact equivalence: its unit factor is 1 precisely when the ratio character evaluates to 1 on the unit part of t. Keep all t∈T++, and add diag(2,6) beside diag(2,3). **Repair test:** diag(2,6) gives c=3 and 3·(1/36)=1/12; diag(2,3) gives c=3/2 and (3/2)·(1/9)=1/6. Both satisfy the repaired statement.

3. **F03** (P3) The all-ones Hecke action in the new Check is not an action

   **Location:** `packages/HigherHidaAndColemanTheory/README.md:635`: “with every Hecke operator acting by 1”.

   **Claim:** This gives a compatible spherical-Hecke action on C_s=ℤ/3^s[0].

   **Witness:** In genus one, choose tame level 5, p=3 and ℓ=2. Modulo 9, the convolution relation in line 632 becomes 1²=1+3·1, namely 1=4, for the proposed all-ones assignment.

   **Exact repair:** Use the integral degree character of the away-p spherical Hecke algebra, reduced modulo 3^s, in this Check. A separately chosen controlling ordinary operator may act by 1. Keep the conclusion that the limit has a ℤ₃-linear, not ℤ/3-linear, action. **Repair test:** The degree character sends T₂, T₄ and the central double coset to 3, 6 and 1. Thus 3²=6+3·1=9, and both sides are 0 modulo 9. The limit remains ℤ₃[0], where 3·1=3≠0. The mathematical distinction the Check was intended to illustrate survives.

## Verified sound

The three findings are repairable. The review did not change README.md, Suggested.lean, metadata.toml or sources.toml. All four recorded source texts were readable. The package's general scope, supplier direction and acceptance-file policy pass; successful elaboration does not establish the false prose statements above.

### Previous findings checked first

All seven findings of the previous review and the corresponding repair claims were checked individually. None was marked not actionable. Quotations below are from the present `packages/HigherHidaAndColemanTheory/README.md`; their mathematical tests appear in the computed table.

| Previous finding | Repaired passage and location | Assessment |
|---|---|---|
| F01, lost normalization unit | Line 516: “c_w′(t)=(ν_(w₀)(κ)−ν_(w′)(κ))(t)”; line 525 retains p^(n_w′)ε_w′(t); §3.6 uses positive valuation. | Partly repaired overall: the character-ratio identity and its consumers are repaired. The newly added necessity assertion has the separate R02 defect. |
| F02, finite coefficients on a completed complex | Line 617: “No A_s acts on the p-adic limit C_w(κ,χ,ε) itself.” Lines 625–628 give actions on reductions and an O-linear limit action. | Repaired in the theorem, API and §4.7. The new illustration introduces the independent false Check R03. |
| F03, missing Iwasawa scalars | Line 749 defines the image of “Λ⊗_ℤ T^S→End_(D(Λ))(M_w^ε)”. | Repaired. The image is now scalar closed; the Λ-rank-one and nilpotent rank-two tests distinguish it from the old ring image. |
| F04, universal isogeny on general abelian type | Line 1142: “the G(𝔸_f)-equivariant structure of the Levi torsor gives an isomorphism p1^*M_dR≅p2^*M_dR”, constructed on the auxiliary cover and descended. | Repaired. The universal-isogeny argument is confined to the auxiliary Hodge-type construction. The PGSp₄ test at line 1159 rejects descent of standard H¹ while allowing the quotient coefficient torsor. |
| F05, preservation of arbitrary allowed supports | Line 1142: “On its finite-slope cohomology define the action by transport through the canonical continuation isomorphisms”; line 814 defines period-saturated pairs. | Repaired. The point-added-to-Z test at line 1160 has unequal support memberships despite equal periods. General allowed pairs remain in scope. |
| F06, a pro-Banach object called Banach | Line 814: “Its limit has Fréchet terms; it is not a single Banach complex.” Lines 843, 1013, 1038 and 1142 retain compact-stage factorization. | Repaired. Finite projective models are claimed for justified slope blocks, not for the entire quasi-Stein section space. |
| F07, incorrect GSp₄ diagonal | Line 1411: “t₁=diag(p⁻¹,p⁻²,1,p⁻¹)”; lines 1421–1423 compute products and pairings. | Repaired. Both paired products are p⁻², and the four stated pairings are 6,6,11,11. |

The pattern sweep covered all 68 numbered target subsections and all Needs lines: scalar versus relative finiteness, finite versus completed coefficients, character units, Iwasawa scalar closure, support transport, abelian descent, Banach limits, and torus conventions. The sampled targets and changed passages were checked anew. Computed rows from the previous review were relied on only for unchanged formulas, then compared with the present statements and Checks. Sections previously described without computed evidence were read in full. No additional occurrence requiring a separate finding was found.

### Principles, shape and acceptance file

The opening explicitly extends PadicFamilies as Part II and identifies its stopping point. The general Siegel construction retains every genus, cofinal p=2 levels and singular chambers. Coleman theory retains locally quasi-split abelian-type scope. No route-specific shortcut, re-planning, computational algorithm, copied source passage, forbidden supplier, upward dependency or cycle was found. The nine layers are named by their mathematical constructions; their dependency lines explain the order without adopting a source's chapter arrangement.

All 68 target subsections, the nine layer endings and all 24 explicit definition/API blocks were read. Each definition block has at least three Check bullets. Exact hypotheses and locators are present, subject to R01–R02; a Check quota does not repair R03. Shape was compared with the main-branch PadicMeasuresIwasawaAlgebras and ResolutionOfSingularitiesCharacteristicZero roadmaps. There are no machine paths, pull-request narrative, forbidden options, sorry'd data or undeclared own backticked API names in the package. The six native backticked names are resolved below. Four cited works have four manifest entries; no author-flagged unverified locator remains.

`Suggested.lean` has one `import Mathlib`, one module docstring and the correct empty namespace. Running the requested `lake env lean` command from the pinned content checkout exited **0, with no output and no warnings**. No Tau Ceti import required a build. There are **zero declarations and zero sorried theorems**: the exhaustive one-tactic-probe set and the own-declaration `#check @name` set are empty. This is not a claim that an untested theorem or silently dropped binder was verified.

All ten headlines from the summary and end targets are accounted for in the module docstring:

| Headline | README | Missing carrier at the pins |
|---|---|---|
| Derived arithmetic Hida control | §4.6 | Supported ordinary Igusa complex and universal Iwasawa realization |
| Integral Iwasawa Serre duality | §4.8 | Those complexes with geometric transposition and coefficient duality |
| Integral amplitude in genera one and two | §4.9 | Geometric ordinary family complex |
| Rational amplitude in every genus | §8.4 | That complex and its analytic comparison family |
| Regular and singular geometric classicality | §5.10 | Shimura supported finite-slope cohomology and Bruhat filtration |
| Cohomological eigenvariety | §7.1 | Weight-space family cohomology and coherent Hecke support |
| Interior dimension and deformation | §7.5 | Interior image sheaf and its eigenvariety |
| Sharp interior slope bounds | §7.6 | Supported interior coherent cohomology |
| Sharp Siegel slope bounds | §8.5 | Integral supported overconvergent model |
| Two-term Klingen control | §9.8 | Height-one tower and partial ordinary cohomology complex |

Object searches at both pins found algebraic, topological and condensed ingredients, but not these geometric carriers. A few simple definitions on existing carriers cannot supply an Igusa tower or supported analytic Shimura family. No statable headline was omitted, and no padding or stand-in was found. General perfect-complex algebra would not be an adequate replacement for any of these geometric headlines.

### Source sample: exact text and hypotheses

All fifteen seeded targets were checked against the cached author versions recorded in sources.toml. Page numbers below are those of those versions, not an assumed equality with another edition. The four entries retain their existing keys and version information; no fetch or manifest change was necessary. Source line references point to the numbered extractions, without reproducing source passages.

| Target | Text opened | Result of locator/hypothesis check |
|---|---|---|
| 2.1 Artinian coefficients | BP-Hida line 574, §2.2, pp. 12–15; §2.3, pp. 15–18 | Solid operations and the bounded coherent comparison are distinguished. The smooth-purity route uses a regular immersion into an open of projective space, so both proper comparison applications have finite Tor dimension. The generic operations remain supplier owned. |
| 2.2 Dynamical compactifications | BP-Hida lines 374, 429, 444, 456; Definitions 2.1.15, 2.1.19, 2.1.24, 2.1.26, pp. 8–10 | Ideal-power direction, topological interior, transpose and strict/compact distinction agree. Empty boundary is permitted, which matters for R01. |
| 2.3 Supported ordinary localization | BP-Hida lines 889–904; Definition 2.4.2 and Lemmas 2.4.3–2.4.4, pp. 18–19 | Relative analytic pair and annihilation of the formal-power-series module are retained. Agreement with Fitting projection is restricted to the finite Artinian setting. |
| 2.8 Finite rank and compact bridge | BP-Hida lines 1553, 1576, 1637–1692; Propositions 2.10.3–2.10.4 and Theorem 2.11.4, pp. 30–33 | Cross-containments, divisor factorization and twisting alternatives are retained. Scalar finite-rank use inherits the missing S=Spec A qualification in R01. |
| 3.3 Strict Siegel dynamics | BP-Hida lines 2582–2634 and 2768; Lemma 4.4.2, Corollary 4.4.3, Proposition 4.4.4, Theorem 5.1.4, pp. 50–53 | Divisor inequalities and the cofinal tower are used with their finite-level hypotheses, including nilpotent coefficient thickenings; no p=2 splitting assumption is inserted. |
| 4.3 Universal ordinary Igusa complex | BP-Hida lines 2842–2856; §5.2.6 and Proposition 5.2.7, p. 55; Definition 1.4.1, p. 4 | Filtered tower construction precedes coefficient completion. The function module is the continuous regular representation, not a finite fixed-level representation. |
| 4.6 Arithmetic Hida control | BP-Hida lines 2876–2910, 2941–2953; Proposition 5.3.3, Theorem 5.3.5, Remark 5.4.3, pp. 55–57 | Derived specialization, inverse regular-action character and the separate finite-character twist are retained. The inverse-character clarification addresses the source ambiguity. |
| 5.5 Bruhat Cousin spectral sequence | BP-Coleman lines 5296–5303; Theorem 5.5.1, pp. 113–115 | Full Weyl indexing and total degree r+q agree. Singular compatible chambers are not collapsed to a single column. |
| 5.6 Cuspidal vanishing | BP-Coleman lines 5377–5399; Theorem 5.6.1, pp. 115–117; Theorem 4.1.7, pp. 51–53 | Subcanonical hypotheses, finite-slope extraction and Bruhat-length bounds are retained. The abelian-type Banach extension is explicitly contracted to a supplier. |
| 6.1a Abelian-type coefficient descent | BP-Coleman lines 7510–7554; Lemma 6.6.4, pp. 163–164 | The finite auxiliary quotient and direct-factor argument concern coefficient sheaves. The package separately requires the smooth/regular target and Cohen–Macaulay source for its projective Banach application; arbitrary finite quotients would not suffice. |
| 6.5 Locally analytic BGG | BP-Coleman lines 6995–7050; Theorem 6.2.16, Corollary 6.2.18, Example 6.2.19, §6.2.20, pp. 151–153 | Locally constant kernel, weight twists, locally polynomial algebraic term and reversed dual sequence are retained. |
| 6.8 Analytic coefficient control | BP-Coleman lines 7690–7715; Theorem 6.8.3 and Corollary 6.8.4, pp. 167–168; Theorem 6.5.5, pp. 160–161 | The package uses explicit termwise BGGsafe exclusion from the proved pair of bounds, not an uncorrected identification with the problematic printed strongly-small condition. |
| 8.2 Ordinary Hida–Coleman comparison | BP-Hida lines 3064–3084, 3114, 3183–3207; Propositions 6.1.7, 6.1.11 and Theorem 6.2.9, pp. 59–62 | Formal support, projected lattices and rational comparison retain their distinct roles. Ordinary is not identified with all finite slopes. |
| 8.4 Rational all-genus amplitude | BP-Hida lines 3302–3306; Corollary 6.2.17, p. 64 | Canonical/cuspidal intervals agree. The all-genus conclusion is rational, not the integral low-genus theorem. |
| 9.4 Singular Klingen complex | Pilloni-Singular lines 2483–2515, 2546–2584, 3293–3299; §§9.1–9.3, pp. 54–56, Theorem 11.3.1, p. 71 | Height-one multiplicative tower, affine étale nonfinite transitions, one-variable interpolation and two-term amplitude are retained. The full ordinary Siegel tower is not substituted. |

Additional repaired passages were checked against BP-Hida lines 1754–1776 and 2481–2503 (torus and unit conventions); BP-Coleman lines 1013–1101, 1271–1281, 4669–4708 and 5210–5251 (pro-Banach and allowed support statements); lines 6820–6832 (family continuation); and Pilloni-Singular lines 4133–4153 (BGG scaling). BP-GL2 lines 80–84, Theorem 1.2, p. 3, support the genus-one degree-one negative-weight control example with its k≥3 condition.

### Computed adversarial evidence

This table covers every seeded target, all ten headlines, all previous repairs and every target touched by a new finding. It records actual values, rather than equating an elaboration or a citation with a truth check. The full pass also compared the other targets' hypotheses, routes, definitions, APIs and Checks; a large per-target ledger is intentionally not reproduced here.

| Statement(s) | Instance | Computed values on the relevant sides | Result / change |
|---|---|---|---|
| Conventions: shifts and normalized composites | One-term A and p=3 | A[−1] has H¹=A, not H⁰=A; scalar composite (1/9)·3·1=1/3 | Shift and normalization direction agree. |
| §§1.1, 9.1 weight conversion | C₂, ν=(0,−2) | Four κ values (5,3),(5,1),(2,−2),(0,−2); inverse conversion returns (0,−2) in each chamber | Does not identify distinct singular chambers. |
| §2.1 smooth purity | A=𝔽₂ or ℤ/9; dimensions 0,1,2 | q!A: rank 1 in degrees 0,−1,−2; in dimension 2, Ω¹ has rank 2 whereas Ω² has rank 1 | Rejects missing shift and wrong differential degree. |
| §2.1 finite Tor and open comparison | A=ℤ/4, M=𝔽₂; D(t)⊂Spec A[t] | Tor_i^A(M,M)=𝔽₂ for every i≥0; pole orders in A[t,t⁻¹] are unbounded, unlike a finitely generated A[t]-module | Properness alone cannot justify the discrete comparison; the repaired route avoids it. |
| §2.2 strict versus compact dynamics | Frobenius on ℙ¹ over 𝔽₂ and 𝔽₃ | Pullback ideals (t²),(t³); s=1/2,1/3 gives equality of ideal powers; interior of the divisor is ∅ | Strict contraction holds; compact containment fails. Identity with a nonempty Cartier divisor fails strictness. |
| §2.3 ordinary localization | U=1,0,3 on ℤ/9 | Ordinary outputs ℤ/9,0,0; over ℚ₃ the scalar 3 is algebraically invertible | Separates ordinary from algebraic localization. Zero coefficient gives 0. |
| §§2.4, 2.6, 2.8(a) | R01 affine-line identity versus proper point | Boundary inequalities 1⊂1; ordinary H⁰ dimensions ∞ versus 1 over 𝔽₂; infinite identity cannot factor through finite cohomology | False without scalar-base qualification; R01. |
| §2.8(b) support change | Two points a,b; empty support versus {a} | Ordinary dimensions 2 versus 1; required cross-containment is {a}⊂∅, false | Correctly excluded. Equal pairs give identity maps of dimensions 2 and 1. |
| §2.8(c) bridge | Identity correspondence, empty boundary and zero twists | Both support orders equal RΓ; all inclusion maps are identities; n=1,m=0 gives the same object | Zero-boundary test is consistent; nontrivial case retains factorization. |
| §§3.2, 3.6 character ratio | GL₂ κ=(2,0), p=3, t=diag(2,3) | ν values 1/6,1/9; c=3/2; c·1/9=1/6, whereas 3·1/9=1/3 | Prior F01 unit loss repaired. |
| §3.2 pure-power necessity | Same weight, diag(2,6) | ν values 1/12,1/36; c=3; central unit character value 1 despite unit diag(2,2)≠1 | New necessity assertion fails; R02. |
| §3.3 strict tower dynamics | Root power at p=2 and p=3; square-zero coefficient thickening | Exponents 2 and 3 give contraction factors 1/2 and 1/3; ε²=0 does not change these ideal-power inclusions | No good-prime exclusion or reduced-base assumption required by this computation. |
| §3.6 compatible chambers | GL₂ k=2, U eigenvalues 1,3 over ℤ/9; wall k=1 | Ordinary ranks 1 and 0 for 1 and 3; at the wall both comparison scalars are 1 | Positive valuation kills the incompatible finite part; singular compatible terms remain. |
| §3.8 finite/complete action | C_s=ℤ/3^s, limit ℤ₃ | 3=0 on C₁, but 3·1=3≠0 on the limit; End(ℤ₃)=lim ℤ/3^s | Prior F02 theorem repaired. |
| §3.8 new Hecke Check | ℓ=2, coefficients ℤ/9 | All-ones relation has sides 1 and 4; degree-character relation has sides 9 and 9, both 0 mod 9 | R03; repair preserves the limit test. |
| §3.8 higher-degree relations | E₁₂,E₂₁ acting on 𝔽₂² in degree 1 | H⁰ actions both 0; products on H¹ diag(1,0) and diag(0,1) | Degree-zero agreement cannot prove a derived commuting action. |
| §§2.6, 4.1 equivariance | Γ=C₂ over 𝔽₂ | 𝔽₂[Γ] has A-dimension 2 and group-ring rank 1; (1+σ)²=0 | Flat regular representation retained; division by group order would fail. |
| §4.3 universal tower | Functions on ℤ/p^n; coefficient completion | Function dimensions p^n; shifting n to n+1 is cofinal; continuous x↦x on ℤ_p has infinite image | A finite fixed-level function module cannot replace the completed tower. |
| §4.6 inverse character | u=4 at p=3, and u=3 at p=2, ν(u)=u | Specialization [u]↦ν(u)⁻¹ gives 1/4 and 1/3, not 4 and 3 | Regular-action convention retained, including p=2. |
| §§4.6, 6.4 derived specialization | C=[A —t→ A], A=F⟨t⟩ | Before specialization H⁰=0,H¹=A/t; derived fiber at t=0 has H⁰=F,H¹=F; Tor₁ contributes in total degree 0 | An underived cohomology-only formula loses F. |
| §4.7 scalar Hecke image | Λ=ℤ₃[[X]], C=Λ; nilpotent matrix N=E₁₂ | Old integral degree image ℤ·id excludes X·id; new image Λ·id has Λ-rank 1; Λ[N] has rank 2 and N²=0 | F03 repaired; actual kernel and nilpotents retained. |
| §4.8 Iwasawa Serre duality | d=3, complementary degrees 1 and 2 | RHom(F[−2],F[−3])=F[−1]; 1+2=3 | Shift and complementary cusp/canonical degrees agree. |
| §4.9 integral low-genus amplitude | g=2,d=3,ℓ=1; g=1 | Canonical interval [1,3], cusp [0,1]; opposite cusp [0,2] dualizes to [1,3]; genus-one lengths 0,1 | Does not promote the integral statement to every genus. |
| §§5.2–5.3, 6.2 pro-Banach models | Open disc, f_n=3^(−n/2)z^n, n=4,8,12 | At r=3^(−1/2), norms 1,1,1; at r′=3^(−1/4), norms 3,9,27 | F06 repaired; one Banach norm does not give the Fréchet topology. |
| §5.2 depth | p=2,3; coordinate p⁻² at depth −1 | Norms 4,9 exceed allowed 2,3; depth −∞ permits the full root line | Finite radius and unlimited radius are distinguished. |
| §5.3 compact-stage / slope extraction | Finite stage with U=diag(1,3,0) | Finite-slope dimension 2, ordinary dimension 1; zero-eigenvalue summand dimension 1 is removed | A compact factorization precedes the justified finite block. |
| §5.5 Cousin total degree | r=0,1 and q=0 | Total degrees r+q=0,1; two singular compatible columns remain two columns | No chamber collapse or sign reversal. |
| §5.6 cuspidal vanishing | d=3, lengths 0,1,3; zero complex | Allowed cusp intervals [0,0],[0,1],[0,3]; all cohomology of the zero complex is 0 | Bounds and empty-support case agree. |
| §5.7 supported duality | d=3, ℓ=1; point pairing | Negative degrees [2,3] pair with positive [0,1]; point value 1·1=1 | Complementary support and degree conventions agree. |
| §5.10 regular/singular classicality | GL₂ k=2 and k=1, slope endpoint 1 | Compatible sets {0} and {0,1}; strict endpoint test 1<1 is false | Keeps singular multi-term statement and strict slope cutoff. |
| §6.1a quotient descent | 𝔸²/{±1} over characteristic 0; integral C₂ averaging | Generic quotient degree 2, origin fiber dimension 3 with basis 1,x,y; invariant augmentation image 2ℤ₂, but 2ℚ₂=ℚ₂ | Arbitrary quotient is not finite flat; package's smooth/CM hypotheses and coefficient-field averaging matter. |
| §6.5 locally analytic BGG | SL₂, k=1 | D²(1)=D²(z)=0, D²(z²)=2≠0 over ℚ₂; diag(3,1/3) gives 1,9,81, then twist 1/3 gives 1/3,3,27 | Distinguishes algebraic kernel, analytic tail and character twist. |
| §§6.7–6.8 BGGsafe | C₂ term with thresholds 0 and 3 | Eigenvalue slope 2 satisfies ≥0 but fails ≥3; slope 3 satisfies both | Exclusion must use both proved bounds termwise, not a single substituted condition. |
| §6.10 abelian type | GSp₄→PGSp₄, central −I | Image of −I in PGSp₄ is 1, while standard H¹ action is −1 | F04 repaired; standard H¹ cannot descend, quotient torsors can. |
| §§5.2, 6.10 supports | Z′=Z∪{x}, x outside U; isogenous x′ outside Z′ | Membership of the two projections in Z′ is 1 versus 0; Z′∩U=Z∩U | F05 repaired: direct action uses saturated pairs, general action uses continuation. |
| §7.1 cohomological eigenvariety | Acyclic [F —1→ F] with U=1 versus F in degree 1 | Chain-level Fredholm product (1−X)² but cohomological support ∅; degree-one complex has one spectral point | Rules out chain-level extraneous eigenpoints. |
| §7.5 interior dimension | One-dimensional weight domain A | A has support dimension 1; A/t has dimension 0 and t-torsion; zero module has empty support | The bottom torsion-free input distinguishes the equidimensional case. |
| §7.6 sharp interior slopes | Stable ℤ_p lattice, scalar p versus p⁻¹ | Slopes 1 and −1; p preserves the lattice, p⁻¹ does not | Integral lattice bound is not asserted for arbitrary scalar action. |
| §8.2 support and ordinary comparison | Formal disc; U=diag(1,p,0) | Formal functions 𝔽₂[[t]] in degree 0 versus puncture local cohomology 𝔽₂[t,t⁻¹]/𝔽₂[t] in degree 1; ordinary dimension 1 versus finite-slope dimension 2 | Formal support is not local cohomology; ordinary is not all finite slope. |
| §8.2 rational lattice comparison | Vertical lattices p^mℤ_p | Each becomes ℚ_p after inversion; integrally ℤ_p/p^m has nonzero length m for m>0 | Rational equality does not identify integral lattices. |
| §8.4 rational amplitude | g=3,d=6, lengths 0,2,6 | Canonical intervals [0,6],[2,6],[6,6]; cusp intervals [0,0],[0,2],[0,6] | Correct all-genus rational conclusion. |
| §§8.5, 9.3 sharp Siegel table | κ=(5,3;−8) | A_w=(0,2;−8),(−2,2;−8),(3,−3;−8),(−5,−3;−8); t₁ pairings 6,6,11,11; t₂ pairings 3,4,4,8 | After subtracting trace exponent 3, U₂ thresholds are 0,1,1,5. |
| §9.3 corrected torus element | p=3, diag(1/3,1/9,1,1/3) | Anti-diagonal products both 1/9; old diagonal gave 1 and 1/9 | F07 repaired and compatible with supplier coordinates. |
| §9.4 height-one Klingen interpolation | Rank-one multiplicative versus rank-two full tower | Primitive generators p^(m−1)(p−1) versus p^(2m)−p^(2m−2); height-one weight has one analytic variable | Distinguishes the Klingen tower from full ordinary flags; amplitude remains [0,1]. |
| §9.5 ordinary projector | p=3, labels 1,1,9,9 | Products 1,9,9,81; normalized eigenvalues 1/3,3,3,27; chosen projector values 1,0,0,0 | Label pairing and normalization agree; generalized blocks retain nilpotents. |
| §9.6 spectral specialization | F[X]/(X−1)² | Local generalized block dimension 2, residue eigenspace dimension 1; derived residue pullback adds Tor₁ | Primary localization is not ordinary spectral residue tensor. |
| §§9.6–9.8 BGG factor | k=0,p=3, f=z, U f(z)=f(3z) | D(Uz)=3; 3U(Dz)=3, whereas (1/3)U(Dz)=1/3 | Repaired factor agrees; source misprint recorded below. |
| §9.8 two-term control | r=2,k=0; ordinary slope 0 | Degree-specific threshold 1 contains 0; all-degree minimum min(1,−2)=−2 does not contain 0 | Keeps degree-specific control rather than an unjustified all-degree version. |
| §9.8 p=2 torsion threshold | k>3; k=0 trace normalization test | First integer k is 4; trace products 16,8,8 divided by 8 give 2,1,1 | Strict inequality and trace divisibility remain distinct. |
| §9.9 unitary worked example | n=2, ν=(4,2,0) | Weights (−3,−5,2),(0,−5,−1),(0,−2,−4); canonical [0,2],[1,2],[2,2], cusp [0,0],[0,1],[0,2] | Conversion and complementary ranges agree. |

Nonapplicable adversarial classes were checked against the declared domain rather than silently generalized: the Shimura statements have genus at least one and characteristic-zero analytic coefficients; an inseparable characteristic-p field is not such an analytic coefficient field. The Artinian integral part includes p=2 and nonreduced coefficients. Torus and Iwasawa groups are abelian by their definitions, whereas the ambient reductive groups need not be. No total-function denominator or natural-subtraction junk value is used to claim a boundary theorem. Nonempty boundary, empty support, identity correspondence and zero coefficient cases are separated in the table. R01 illustrates why checking membership in the domain remains essential even when the source theorem is correct.

### Pinned library declarations and duplication by object

The following declarations and surrounding hypotheses were opened at the pinned libraries. These are existing inputs, not new targets of this roadmap.

| Object | Pinned file and line | Scope checked |
|---|---|---|
| `Module.End` | `Mathlib/Algebra/Module/LinearMap/End.lean:33` | Endomorphism algebra on an additive commutative monoid with module structure; no geometric correspondence or compactness is supplied. |
| `zpow_sub₀` | `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402` | Subtraction law requires the nonzero base; it does not justify dividing by a nonunit integral Hecke scalar. |
| `HasDerivedCategory`, `DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74` and line 87 | The category construction and its size hypothesis; not supported coherent cohomology on Shimura varieties. |
| `CondensedMod` and its abelian instance | `Mathlib/Condensed/Module.lean:41` and line 43 | Condensed module category; no scheme-level six operations are hidden in the definition. |
| `CondensedMod.IsSolid` | `Mathlib/Condensed/Solid.lean:83`, surrounding lines 74–81 | Solidity predicate and the stated finite-type-over-ℤ context; not an arbitrary analytic-ring localization theorem. |
| Hecke double cosets and abstract convolution carrier | `Mathlib/NumberTheory/HeckeRing/Defs.lean:157`, line 183 and line 189 | `HeckeCoset`, `HeckeCosetModule`, `HeckeRing`; these do not construct the supported geometric action or its integral extension. |
| Existing modular-symbol Hecke composition | `TauCeti/NumberTheory/ModularForms/ModularSymbols/Hecke/Composition.lean:1` through its introductory declarations | Modular-symbol multiplication is a different cohomological realization from the coherent partial-support action in §§3.8 and 6.10. |

The object searches used operators, coefficient structures, compact-stage factorization, BGG, ordinary Igusa towers, Klingen complexes and supported cohomology, not merely proposed names. Generic perfect-complex, group-ring, spectral and condensed ingredients are cited as inputs. The new ownership is their supported geometric realization and the Hida–Coleman comparison, not a second implementation of those generic ingredients. No declaration-name collision is possible in the empty Suggested.lean, and no substantive duplicate of a pinned theorem was found in its acceptance statements.

### Supplier citations resolved at main or the supplied open head

The board package index was read before ownership conclusions. Its other package entries are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinability; none supplies these geometric constructions. The roadmap tools were used for cross-roadmap resolution and object searches, and each relevant supplier text was opened. `roadmaps resolve` returned no missing citation/name leads; this result was supplemented by the explicit pin and section checks below.

The table records the sections consumed and file witnesses. Line numbers refer to the roadmap README at the examined main/head, not the scratch extraction. A pull-request number here identifies the reviewed external head; it is not proposed wording for the roadmap. Main-branch ownership takes precedence over a revision.

| Supplier | Resolved sections / witness |
|---|---|
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:9136` R3.1; R3.4 line 10053, R3.6 line 10472, R3.8 line 11858. Coherent quasi-Stein and finite-free trace inputs do not already supply the declared Banach extension. |
| AdicSpacesPartIV, main | `TauCetiRoadmap/AdicSpacesPartIV/README.md:5032`, F1.10. Coherent dagger pairing; the complementary-support LB/Fréchet extension remains a gap. |
| AutomorphicBundles, head #1069 | `TauCetiRoadmap/AutomorphicBundles/README.md:911`, §§1.4–1.5, 1.9; §3.3 line 1399; §§5.2–5.4, 5.10; §6.1; §9.1; §11.10 line 4082, §§11.16–11.17; §§12.1, 12.11 line 4928. Bundle, weight, integral-model and individual-correspondence inputs resolved. |
| AutomorphicBundlesPartII, head #1823 | `TauCetiRoadmap/AutomorphicBundlesPartII/README.md:373`, §§2.2, 2.4–2.5; §3.0a line 453, §3.0b; §§3.1–3.3, 3.6, 3.9–3.13; §§5.1–5.2 and §5.13 line 1104. Six operations, torsor flatness, correspondence composition and hyperspecial genus-two relations remain supplier owned. |
| AutomorphicFormsOnReductiveGroups, head #1037 | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:1083`, §6.7, coherent chambers. |
| CompletedCohomologyPartII | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:967`, §§3.11–3.12, continuous regular functions and dual action; inverse-character convention compared. |
| DeformationAndDerivedPatchingAlgebra, head #1034 | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1366`, §§7.1, 7.3, 7.5–7.6, 7.8, 7.10. In particular §7.8 line 1516 supplies completion of derived Hom for bounded finite-free models over a complete Noetherian local ring, compatibly with identity and composition. |
| HodgeTateAndCanonicalSubgroups, head #1084 | `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md:1370`, §5.1. Its Hilbert construction does not silently supply either the all-genus Siegel or height-one Klingen extension. |
| IntegralHeckeAndGaloisDeterminants, head #1689 | `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:2899`, §2.1; §2.3 line 3024. The finite image is the scalar-linear algebra range, as now used in §4.7. |
| LocallyAnalyticDistributions | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:2007`, §3.3; §4.16 line 3035 and §4.17 line 3227, projective compact complexes and limit-stage factorization. Generic spectral theory is imported, not rebuilt here. |
| OverconvergentAutomorphicForms, head #1422 | `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:204`, §0.4; §8.6 line 1467 and §8.7 line 1499. Coefficient descent and finite-flat/projective-Banach interfaces are supplied; supported higher cohomology remains the application here. |
| PELModuli, head #966 | `TauCetiRoadmap/PELModuli/README.md:2380`, M2.8–M2.9; M5.1–M5.2, M5.5–M5.6, ending at line 3703. |
| PadicFamilies, head #1019 | `TauCetiRoadmap/PadicFamilies/README.md:594`, §§0a.24–0a.25; §2a.8 line 1493, §§2a.12, 2a.15–2a.17. The package extends, rather than replans, ordinary finite algebra and spectral infrastructure. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:606`, §1.1; §1.7 line 909. Measure/Iwasawa carriers remain imported. |
| PerfectoidShimuraVarieties, head #1085 | `TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:1479`, §3.13; §4.5; §§6.3–6.10, 6.12–6.15 including §6.13a. §6.4 line 2017 supplies the auxiliary abelian-type route; §6.8 line 2122 and §6.9 line 2147 supply Hecke-compatible period/torsor descent. |
| PhiGammaModulesAndIwasawaCohomology, head #1310 | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1256`, §2.7. |
| ResolutionOfSingularitiesCharacteristicZero, main | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:913`, §6.3. The consumed Cartier separation statement is not restricted to characteristic-zero schemes merely because of the roadmap title. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4452`, §2.20. Cohen–Macaulay duality is consumed from main, without requiring its open revision. |
| ShimuraCompactifications, head #1053 | `TauCetiRoadmap/ShimuraCompactifications/README.md:690`, §0.14; §4.10, §§6.16–6.17, §§7.19–7.21, §7.29 line 2904. Integral toroidal and cone-refinement inputs resolved. |
| ShimuraData, head #1038 | `TauCetiRoadmap/ShimuraData/README.md:528`, §§3.8, 3.10, 3.13; §§5.5–5.6, 5.10–5.11. §5.5 line 1168 fixes the symplectic coordinate convention used in the repaired t₁ calculation. |
| SolidAnalyticRings, head #1458 | `TauCetiRoadmap/SolidAnalyticRings/README.md:715`, §§7.2–7.4, with §7.3 line 745 and §7.4 line 787. The two precise comparison/kernel extensions remain declared gaps. |
| LieHighestWeight, main | `TauCetiRoadmap/LieHighestWeight/README.md:405`, Layer 3. Algebraic Verma/PBW input is distinct from the locally analytic BGG construction here. |
| SmoothRepresentationsOfLocalGroups, head #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:667`, SR.0.2; SR.1.4 line 1445 and SR.4.5 line 3597. |

The overlap record reports no conflicting heads changing this package, dropped cited IDs, IDs defined only by an unnamed open revision, or dropped package IDs cited elsewhere. The closest scopes were also read, not just compared by titles: AutomorphicBundlesPartII #1823, OverconvergentAutomorphicForms #1422, PerfectoidShimuraVarieties #1085, GSp4NonregularModularityLifting #1817 and AlgebraicModularFormsAndSerreWeightsPartII #1822. The last two witnesses are `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:7`–13 (consumer scope) and `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/README.md:17` onward (algebraic full-frame coefficient construction). Neither owns the supported partial-ordinary Klingen interpolation theorem here. No object is handed cyclically between these scopes. The generic six-operation, coefficient-descent and spectral inputs remain with the earlier suppliers named above.

The dependency check produced exactly:

```text
depcheck: 236 roadmaps, 2154 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every Needs line was read in addition to the mechanical check. No supplier drift finding remains after resolving the cited sections and distinguishing declared extensions from already supplied statements.

### Declared gaps

All nine slugs match between `design/plan.json` and the README's Exact supplier contracts. Each has a named owner and a concrete missing extension; none has supplier `none`. Comparing the supplier text did not show an already supplied object being requested again. The related clauses specify compatibility needed for a single interface, rather than bundling unrelated unowned projects.

| Slug | Owner and precise residual contract checked |
|---|---|
| solid-localization-kernel | SolidAnalyticRings §§7.2–7.3: relative polynomial analytic kernel, localization triangles and the specified vanishing tensor. |
| discrete-adic-solid-comparison | SolidAnalyticRings §§7.3–7.4: discrete-adic locales and the countable completion/localization diagrams, preserving specified tensors and limits. |
| siegel-ordinary-igusa | HodgeTateAndCanonicalSubgroups §5.1 continuation: polarized ordinary Siegel towers in every genus, decomposable cofinal levels including p=2, cyclotomic/toroidal/de Rham compatibility. |
| klingen-height-one-igusa | Same supplier's height-one continuation: p-rank-at-least-one locus, ℤ_p× torsor, affine étale nonfinite transitions and toroidal quotient compatibility. |
| abelian-affinoid-basis | PerfectoidShimuraVarieties §§3.13, 6.8: abelian-type classical-flag affinoid basis and the specified finite-level/toroidal comparisons. |
| projective-banach-cohomology | AdicSpacesPartIII §§R3.4, R3.6: locally projective Banach coefficients on finite quasi-Stein covers, countable projective complex models, compact restrictions, projected lattices and bounded-torsion integral comparison. |
| banach-support-duality | AdicSpacesPartIV §F1.10: complementary-support LB/Fréchet pairing over finite extensions of ℚ_p, with Ω^d and finite-slope perfectness. |
| coherent-correspondences | AutomorphicBundlesPartII §§3.3, 3.6, 3.10–3.12 on §3.0a: both partial-support orders, comparison/support change, coherent actions, composition/base change and twist-limit formulas. |
| abelian-subcanonical-vanishing | AutomorphicBundlesPartII §5.2 continuation: abelian-type toroidal-to-minimal subcanonical vanishing with locally trivialized projective Banach coefficients and bounded-torsion reductions. |

These contracts are not findings and were not treated as missing suppliers. Since this verdict is needs changes for R01–R03, the JSON does not record conditional acceptance.

## Not verifiable

- None of the four cited source texts was inaccessible; no missing-source request is needed. Locators were checked in the recorded versions. No claim of independent verification of a differently paginated published edition is made.
- The nine declared supplier extensions are contracts, not implemented proofs available for testing. Their scope, owners, present supplier boundaries and slug agreement were checked; their future proofs cannot be certified by this package review.
- Elaboration checks the empty acceptance file only. It cannot certify the geometric headlines, which lack their carriers at the pins. The adversarial calculations and source comparisons above are the substantive evidence for the prose review.

## Source issues

The following issues were encountered again in the checked passages. They are source issues, not additional package findings where the package already states the corrected mathematics.

- **Error** in BP-Hida at Remark 4.3.12, printed page 48: the source says the comparison scalar is a pure power of p for arbitrary positive torus elements; it should retain the unit in the character ratio; affects a stated result.
- **Gap** in BP-Hida at Remark 5.4.3 and Theorem 6.2.15, printed pages 57 and 64: the source says inverse-character specialization agrees with an unlabelled family base change; it should specify the inverse-character coefficient map for the regular action; affects a stated result.
- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, printed pages 134 and 168: the source says its coefficient strongly-small condition follows using inconsistent shifts and a doubled noncompact-root term; it should derive exclusion termwise from the two twisted analytic bounds; affects a stated result.
- **Misprint** in Pilloni-Singular at §5.1.5 before Proposition 5.1.5.2, printed page 22: the source says the Satake labels satisfy αβ=γδ; it should be αδ=βγ with those labels; affects nothing.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, printed page 90: the source says the target BGG operator is p^(−k−1)U; it should be p^(k+1)U in the contracting convention; affects a stated result.
- **Gap** in Pilloni-Singular at §13.4, printed page 91: the source says spectral-point pullback gives eigenspace cohomology without separating pullback and localization; it should specialize over weight first, then take the primary spectral component retaining Tor and nilpotents; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e65c286cda05d78ca2ca8a322007b785f94b5175", "job": "REV-PKG-HigherHidaAndColemanTheory~4", "model": "gpt-6-astra", "worker": "chris-6"} -->
