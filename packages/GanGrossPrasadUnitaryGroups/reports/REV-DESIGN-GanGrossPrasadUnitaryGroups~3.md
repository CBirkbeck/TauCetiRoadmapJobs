<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/618#issuecomment-6328003551 -->
Review (codex) of e0882fe

Verdict: accepted
Conditional on the announced gaps: `hermitian-unitary`, `local-categories`, `local-bernstein`, `local-mirabolic`, `gl-tempered-genericity`, `local-jacquet-filtration`, `local-spherical`, `archimedean-globalization`, `archimedean-generic-induction`, `archimedean-seminorms`, `distribution-gk`, `local-schwartz-germs`, `local-tempered-bounds`, `local-plancherel`, `local-fourier-extension`, `enhanced-packets`, `ordinary-endoscopy`, `real-oscillator-model`, `real-small-theta`, `adelic-measures`, `automorphic-realization`, `global-parameters`, `factor-epsilon-identities`, `tempered-local-regularity`, `hermitian-global-values`, `local-rankin-selberg`, `whittaker-pairing-fourier`, `global-mirabolic-norms`, `local-smoothing-trace`, `automorphic-spectrum`, `spectral-isolation`, `relative-geometric-comparison`, `relative-finite-transfer`, `relative-archimedean-transfer`, `relative-fundamental-lemma`, `relative-character-comparison`

1. **F01** (P3) Point theorem-line anchors to the actual statements

   **Location.** `packages/GanGrossPrasadUnitaryGroups/design/README.md:507` and `:537`; `packages/GanGrossPrasadUnitaryGroups/design/plan.json:691` and `:756`: “Theorem 7.2.1, p. 181, bp-arch line 6804; Proposition 7.4.1, p. 192, line 7140” and “Lemma 11.3.1, p. 272, line 10525”.

   **Claim.** Those line anchors identify the nonzero-iff-model theorem and the analytic and geometric parabolic-induction comparisons.

   **Witness.** bp-arch line 6813–6814 states Theorem 7.2.1; line 7165–7166 states Proposition 7.4.1; line 10538–10539 states Lemma 11.3.1. The cited lines 6804, 7140 and 10525 introduce a formula or setup instead.

   **Exact repair.** In the README and target 3.3 locator in the plan, replace `line 6804` by `line 6813–6814`, and `line 7140` by `line 7165–7166`. In the target 3.4 locators replace `line 10525` by `line 10538–10539`. Retain the theorem numbers, pages and mathematical statements. The source manifest’s recorded locators need no edit.

Acceptance is conditional on the 36 declared supplier gaps recorded in `packages/GanGrossPrasadUnitaryGroups/design/review.json`. There is one non-blocking P3 locator correction, and no P1 or P2 finding. No design or source-manifest entry was changed.

## Previous findings: repair verification

The supplied previous-review file, `packages/GanGrossPrasadUnitaryGroups/reports/REV-DESIGN-GanGrossPrasadUnitaryGroups~2.md`, is absent; a search of the board found no alternative copy. Accordingly, the following verification covers all eight findings identified in `packages/GanGrossPrasadUnitaryGroups/reports/FIX-DESIGN-GanGrossPrasadUnitaryGroups~3.md`, rather than claiming access to their original wording. That repair report marks none as “not actionable in this package.”

Locations in the following table are in `packages/GanGrossPrasadUnitaryGroups/design/README.md`.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01: split line generator | Repaired | Line 167: “an E-basis vector e of L, meaning E→L, a↦ae is an isomorphism”. Lines 201 and 227 reject the idempotent generator: `(1,0)` has norm zero and yields only one character coordinate, whereas `(1,1)` gives `(x,-y)`. The condition persists in §1.3. Checked against ggp line 1567 and ggp line 1624. |
| F02: completed-tensor extensionality | Repaired | Line 909: “two jointly continuous sesquilinear forms on the completed projective tensor carrier”. Line 927 supplies a discontinuous functional vanishing on the proper dense algebraic tensor subspace. Linear extension followed by density now applies only in the continuous carrier; bp-arch line 6797 and bp-arch line 6821 support that distinction. |
| F03: compound L-factor contract | Repaired | Line 149: “These are regularity assertions for the individual factors”. Lines 147–157 separate six contracts: factor identities, local regularity, global values, local Rankin–Selberg theory, Whittaker pairing/Fourier theory, and global mirabolic/norm residues. Each has a named supplier, field and representation conditions, arguments or integrals, and a conclusion. The quotient remains §5.1. Checked the local formulas against zhang-period line 656 and line 962, and the global leading coefficients against bpcz line 4132. |
| F04: local smoothing/trace bridge | Repaired | Line 107: “Σ_j p(x_j)q(y_j)<∞ for every pair of continuous smooth-vector seminorms”. Lines 1055–1067 specify the local test space, both measures and the trace integral. The summability contract and §2.7 supply an integrable majorant, so the exchange of sum and H-integral is justified without a globalization assumption. The new gap and its consumer agree in the plan. |
| F05: source locators | Repaired | Line 89: “unnumbered inducing transformation and Proposition 3.1, p. 6, line 207–216”. Verified that passage, the added split AGRS theorem at line 305, the separate Γ-measure/Δ locators at line 537, and Zhang’s measure change at line 873. Witnesses: jsz-bessel line 207, agrs line 35, bp-arch line 10066 and line 10204, zhang-period line 1437. R01 below concerns different, remaining theorem-line anchors in §§3.3–3.4. |
| F06: discriminating character checks | Repaired | Line 479: “φ_V=χ₁⊕χ₋₁, φ_W=1”; line 711: “ν(u,t)=exp(i(x-y))”. The first example has central epsilon value −1 by duality; the repeated-character example has generator −1 but central value +1. Direct multiplication of the displayed GL₄ unipotents shows x and y are additive while the cross terms enter z. These are mathematical checks, not assertions of proof status. |
| F07: multiplier ownership wording | Repaired | Line 111: “The AutomorphicSpectralTheory Part II multiplier continuation, §§SM.0–SM.5, owns this theory.” Its requested preceding placement is explicit. The design creates no second multiplier theory and does not treat the continuation as an already supplied import. The sibling continuation’s actual isolation targets were inspected. |
| F08: all-residue spherical theorem | Repaired | Line 933: “Let F be any nonarchimedean characteristic-zero local field, including residue characteristic 2”. Lines 935–937 state the integral-model conditions and own the dyadic relative calculation. The split Q₂ computation gives C=3 and raw integral 3; the nonsplit rank-one computation gives C=1 and raw integral 1. Harris’s odd-residue restriction is accurately identified at harris line 170–181. The generalization is a named target with a proof route, not attributed to Harris’s restricted theorem. |

## Verified sound

### Coverage, principles and shape

Read the complete 1,309-line design README, the full structured target/gap catalogue, the 17-entry source manifest and the repair report. The catalogue has **40 targets: 9 definitions, 8 constructions and 23 theorems**, with **82 named API entries**, **130 named Checks**, and eight additional convention Checks. Every target has hypotheses, a source locator and its own Needs line. All 17 definitions/constructions have a named API and at least three Checks. All seven layers end with Examples and Dependencies.

The README and plan agree on statements, hypotheses, APIs, Checks and prerequisites after ignoring Markdown formatting and six equivalent formulations involving Langlands-packet terminology. All 36 gap slugs and needs sentences occur in both files; every `neededBy` set equals the targets that actually cite that gap. JSON and TOML parse successfully.

The design retains general Hermitian forms, split local algebras, rank-zero smaller spaces, all characteristic-zero local fields, dyadic places, real signatures and endoscopic constituent counts. Its algebraic field assumption excludes characteristic 2 and inseparable quadratic algebras explicitly; analytic characteristic zero and global number fields are separate hypotheses. Positive adjacent rank is confined to targets whose formulation requires n≥1. The larger split archimedean prediction and the arbitrary-codimension global conjecture remain propositions, without assumed proofs in the endpoint theorem.

No replacement roadmap, duplicate generic carrier, route-specific prime exclusion, computational algorithm, copied source prose, circular assumption of GGP.8, machine path, LaTeX delimiter, target-numbering table or process identifier was found in the design. The source readings below distinguish formulas from prose and preserve the source versions. Mathematical references to Langlands packets are not workflow narration.

No `Suggested.lean` is present at this design stage. Consequently there is no sorry-defined data, import violation or `set_option` in a Lean artifact to report. The heavy local/automorphic carriers are declared supplier work, not weakened Lean stand-ins. Elaboration is **not available (this lane does not elaborate)**; no Lean command was run, and no claim about elaboration warnings or proved Lean mirrors is made.

### Seeded source sample

Read the legal cached extractions at the following locators, checking source version, theorem/section and page, field/rank/representation hypotheses, and the normalization actually used. All 15 selected targets were checked. Fourteen have supporting statements or the stated direct construction/translation at their locators; §5.3 additionally contains an explicitly owned extension beyond its source’s odd-residue intermediate. R01 is the sole locator finding.

| Target | Text checked | Result |
| --- | --- | --- |
| 1.1 `RelevantHermitianPair` | ggp §2, pp. 5–7, line 203 and line 229–257; §12, p. 44, line 1567–1569 | The split algebra, nondegenerate inclusion and fixed split odd complement agree. A basis vector, rather than just a nonzero vector, is required over the split algebra. |
| 1.2 `besselDatum` | ggp §12, pp. 44–46, line 1593, line 1603–1639 | Semidirect subgroup, diagonal second coordinate and sum of simple character coordinates agree. The empty-flag specialization and split `(x,-y)` computation agree with the displayed matrices. |
| 1.3 `besselTransport` | ggp §12, p. 46, line 1637–1639; §18, pp. 71–72, line 2503–2519 | Conjugacy under auxiliary changes and independence under simultaneous form scaling are supported. The design transports characters and labels rather than asserting equality after freezing them. |
| 2.7 `adjacentTemperedIntegral_converges` | harris Proposition 2.1, p. 5, line 250; proof pp. 6–7, line 256–367; bpcz §1.1.6, p. 4, line 166–167 | The proof handles the split chambers separately and arbitrary fixed polynomial log powers. The stronger Ξ estimate is the displayed majorant calculation, with smooth-vector seminorm bounds supplied separately. Non-tempered constant coefficients on split GL₂×GL₁ diverge. |
| 3.3 `temperedBesselForm` | bp-arch §7.2, pp. 180–181, line 6797–6833; Proposition 7.4.1, p. 192, line 7165–7166; xue-real Propositions 2.3–2.4, p. 1001, line 238–255 | Continuous regularization, nonvanishing equivalence and whole normalized-induction comparison are supported. Finite-length unitary conventions are specified at bp-arch line 1775–1778. R01 corrects the two line anchors. |
| 3.4 `besselGeometricMultiplicity` | bp-arch §11.1, pp. 259–260, line 10054–10078; equation (11.2.1), p. 263, line 10204–10208; Proposition 11.2.1, pp. 265–266, line 10248–10295; Lemma 11.3.1, p. 272, line 10538–10539; Proposition 4.5.1, p. 106, line 3994–4011 | Torus mass, Weyl divisor, discriminant quotient, convergence, limit and continuity agree. The nonreductive H includes N; omitting its Lie contribution would give the wrong higher-codimension determinant. R01 corrects the induction-statement line anchor. |
| 3.6 `besselPacketFourierIdentity` | bp-refined §8.6, equation (1), pp. 71–72, line 2880–2908; Theorem 8.5.1, line 2869–2879 | The coefficient is `(1+με)/2`, with the even-side invariant and fixed central restrictions. Classification assumptions in the source are supplied through the actual enhanced-correspondence contract, not silently dropped. |
| 3.8 `besselRealThetaReduction` | xue-real §2.4, pp. 1002–1003, line 267–307; §3.1, pp. 1003–1004, line 329–341; §3.2, pp. 1010–1013, line 554–610 and line 677–685 | The induction counts appropriate-sign characters with multiplicity and decreases by two. The source explicitly distinguishes the small lift from the unproved big-lift irreducibility premise. The cached PDF images of pp. 1010 and 1013 were also read to resolve damaged OCR in the epsilon conjugation and signature formulas. |
| 3.11 `besselSplitGeneric_nonvanishing` | ggp Theorem 17.2, p. 68, line 2394–2405 | Adjacent pairs at all places and higher codimension at finite places are exactly the certified ranges. No higher-codimension archimedean existence theorem is inferred. |
| 4.1 `globalBesselPeriod` | ggp §23, pp. 86–88, line 3036–3093 | The rational character and quotient integral agree after the explicitly stated inverse-character translation. Changing variables gives ν, not ν⁻¹, under right translation. Continuity is a target using the declared automorphic estimates. |
| 4.4 `globalBesselConjecture` | ggp Conjecture 24.1, p. 90, line 3175–3182 | Temperedness, cuspidal multiplicity one, every local model and central nonvanishing are retained. It remains the proposition on the fixed pair. |
| 5.3 `normalizedLocalBesselPeriod_spherical` | harris §2, pp. 4–5, line 170–181; §2.2, pp. 16–20, line 907–1000 and line 1120–1147; Theorem 2.12, p. 23, line 1289–1294; zhang-period equations (3.3), (3.26), pp. 14, 19, line 675–678 and line 982–986; Proposition 4.10, p. 31, line 1543–1551 | The spherical value is the H-volume, not universally 1. Harris excludes even places; the design says so. The split proof uses Zhang’s unnormalized measures. The nonsplit dyadic extension is separately owned, with trace-surjectivity/root-volume comparison before rational specialization. The two rank-one dyadic Checks were recomputed. |
| 5.5 `allPlaceBesselProduct` | bpcz equation (1.1.6.1) and Theorem 1.1.6.1, pp. 4–5, line 168–193; §2.3.2–§2.3.3, p. 15, line 679–699 | Finite modification of the volume tail agrees with the source’s Tamagawa convergence factors. Zero local factors are allowed. No convergent central Euler product or nonzero global period is assumed. |
| 6.1 `globalWhittakerRelativePeriods` | bpcz §8.1.2 and Theorem 8.1.2.1, pp. 76–77, line 4122–4154; §10.2.1, p. 90, line 4835–4845 | The central RS argument, opposite Asai signs, leading coefficients, invariant norm and nonzero β agree. The source confirms that λ is nonzero exactly when the central value is nonzero. |
| 7.4 `ggp8UnitaryPeriodIdentity` | bpcz Theorem 1.1.6.1, pp. 4–5, line 148–193; §2.3.2, p. 15, line 679–699; §10.3, pp. 90–92, line 4865–4946 | Completed factors, everywhere temperedness, strong base change, Tamagawa product and inverse component-group order agree. The coefficient is `2^(-r_total)`; the apparent sign typo in the source’s final sentence at line 4945 is not copied. |

There are 16 certified, accessible texts and one settled waiver, `xue-bessel`. The only manifest locator labeled unverified belongs to that waived, unused text. No active unverified locator, new missing reference or required source-service fetch was found; the manifest was left unchanged.

### Adversarial mathematics pass

Each row covers the named target, its API entries, hypotheses and Checks. “Retain” means no change requested, not a claim that a planned theorem has already been formalized. Zero rings, inseparable extensions, analytic positive characteristic and q=1 were tested against the standing domains and are excluded explicitly, rather than silently used in formulas.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | Hyperbolic basis; split rank one; B(i,1); ν(h)=i; upper GL₂ modulus; eigenvalues a,b | Pairings 0,0,1; U(1)=F×; linear-first value i; translation factor i; modulus \|a\|; two Euler factors retained. | Retain. |
| 1.1 `RelevantHermitianPair` | W=0 with line or H⊕line; positive definite C³; split idempotent | Ranks 1 and 3; definite rank three is not relevant with r=1; norm-zero idempotent is not a frame generator. Scalar extension retains the displayed complement. | Retain. |
| 1.2 `besselDatum` | r=0; r=2; split GL₃/GL₄ unipotents | Empty flag gives diagonal H; simple coordinates add; cross terms enter the nonsimple coordinate and do not alter b. Split character detects both x and y. | Retain. |
| 1.3 `besselTransport` | Identity and composite isometries; h and −h; changed ψ | Preservation equations are unchanged under common scaling. Character equality requires transport, and frame vectors remain generators. | Retain. |
| 2.1 `besselModel` | Trivial H; U(1) weights (1,−1) and (1,1); completion | Model dimensions 1 and 0 distinguish the smooth-dual convention. Continuous density supplies infinite-place extensionality. | Retain. |
| 2.2 distribution symmetry | Norm-one scalar; upper unipotent GL₂ matrix; two noncommuting matrices | Conjugate inverse fixes the scalar; transpose reverses the product. Identity is not a substitute anti-involution. | Retain. |
| 2.3 adjacent multiplicity | U(0) in U(1); compact incompatible weights; split R and ramified Q₂ | Bound is 1 at rank zero, may be 0 otherwise, and does not require compactness or temperedness. | Retain. |
| 2.4 finite-place reduction | r=1; W=H; a forbidden Bernstein block; upper GL₂ induction | Auxiliary GL₂ and isotropic rank two are correct even when residual W is isotropic. Closed-orbit removal needs the exclusion. Ordinary versus normalized induction differs by δ^(1/2). | Retain. |
| 2.5 infinite-place injection | dim S=0,1,2; a common half-plane; reducible parameters | Maxima of finitely many seminorm bounds give a common domain; the null reducibility locus cannot fill it. No uniform assertion on the full Hom space is needed. | Retain. |
| 2.6 multiplicity one | Whittaker endpoint W=0; both real line signs; compact negative control | Nonvanishing is not inferred from uniqueness. Two independent functionals would produce a forbidden two-dimensional S. | Retain. |
| 2.7 tempered integral | H trivial; compact circle; noncompact split torus; trivial GL₂ representation | Values preserve Haar mass. The non-tempered constant coefficient gives an infinite integral; negative relative root exponents handle log powers in the tempered case. | Retain. |
| 3.1 epsilon character | Empty parameter; χ₁⊕χ₋₁ against 1; χ₁ repeated twice | Values are respectively 1, central −1, and generator −1 with central +1. Distinct summands and multiplicities play different roles. | Retain. |
| 3.2 enhancement transport | Norm versus nonnorm t; t=−1 over R; two changes | Norm-class change is trivial; the even-side one-dimensional generator changes sign and the odd-side label does not; two changes cancel. | Retain. |
| 3.3 tempered relative form | H=1 of mass a; compatible/incompatible circle weights; r>0; reducible induction | Values aB, 1 or 0 as appropriate. Higher-codimension regularization and whole induced representation are essential. | R01 only. |
| 3.4 geometric multiplicity | Identity; x=−1 on W=C; r=1; compact U(2) at identity; θ=0 | Δ(1)=1; for r=1, D_G=64 and D_H=4 give Δ=4. Empty regular-nilpotent sets give zero coefficients without division by zero. Linearity gives m_geom(0)=0. | R01 only. |
| 3.5 local trace formula | W=0; noncompact real form; proper-Levi induction | Whittaker germ remains at W=0. The kernel is regularized; induction retains the GL regular-germ coefficient rather than a chosen constituent. | Retain. |
| 3.6 Fourier identity | μ=±ε; s=t=0; A=Z/2 | Total multiplicities are 1 or 0. Fourier data (1,−1) select the nontrivial enhancement after division by the group order. | Retain. |
| 3.7 finite-place packet theorem | Zero smaller parameter; wrong enhancement; Q₂ and Q₃ | Fixed complement avoids inventing an extra zero-dimensional inner form. Other enhancements have multiplicity zero; no residue restriction enters. | Retain. |
| 3.8 real theta reduction | Counts (0,1), (2,1); additional paired characters | Base count can occur at large total dimension. The induction measure decreases by two; determinant twists and small-lift signatures are retained. | Retain. |
| 3.9 real packet theorem | Compact highest weight (1,0), smaller weights −1 and 1; opposite complement; U(1) over W=0 | Dual interlacing gives multiplicities 1 and 0. Form negation transports labels. Rank-one models are one-dimensional in the reference normalization. | Retain. |
| 3.10 split prediction | GL₁/GL₀; adjacent GL₂/GL₁; generic GL₃ principal series | Generic character gives dimension 1; trivial N-character gives dimension 6 from its Weyl filtration. The infinite-place higher-codimension proposition supplies no theorem premise. | Retain. |
| 3.11 split generic theorem | n=0; adjacent all-place pairs; finite GL₄/GL₁; real GL₄/GL₁ | Rank zero is generic Whittaker uniqueness/existence. The last real example constructs the character but does not claim an existence theorem outside the stated range. | Retain. |
| 4.1 global period | Empty N; rational versus nonrational character; ν(h)=i | Rational triviality is necessary for descent; empty unipotent quotient has mass 1; inverse weighting gives right-character ν. | Retain. |
| 4.2 local obstruction | Missing local model; reference P(f⁰)≠0; modifications of values 2 and 3 | Vanishing obstruction is one-way. Factorization gives 6P(f⁰), and a reference rescaling changes the local normalization reciprocally. | Retain. |
| 4.3 tensor L-representation | b=0; (a,b)=(2,1); split local place | Dimensions are 0 and 4. Zero tensor has L=1; split factor has two conjugate-dual terms. Index two is used in the finite-Galois L-group. | Retain. |
| 4.4 global conjecture | W=0; zero central value; prescribed form lacking a local model | W=0 gives a Whittaker coefficient, and local models alone do not replace the central-value condition. Fixed form is retained. | Retain. |
| 5.1 normalizer | n=1; split q=2; ramified/infinite factors; global central zero | Δ₂ uses η then 1. Local factors are finite/nonzero before division. A zero global numerator is allowed without a vanishing adjoint denominator. | Retain. |
| 5.1a split Whittaker identity | n=1; normalized RS tensor; tensor in ker λ; doubling Haar | Raw diagonal values are ab\|L(1/2)\|² or 0; doubling H Haar doubles the form. The assertion requires compatible differential measures. | Retain. |
| 5.2 normalized local form | Zero vector; scalar multiple; compact mass a; discontinuous form on a completion | α(0,0)=0, q excludes 0, q(cx)=q(x). A discontinuous comparison form is not determined by the dense algebraic tensor. | Retain. |
| 5.3 spherical integral | Split Q₂ Satake 1,−1; nonsplit unramified Q₂, n=1; Steinberg/ramified data; scaled Haar | Split Δ=8/3, adjoint=32/9, tensor L=4 give C=3; coefficient sum is 3. Nonsplit compact H gives C=1. No spherical value is assigned without fixed vectors. | Retain all-residue target and its owned proof obligation. |
| 5.4 rescaling | Pairing ×2; local Haar ×2 and ×1/2; global H measure ×2 | Pairing cancels in q; product-one local changes cancel; squared global period scales by 4 under a global H measure change. | Retain. |
| 5.5 all-place product | Enlarging S; a zero local factor; moving volume 2 into S | Finite-modification formulas agree; zero stays zero. There is no reciprocal period or central Euler product. | Retain. |
| 6.1 Whittaker periods | n=1; zero vector; vanishing central value; two constituents in one degree | Asai signs are + and −. λ may vanish identically while β does not; pole orders in leading coefficients retain constituent counts. | Retain. |
| 6.2 relative characters | Basis vector ×c; convolution square; zero period; rank-one spherical projector | Norm cancels \|c\|²; J is positive on squares and zero for zero period. Local trace is Cα for the projector, with absolute interchange justified by §§2.7 and 5.2 plus the smoothing gap. | Retain. |
| 6.3 star-generic contribution | Constituent counts (1,1), (2,1); irrelevant datum; full split center | Coefficients 1/4 and 1/8; irrelevant contribution vanishes. Quotienting the center would change the coefficient. | Retain. |
| 6.4 isolated comparison | No auxiliary supercuspidal; one selected form; dense infinite-place transfer | Isolation keeps the full base-change class. Two transfer directions and continuity support detection; it is not an assumed individual period identity. | Retain. |
| 6.5 relative Euler identity | Zero local model; nontrivial κ_v with product 1; three constituents | Both sides can be zero without division. Individual constants need not be 1; coefficient is 1/8. | Retain. |
| 7.1 global nonvanishing | n=1; endoscopic parameter; fixed form without a local model | The theorem chooses an inner form and has no tempered or supercuspidal-place premise. It does not select an arbitrary prescribed form. | Retain. |
| 7.2 stable specialization | One constituent each; n=1 boundary; opposite Asai sign | Stable source range n>1 is retained, while §7.1 separately supplies n=1. Hermitian sign uses the ambient degree. | Retain. |
| 7.3 refined proposition | Counts (1,1), (2,1); zero vector; zero mixed pairing | Constants 1/4 and 1/8; zero vector excluded only for quotients. Factorwise polarization clears denominators and never divides by a mixed pairing. | Retain. |
| 7.4 GGP.8 | Vector/pairing/Haar scalings; central zero; endoscopy | All factors remain defined; central zero forces period zero; variable component order and all-place product are retained. Its proposition is not an assumption. | Retain. |

### Duplication and supplier audit

The main-branch reference was inspected as `main` at commit `205c555747e5f1d58e08d3afde7b3c2aa7db9601`. The supplied checkout is detached at a different commit; the relevant main README files below are unchanged between those commits. Main-tree object searches were also run directly, rather than inferring main from the checkout branch name.

Read these three main roadmaps for shape and ownership:

- `TauCetiRoadmap/ReductiveGroups/README.md:129`, `:234`, `:443`, `:627`: point dictionaries, closed subgroups, unipotent radicals and all-field parabolic/Levi theory. Layer 7 supplies the reductive-parabolic radical over imperfect fields as well; Layer 5’s perfect-field warning is not silently bypassed.
- `TauCetiRoadmap/GlobalNumberFields/README.md:163`, `:412`, `:423`, `:433`, `:470`: arithmetic adelic carriers, diagonal maps and scalar extension; group quotients and Tamagawa theory have another owner.
- `Completed/RestrictedProducts/README.md:248`, `:268`, `:305`, `:361`: generic reference families, maps, decomposition and rational diagonals. Lines 145–152 exclude the requested group-measure theory.

Object searches, followed by declaration reads, confirmed the consumed pinned interfaces:

| Object | Pinned declaration/file witness | Ownership result |
| --- | --- | --- |
| Nondegeneracy and orthogonal complement | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595`; `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean:48` and `:54` | Two-sided separation and the actual `B x y` chirality are preserved. No parallel generic definition. |
| Algebraic equivariant maps | `Mathlib/RepresentationTheory/Intertwining.lean:36`, `:53`, `:87` | Carrier and extensionality are imported; no continuity/admissibility is inferred. |
| Tensor and dual actions | `Mathlib/RepresentationTheory/Basic.lean:609`, `:618`, `:626`, `:670`, `:679` | Tensor action and inverse-action dual are cited; smooth dual remains separate. |
| Identity-form unitary group | `Mathlib/LinearAlgebra/UnitaryGroup.lean:52` | Correctly distinguished from arbitrary-form U(h), including rank zero. |
| Hopf points | `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:150`, `:167`, `:172` | Convolution algebra maps and postcomposition, not group-like elements. |
| Matrix Hermitian signatures | `TauCeti/Analysis/Matrix/HermitianSignature.lean:68`, `:147`, `:175`, `:203`, `:223` | Existing RCLike signature/inertia facts are not recreated by a target here. They do not supply arbitrary quadratic-étale Hermitian groups or local classification. |
| Graph-Frobenius matrix equation | `TauCeti/Algebra/Lie/SpecialLinear/StandardCarrier/UnitaryFixedPoints.lean:13` and `:51` | Its stated scope does not provide the arbitrary unitary group needed here. |

The manifest pins match the design: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches for Bessel models, Gross–Prasad, Whittaker functionals, epsilon factors, relative characters and spectral isolation found no duplicate target in those pinned libraries or the main roadmap tree. The Whittaker-name library hit is bibliographic, not representation theory.

`TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:310` concerns finite-dimensional algebraic GL branching; `TauCetiRoadmap/OrthogonalSpinGroups/README.md:63` excludes general Hermitian/unitary classification. Neither supplies these local representation endpoints.

Inspected the seven supplied open-head copies, both scope and object-search hits: `packages/QSeriesPartitionsAndMockModularForms/README.md`, `packages/K3SurfacesAndSymplecticBoundedness/README.md`, `packages/CohomologyComparisonsPartII/README.md`, `packages/ColemanIntegrationPartII/README.md`, `packages/QWittVectors/README.md`, `packages/ErdosProgressionPowers/README.md` and `packages/ArithmeticDynamics/README.md`, together with their Lean files in the object search. No duplicate Bessel/model/period endpoint was found. The unitary Weil-module references in QSeries and arithmetic Hermitian line bundles in ArithmeticDynamics are different objects.

Also inspected nearby board continuations. `packages/AutomorphicSpectralTheoryPartII/design/README.md:861` supplies general induced automorphic relative-character convergence, while `:1347` and `:1387` own multiplier isolation. The local smoothing assertion is different from the induced adelic assertion. `packages/SmoothRepresentationsOfLocalGroupsPartII/design/README.md:996` concerns generic induction heredity; `packages/ModularityAndLanglandsExtensionsPartII/design/README.md:936` and `:968` concern particular transfer and inert packet support. They are not a second ownership assignment for the relative GGP calculations. No target was moved to a later owner during this review.

### Declared-gap precision and minimality

All 36 contracts have named suppliers; none has supplier `none`. They are requests, not citations to nonexistent supplied declarations. The one-sentence needs and attached precise hypotheses/formulas were read together. The six L-function contracts and the separate local smoothing contract fix the earlier bundling problem. No gap was found to request a target already supplied at the eligible pins/main/open heads. Each row below covers every slug in that supplier’s contract block.

| Supplier | Slugs checked | Precision/minimality result |
| --- | --- | --- |
| ReductiveGroupsPartII | `hermitian-unitary` | General quadratic-étale, constant-rank, nondegenerate Hermitian geometry and arbitrary-form group realization; distinct from the generic form carrier and identity-matrix unitary group. |
| SmoothRepresentationsOfLocalGroups | `local-categories`, `local-bernstein`, `local-mirabolic`, `gl-tempered-genericity`, `local-jacquet-filtration`, `local-spherical` | Smooth categories, exclusion families, mirabolic restriction, genericity, Weyl filtration and all-residue spherical group formulas are separated. Relative Hom and spherical period calculations stay here. |
| AutomorphicFormsOnReductiveGroups | `archimedean-globalization`, `archimedean-generic-induction`, `archimedean-seminorms`, `automorphic-realization` | Real groups, category, parameter families, null reducibility locus and seminorm quantifiers are explicit. Relative integrals and injections stay here. |
| AutomorphicSpectralTheory | `distribution-gk`, `local-schwartz-germs`, `local-tempered-bounds`, `local-plancherel`, `local-fourier-extension`, `local-smoothing-trace`, `automorphic-spectrum`, `spectral-isolation` | Distinct analytic interfaces have stated spaces, measures and quantified conclusions. Real/null-cone homogeneity is not overstated as a universal scaling law. Multiplier continuation ownership and required placement remain explicit. |
| ModularityAndLanglandsExtensions | `enhanced-packets`, `global-parameters` | Actual correspondences, central restrictions, normalization and global constituent/base-change data are requested; GGP itself is not an assumption. |
| EndoscopicTransferAndUnitaryTraceComparison | `ordinary-endoscopy`, `relative-geometric-comparison`, `relative-finite-transfer`, `relative-archimedean-transfer`, `relative-fundamental-lemma`, `relative-character-comparison` | Ordinary transfer, global relative geometry, two local transfer categories, hyperspecial unit matching and the local spectral comparison are separated. Dense archimedean transfer is not inflated to surjectivity for every test. Raw integral formulas and constants are specified; the relative GGP spectral contribution remains here. |
| MetaplecticAutomorphicForms | `real-oscillator-model`, `real-small-theta` | Model estimates and small-lift signatures/parameters are separate from the relative seesaw. Equal/adjacent rank and the determinant-twist inverse are explicit; no big-lift irreducibility is requested. |
| AdelicAlgebraicGroups | `adelic-measures` | Requests group points, rational quotients and actual Tamagawa disintegration/volume products beyond the existing arithmetic adeles and generic restricted products. |
| AutomorphicLFunctionsAndLocalFactors | `factor-epsilon-identities`, `tempered-local-regularity`, `hermitian-global-values`, `local-rankin-selberg`, `whittaker-pairing-fourier`, `global-mirabolic-norms` | Fields, representation classes, arguments, integral measures and pole orders are explicit. No central value is required to be nonzero, and C_v plus the split relative identity retain their owner here. |

### Dependency check

The literal command from the brief failed before dependency analysis because `packages/GanGrossPrasadUnitaryGroups/README.md` does not exist at this design stage. Its result was `FileNotFoundError` for that relative candidate path; this is not a dependency finding. Repeated the same gate with candidate `packages/GanGrossPrasadUnitaryGroups/design/README.md`, the same `--only GanGrossPrasadUnitaryGroups`, configuration and `merge-order/ORDER.txt`. It exited 0 and produced exactly:

```text
candidate: GanGrossPrasadUnitaryGroups is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
depcheck: 8 roadmaps, 57 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Independently read all 40 Needs lines, seven layer dependency summaries and 12 supplier entries. Every internal target prerequisite precedes its consumer. All nine named gap suppliers occur in the order no later than ModularityAndLanglandsExtensions; the three actual main-roadmap suppliers were checked at their existing sections. Missing primary supplier sections are explicitly declared gaps. The promised Part II multiplier/relative-transfer work still needs its stated preceding placement; absence of that future implementation is not treated as supplier drift.

## Not verifiable

- **Original previous-review text:** the specified round-2 report is absent. All eight finding descriptions in the available round-3 repair report were verified, but additional wording from the missing original cannot be certified.
- **Lean elaboration:** **not available (this lane does not elaborate)**. There is no `Suggested.lean` in this design package and no authorized elaboration command for this lane. No build or warning-only claim is made.
- **Supplier implementations:** the 36 declared gap contracts are not present as completed suppliers in the supplied context. Acceptance is conditional on those contracts; it does not certify their implementation or approve any later upward dependency.
- **Direct source certification of the nonsplit dyadic extension in §5.3:** Harris’s theorem proves the recorded odd-residue intermediate. The full all-rank dyadic relative Cartan comparison is planned here, with the all-residue group-theory supplier input; it is not a theorem found verbatim in the cited text. Its stated proof route and both dyadic rank-one Checks were reviewed, but the future proof itself is not present to check.
- **`xue-bessel`:** unread and explicitly waived in `packages/GanGrossPrasadUnitaryGroups/sources.toml:23`. No target relies on it, no new missing-reference request was made, and the waiver was not reopened.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e0882fe9f1590667838e2951fef949805541e9f4", "job": "REV-DESIGN-GanGrossPrasadUnitaryGroups~3", "model": "gpt-6-astra", "worker": "chris-4"} -->
