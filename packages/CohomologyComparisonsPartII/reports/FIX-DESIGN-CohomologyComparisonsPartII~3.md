# CohomologyComparisonsPartII repair report

## F01 (P2) — applied

Summary-only intake requests → mathematical `needs` contracts with domains, maps and conclusions. Split crystalline sites from filtered quotients, absolute rigid realizations from horizontal-log comparison, and nearby-cycle topoi from Cartier and local graded-symbol calculations. Synchronize prerequisite keys and `neededBy`. Retain supplier ownership and the all-degree Yoneda gap; add the Cartier coefficient-rule Check.

Evidence: EN line 150–164 gives the log-syntomic coefficient domain, flatness, reduction and crystalline realization; EN line 198–218 gives local PD presentations. NN line 485–487 gives the proper log-smooth filtered quotient comparison, and NN line 1299–1338 fixes completion, reduction and the rational quotient presentation. The new contracts do not request the J^⟨r⟩ construction owned by §3.1.

BesserI line 625–636 and BesserI line 648–688 distinguish semilinear rigid Frobenius from filtered compactification de Rham complexes. AM line 1302–1327 identifies the projective smooth W(k) horizontal-boundary comparison used by §7.4. The contract retains this geometric domain and does not add vertical logarithmic structure.

EN line 292–317 and EN line 336–357 specify the projection and open-extension comparisons. TsujiNearby line 1156–1166 and TsujiNearby line 1211–1245 supply the Cartier hypotheses, formula and exact étale sequence. TsujiNearby line 805–820, TsujiNearby line 873–883 and TsujiNearby line 892–929 give the local boundary-stratum computation. The latter request concerns n=1, degree equal to weight, smooth underlying schemes and μ_p in K. It does not assume §4.3 on arbitrary fs log-smooth schemes, every coefficient level or every degree below the weight. The remaining reductions are stated as proof work of §4.3, with TsujiNearby line 679–713, TsujiNearby line 954–992 and TsujiNearby line 1074–1140 as locators.

The Yoneda request now includes smallness, R-linearity, every nonnegative degree, extension equivalence, operations, exact-functor naturality, abelian comparison and the additional biexact symmetric tensor hypothesis. These are supplier gaps, not assertions that unavailable accepted sections already contain the requested theory.

## F02 (P3) — applied

Roadmap-only references for general exact structures and functors → pinned `TauCeti.ExactStructure` and `TauCeti.ExactStructure.IsConflationExact`, with files and additive binders. Update §1.3 and its plan prerequisites. Retain GrothendieckEulerForms only as owner of the additional Yoneda request. Specify tensor exactness in each fixed argument and view duality from the opposite exact category.

Evidence: TauCetiExactReview line 245–267 gives the chosen exact structure on a preadditive category with zero object and binary biproducts. TauCetiExactFunctorReview line 68–81 additionally requires an additive functor and two chosen exact structures. TauCetiExtReview line 54 still requires an abelian category and `HasExt`; MathlibExt line 53–59 has the same abelian boundary. Thus the review correctly distinguishes landed carriers from the unsupplied general Yoneda theory. The specialized filtered exact structure remains a target.

## F03 (P3) — applied

An inverse-limit caution without an instance → the inclusion tower A_n=⊕_(j≥n) F_p, with lim A_n=0 and lim¹ A_n=(∏ F_p)/(⊕ F_p), including the nonzero constant-one class. Give the short exact tower proof in the existing Check and synchronize its plan entry. No Lean stand-in or admitted example is introduced.

For the proof, set B=⊕_(j≥0) F_p and C_n=⊕_(j<n) F_p. Projection transitions on C_n are surjective and transitions on B are identities, so their lim¹ groups vanish. Their limits are ∏ F_p and B respectively. The six-term limit sequence of 0→A→B→C→0 identifies lim A with the kernel of the direct-sum inclusion into the product, and lim¹ A with its cokernel. The constant-one sequence has infinite support, even at p=2. StacksRlim line 10638–10675 supplies the two-term derived-limit model, Mittag–Leffler vanishing and six-term sequence.

## Adversarial mathematics pass

Each target row covers its statement, named APIs and Checks together. The pass checks truth on the stated instances; it is not an elaboration or an independent acceptance review. Characteristic-zero coefficient fields exclude zero rings and equal-characteristic DVRs. Empty schemes, zero modules and disconnected bases remain allowed. No end theorem is narrowed.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: fields, Frobenius and fibre signs | p=2,3; π²=p; zero module; multiplication 2 on Q; identity | The AM modulo-p Frobenius fails on the ramified trait; the classical setting permits it without that extra datum; d²=0 and connecting class is +(0,b). | None. |
| 1.1 FilFMIC and realization APIs | Zero, unit, G_m with Φe=te, generic-only component | Horizontality rejects Φe=te; generic-only rigid realization is zero and not faithful; de Rham realization determines morphisms. | None. |
| 1.2 Tensor, Tate, dual and transport APIs | Twists −1,0,1; zero factor; identity pullback | Filtration jumps and Frobenius exponents add; dual evaluation cancels twists; transport uses the isocrystal equivalence. | None. |
| 1.3 Strict exactness and Yoneda APIs | Split extension; zero coefficient; differently filtered identity; degree 0 | Underlying exactness does not imply strictness; Ext⁰ is actual Hom; split Ext¹ class is zero; duality reverses arrows. | Cite pinned carriers; explicit variance and fixed-factor tensor exactness. |
| 1.4 Connection fibre and cup APIs | Point O(0), O(1), zero; arbitrary two-term fibre | H⁰=H¹=Q_p for O(0); only H¹=Q_p for O(1); d² vanishes by the chain-map identity. | None. |
| 1.5 Extension evaluation APIs | i=0,1; split class; Φe=e−h; disconnected base | Identity evaluates to its unit class; the nonsplit example gives +(0,h); no identification of all H⁰ with Q_p is needed. | None. |
| 1.6 Unique lift, injectivity and projections | F⁰H=0 and nonzero; Φe=e+ah; split extension | Unique filtered lift gives remainder −ah; without F⁰H=0 lifts differ; zero representative gives a splitting. | None. |
| 2.1 Specialization diagram APIs | Point, empty scheme, generic-only scheme | Maps in degree zero are id_K, zero, and K→0; general specialization is not an equivalence. | None. |
| 2.2 Rigid syntomic fibre APIs | Z_p point, r=0,1,2; empty special fibre | Weight zero has diagonal kernel and first-target cokernel; positive weights have H¹=Q_p; generic-only fibre retains F^rDR. | None. |
| 2.3 Exact sequence, products and descent | Identity elimination; sp=0; G_m; empty scheme | Single-fibre elimination uses an identity component, not sp⁻¹; φ(dlog t)=p dlog t fixes the twist. | None. |
| 3.1 Frobenius-divisible PD coefficients | r=0; p=2,r=1,n=1; p·0=p·1 modulo p | Higher-level division is essential; equality through weight p−1 does not enlarge the exact comparison range. | Make ordinary PD supplier output explicit; J^⟨r⟩ remains here. |
| 3.2 Divided/undivided complexes | Zero map A[0]→B[0]; r=0; empty scheme | H¹=B for the zero map; a kernel alone loses it; both fibres agree at weight zero. | None. |
| 3.3 Error maps and products | r=0; multiplication p on Z/p²; odd degrees at p=2 | Composite p^r identities give killed errors, not an equivalence; no division by 2 or multiplicativity of τ is required. | None. |
| 3.4 PD presentations, completion and rational fibre | r=0; invert p^r; tail tower; finite-support versus constant-one sequence | Rational quotient vanishes at weight zero; inverse of ω is p^(−r)τ; the tower has H⁰=0 and nonzero H¹. | Concrete tower Check and separate filtered quotient contract. |
| 4.1 Modified Tate lattices | r=0,p−1; p=2,r=2,n=1 | Endpoint choices differ by p; equal-decomposition inclusion at p=2,r=2 has coordinate 2 and zero reduction modulo 2. | None. |
| 4.2 Period maps and coefficient adapters | Weight zero; unit; nonproper X | Maps agree at weight zero; unit maps to 1; closed-fibre nearby-cycle sections need not be all generic-fibre sections. | Explicit site/projection supplier contract. |
| 4.3 Small-weight comparison | p=2 and 3; undivided coefficients; t dlog t on G_m/F_p | Ranges are r≤0 and r≤1; scalar error identities do not transfer the integral equivalence; inverse Cartier gives [t^p dlog t]≠0 whereas [dt]=0. | Separate local inputs, explicit proof reductions and Cartier Check. |
| 4.4 Bounded comparison | p=2,r=1; ramified chart xy=π^h with h>1; q>r | Positive-weight p=2 result is bounded; dimension dependence in the refined constant is retained; truncation is essential. | None. |
| 4.5 Étale gluing APIs | Empty closed part; identity j′; weight-zero unit | Returns the open direct image when closed part is empty; localization uses exact open extension; units glue. | State exact open-extension/projection input. |
| 5.1 HK adapter and change law | Rank one N=0; φ=diag(1,p), Ne1=e0; non-Cartier fibre | Nφ=pφN; uniformizer change sends e1 to e1+log(u)e0; Cartier type is retained for invertibility. | None. |
| 5.2 Semistable total fibre APIs | r=0,1; two-dimensional (φ,N) datum; zero complex | N(1−φ/p^r)=(1−φ/p^(r−1))N; lower map at r=0 is 1−pφ; total differential squares to zero. | None. |
| 5.3 Classical/h-realization adapters | Identity refinement; p=2; r=0 | Products and period maps are transported on the same carriers; rationalization does not remove τ≤r. | None. |
| 6.1 Relative datum APIs | Identity family; empty U; P¹ family | Degrees 0,1,2 for P¹ are O,0,O(−1); no coherence follows merely from assembling the datum. | None. |
| 6.2 Promotion APIs | c=0 on rank one; zero datum; D(pt−1) over Z_p[t] | Promotion rejects noninvertible comparison and nonfinite algebraic realization; dagger inverse does not bound algebraic pole orders. | None. |
| 6.3 Good compactification APIs | Constant G_m; empty boundary; colliding sections | Total and relative boundary conditions hold for the product example; collision at t=0 fails relative normal crossings. | None. |
| 6.4 Geometric admissibility APIs | Constant genus g=0,1 curves; G_m; p=2 | Ranks 1,2g,1 and Tate signs agree; independent algebraic hypotheses remain separate from rigid finiteness. | None. |
| 6.5 Affine acyclicity APIs | A¹; G_m; proper elliptic curve | Dagger H¹(A¹)=0; H¹(G_m)=K dlog t; proper elliptic H¹(O)=K rules out removing affineness. | None. |
| 6.6 Residue, Gysin and Ext APIs | Split G_m boundary; quadratic étale boundary over Z_2; empty D | Residues (1,−1) sum to zero; nonsplit boundary uses trace and has Frobenius −2 on its trace-zero H¹; empty D retains H² in the general sequence. | None. |
| 6.7 Extension projections and residue APIs | Split class; n=0; G_m with twist 2 | Projections vanish on split classes; residue lowers the coefficient twist by one; degree zero introduces no extra sign. | None. |
| 7.1 Frobenius point APIs | 0,1, Teichmüller points; t↦t^p+p | Fixed lifts are unique; the lift of zero for the modified Frobenius is p modulo p², also for p=2. | None. |
| 7.2 Detection APIs | Zero rank; constant 1; finite k=F_p | Constants are detected on nonempty residue fibre; t^p−t vanishes at all F_p Teichmüller points, requiring the algebraically closed hypothesis. | None. |
| 7.3 Specialization/evaluation APIs | Identity base point; split extension; t=p for σ(t)=t^p | Compatible points transport the actual extension and unique lift; arbitrary evaluation does not commute with Frobenius. | None. |
| 7.4 Horizontal-log/rigid comparison APIs | Point, G_m pair, added vertical log | dlog Frobenius agrees; weight-one horizontal point has H¹=Q_p while the vertical-log point has H¹=Q_p². | Separate horizontal-log realization contract. |
| 7.5 Absolute extension value APIs | Curve n=1,r=2; split class; missing filtered vanishing | Connecting image is +(0,b); both filtered hypercohomology vanishings are needed for the connecting isomorphism. | None. |
| New crystalline supplier fields | r=0; n=1; ramified V; arbitrary log-syntomic X | J^[0]=O; fixed-r quotient at r=0 is zero; mod-p and mod-π fibres remain distinct; no divided coefficient is requested back. | Explicit fields and domains. |
| New rigid supplier fields | Empty Z; point; horizontal versus vertical log; r<0 | Empty realization vanishes; scalar fields remain K0/K; negative de Rham filtration is the full complex; no rigid Hodge filtration is invented. | Separate contracts. |
| New nearby-cycle local fields | q=0 on F_p; q=1 on G_m; n=1 in a ramified trait | Artin–Schreier is exact as étale sheaves, not on all global sections; inverse Cartier is Frobenius-semilinear; Cartier forms live on the residue fibre. | State sites, map, range and fibre distinction. |
| New exact-Yoneda field | Degree 0; split extensions; zero object; tensor unit | Ext⁰=Hom and split Ext¹=0; products need the additional biexact tensor data; no abelian or enough-injectives assumption is imposed on FilFMIC. | Full mathematical intake request. |

## Checks and maintainer notes

- Mandated dependency gate: exit 0. Exact output:

  ```text
  candidate: CohomologyComparisonsPartII is not in the merge order yet; checked as if placed after CohomologyComparisons (the intake inserts it when its design is accepted)
  depcheck: 3 roadmaps, 12 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line occurs. The candidate is `packages/CohomologyComparisonsPartII/design/README.md`; the order input is `merge-order/ORDER.txt`.

- `git diff --check`: exit 0, no output.
- JSON and TOML parsing: pass. Every gap paragraph agrees verbatim with its plan detail, needs and section. Every `gap:` prerequisite and `neededBy` entry agrees in both directions. Every target, API and Check name occurs in the README. There are 33 targets, 120 API entries and 105 Checks.
- Legal-source verification: five new source entries fetched successfully through the sources service. They record authors, titles, years, exact locators, certified legal provenance and hashes. No unresolved source request remains. BesserII remains the settled uncertified consumer-context citation and supplies no producer premise.
- Pinned-library check: the Tau Ceti exact structure, exact-functor and Ext files were read at the Tau Ceti revision in `lake-manifest.json`; Mathlib's existing cone, isocrystal, Ext and de Rham period-ring boundary remains unchanged. The specialized filtered category and general exact-category Yoneda theory are not replaced by abelian Ext.
- Ownership comparison: read the main-branch GrothendieckEulerForms, EnhancedDerivedSheaves and EtaleCohomologyFoundations roadmaps, and the ArithmeticDynamics and ErdosProgressionPowers package READMEs. The latter two introduce no overlap with these syntomic supplier contracts. Existing missing-section gaps remain gaps; no accepted supplier target is invented.
- Lean agreement: the design package has no `Suggested.lean` to synchronize. Its heavy sites, coefficient categories and enhanced comparison carriers remain README targets. No Lean declaration was added or changed; no Lean command or admitted example was introduced.
- New supplier-gap keys are `crystalline-filtered-quotient` (CrystallineCohomology), `rigid-log-crystalline` (PadicDifferentialEquationsAndRigidCohomology), and `nearby-cycle-cartier` / `nearby-cycle-graded` (EtaleCohomologyFoundations). Each retains a missing/proposed section and an explicit mathematical request. Supplier implementations and section acceptance remain outside this package.
- No end-theorem or API name changed. The existing tower Check name is retained; `Syntomic.smallWeightComparison_cartierWitness` is the one added Check name. No prerequisite moved to a later supplier, no layer was reorganized, and no content-repository, merge-order or pull-request text was edited. No commit was made.
