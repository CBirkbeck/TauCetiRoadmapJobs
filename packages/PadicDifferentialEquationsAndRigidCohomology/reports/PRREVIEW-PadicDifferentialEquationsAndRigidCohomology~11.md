# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at 457e49f)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README.md:6910 constructs the block from the locally free crystal representative; 6923–6931 places purity after the common-vertex and Hartogs theorems; 6950 uses that purity target.
- R02 — repaired: README.md:6592, 6601 and 6872 reduce ramified coefficients by restriction of scalars and account for arbitrary Frobenius iterates; 6874 includes the crystalline representative.
- R03 — repaired: README.md:5349, 5697, 9017, 11712, 14562 and 14619 give the corrected pages and identify Definition 8.5.2.
- R04 — repaired: README.md:8795, 14539 and 14592 replace the three source-local bibliography labels with authors, titles and proposition numbers.
- R05 — repaired: README.md:8783, 8801 and 14542 identify the source's positive twist with this roadmap's negative Tate twist.
- R06 — repaired: the pull request description now identifies the neutral Tannaka reconstruction adapter as RD.2.52.

## Verified sound

| Statement or changed target | Instances tried | Values computed on both sides | Result; change |
| --- | --- | --- | --- |
| RD.2.2, renamed references | Rank-one unit; Fv=v | F(1)=1; 1 belongs to both coefficient rings | Bibliographic expansion matches Kedlaya-SFR line 2190 |
| RD.2.42, corrected locator | Artin–Schreier degree 1; p=3 | Highest break=1; φ(2)=1+(2−1)/3=4/3 | Kedlaya-Overview line 196, p.6 |
| RD.3.1, corrected locator | Frame of Spec k in Spf O | Tube=Sp K; relative dimension=0 | Kedlaya-Finiteness line 953, p.26 |
| RD.3.34, restriction of scalars | K=ℚ₂(√2); Φ(v)=√2v | Rank 1→2; slopes (1/2)→(1/2,1/2); determinant valuation=1 | Slope repetition holds |
| RD.3.34, new matrix Check | Basis (v,√2v); column and row conventions | Column [[0,2],[1,0]] sends e₁→e₂, e₂→2e₁; row matrix is its transpose; both give T²−2 | Column reading agrees with both basis images |
| RD.3.34, coefficient and polygon comparison | Identity extension; degree-two extension | Degree 1 repeats once; degree 2 gives P′(x)=2P(x/2), preserving both inequalities | Pass |
| RD.3.41, renamed reference | Two-point finite étale cover; unit coefficients | Rank(f_*1)=2; horizontal invariant sections=K^σ⊕K^σ on either side | Kedlaya-FF lines 612–614 |
| RD.3.43, semicontinuity | Legendre family, p=3; constant object | H(λ)=1+λ; H(2)=0; #E₂(𝔽₃)=4, trace=0; constant-object jump set=∅ | Closed jump locus; upward polygon |
| RD.3.43, ramified reduction | Generic slopes (0,1), special (1/2,1/2); degree 2 | Heights at x=1: 0≤1/2; repeated polygons at x=2: 0≤1 | Restriction reflects specialization inequality |
| RD.3.44, revised proof | O⊕O(−1); zero object | Slopes (0,1); rank-one block=O, determinant slope=0; rank-zero block=0 | Crystal→block→Hartogs route has no purity edge |
| RD.3.44a, new purity target | Legendre family over 𝔽₃; product family | S={2}, codim S=1; axes S×Y and Y×S have codim 1; intersection codim 2 | All three new Checks discriminate |
| RD.3.44a, product polygons | Ordinary/ordinary, ordinary/supersingular, supersingular/supersingular | Heights at x=2: 0, 1/2, 1; final height=2 in all cases | Deeper stratum differs from first jump |
| RD.3.44a, contradiction step | Generic vertex (1,0); special slopes (1/2,1/2) | Every rank-one subobject has slope 1/2; extending determinant slope 0 would force 1/2≤0 | Contradiction uses common vertex and Hartogs |
| RD.3.45, revised dependency | Legendre ordinary locus; constant object | Ordinary graded ranks=(1,1), slopes=(0,1); constant object permits empty divisor | Uses RD.3.44a after RD.3.44 |
| RD.4.21, renamed reference | T=∅ and Z=X=Spec k | Support sequence 0→K→K→0; both maps have the stated kernel/image | Reference resolves via Kedlaya-Finiteness line 1032 |
| RD.5.3, corrected twist | p=2, f=2, ℓ=1 | q=4; O(−1) has F=4 and slope m=fℓ=2; O(1) has F=1/4 | Source twist and roadmap twist now agree |
| RD.5.4, corrected twist | Trivial rank-one coefficients; q=4 | φ(F1)=4=q·σ(φ(1)); d1=0 on both sides | Kedlaya-FF lines 175–179, 385–389 |
| RD.5.11, corrected locator | Monomial t²; ρ=4, ε=1/2 | Norm at ρ^ε=4; 1^(1−ε)·16^ε=4 | Kedlaya-Finiteness line 545, p.15 |
| RD.6.8, corrected locator | n=0,1; q=4 | Frobenius degrees q⁰=1 and q¹=4 | Kedlaya-Finiteness line 781, p.21 |
| RD.6.14, renamed reference | Spec 𝔽_q; unit | H⁰=K, F=1; inverse=1 | Kedlaya-WeilII line 1554 |
| Corrections: descending filtration and factorization references | Slopes (1,0); A=UV | Descending first rank=1, slope=1; A⁻¹=V⁻¹U⁻¹ | Kedlaya-LMT lines 2680 and 2969 |
| Corrections: Lemma 6.3.4 | m=2 boundary points, n=1 matrix size | Two conditions indexed 1,2; printed upper limit 1 omits the second | Corrected page=41 |
| Corrections: chain-pairing sign | v=t₁dt₂, w=1/(t₁t₂), degree i=1 | Res(v∧dw)=1=Res(dv·w); (−1)^(i+1)=+1 | Corrected locator follows Definition 8.5.2 |

Untouched statement rows stand as in the previous review of ef77e5b.

- 6 corrected locators and 9 expanded bibliography references checked against the cached source text and bibliography.
- Newton arguments checked at Kedlaya-Notes lines 58, 90, 288, 330, 353 and 468; DAddezio-Parabolicity line 239; Katz-SlopeFiltration lines 892 and 1279; DeJongOort-Purity line 751 (Theorem 4.1, printed p.224).
- 3 pinned declarations opened: Mathlib/RingTheory/WittVector/Isocrystal.lean:112, :156, :179; they provide the Witt carrier, standard rank-one objects and rank-one classification, without convergent families or ramified coefficient categories.
- 18 declarations checked with explicit @-signature probes; 0 lost hypotheses, 0 changed Lean declarations; 14 sorry warnings and no errors in direct elaboration.
- 5 scoped supplier contracts reopened: CrystallineCohomology CR.4.7, AdicSpacesPartIII R2.3–R2.4, AdicSpacesPartIV F1.2–F1.3; the citation resolver found 0 unresolved cross-roadmap citations.
- Gate with the supplied merge-order-moved.txt: all checks pass; targeted Lake build succeeds. Dependency output: “depcheck: 212 roadmaps, 1934 edges, 0 problem(s)”.
- Default-order gate diagnostic “UPWARD: PadicDifferentialEquationsAndRigidCohomology (#120) -> CongruenceSpectralGap (#157)” uses the unmoved order; it disappears with the job's supplied order and is not a roadmap defect.
- PR title, prose and roadmap-summary checked against the new-folder diff; 0 outside-folder changes; worktree remains clean.

Overlap check: read CrystallineCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, AInfCohomology, RelativeFarguesFontainePartII, AdicSpacesPartIV, NewtonPolygons and ClassicalArithmeticCompletion; point-isocrystal decomposition belongs to CrystallineCohomology CR.4.7, dagger presentations to AdicSpacesPartIV F1, polynomial polygons to NewtonPolygons; convergent coefficient restriction and family Newton-jump purity belong here.

Source independence: changed passages only; 18 passages compared with 11 sources, no copied expression or reused material found. Among 626 full-title mentions of the 11 supplied cached works, Kedlaya-Finiteness has the largest share, 145. No layer was added, removed or reordered; the previous arrangement audit stands.

## Not verifiable

- none within the changed-passage review; bibliography expansions were checked in the citing works, without re-auditing the unchanged original results.

## Source issues

- **Misprint** in Kedlaya-Notes at Remark 4.7, printed p.9: the source says the unique-filtration clause twice; it should be stated once; affects nothing.
- **Misprint** in Kedlaya-Notes at Remark 5.2, printed p.11: the source says parts (b) and (c) of Theorem 3.12(c); it should be Theorem 3.12; affects nothing.
- **Gap** in Kedlaya-Notes at Remark 5.2, printed p.12: the source says Corollary 4.2 supplies a slope filtration where one generic vertex persists; it should use Theorem 4.1 for that vertex and extend its subobject; affects the proof.
- **Misprint** in Kedlaya-FF at Theorem 5.1 proof, condition (a), printed p.11: the source says the functional equation without coefficient Frobenius and with p^ℓ; it should use q^ℓ and σ on the functional's value; affects the proof.
- **Misprint** in Kedlaya-Finiteness at Lemma 6.3.4, printed p.41: the source says the boundary index ends at the matrix size n; it should end at the number of boundary points m; affects a stated result.
- **Error** in Kedlaya-Finiteness at the chain pairing after Definition 8.5.2, printed p.59: the source says integration by parts always contributes a minus sign; it should contribute (−1)^(i+1) when the first input has degree i; affects the proof.
- **Misprint** in Kedlaya-LMT at Proposition 5.11 proof, printed p.66: the source says the determinant of the highest-slope block is the lowest-slope exterior-power submodule; it should say highest-slope; affects nothing.

## For the human reviewers

- none
