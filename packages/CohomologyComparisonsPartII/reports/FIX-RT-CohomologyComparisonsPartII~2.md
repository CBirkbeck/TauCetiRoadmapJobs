# Repair verdicts

The headings retain the supplied finding IDs; “Review a” and “Review b” distinguish repeated IDs. Their earlier-finding verification tables provide context; the six new findings below are settled once each.

## F01 (P3) — applied

Review a.

False filtration negative control → retain the O(0)/O(1) evaluation computations, acknowledge that Frobenius also kills Hom(O,O(1)), and use T with Φ=1, F⁰=0, F⁻¹=Q_p to isolate filtration. The scalar identity O→T preserves connection and Frobenius and fails filtration. Evidence: AM line 152–154, AM line 181–184.

## F02 (P1) — applied

Review a.

AM-only relative realization input → register `gap:relative-rigid-realization` for every complete mixed-characteristic DVR with perfect residue field, including affine coherent models and derived colimits. Consume it in §§6.1,6.5; retain Frobenius enhancement in `relative-rigid-coefficients`. Add the π²=2 relative affine-line Check. Explicitly mark extension beyond AM’s standing assumptions (AM line 117–120, AM line 451–496, AM line 612–620).

## F01 (P2) — applied

Review b.

Two claimed period normalizations → only the EN/NN factorial lattice is the fundamental-sequence kernel and period target. Delete the CN period-map assertion, `Syntomic.boundedPeriod_lattice` and the factorial additions to §§4.4–4.5 bounds. Keep CN spans, products, coordinate inclusion and module error algebra. Update Lean documentation and the p=2,r=2 Check (NN line 2324–2326; EN line 306, EN line 326–335).

The witness is decisive: γ₂(t/2)=t²/8 is killed by 4−φ, and 1/8 does not belong to the printed coordinate span (1/4)Z_2. CN line 968–971 omits the factorial in its recalled global kernel. CN Lemma 2.23(ii), CN line 976–977, instead promises only p^r-exactness on chart coefficients; that intermediate supplier contract remains valid with its printed lattice. This distinction prevents deleting a legitimate intermediate estimate along with the unsupported final period map.

## F02 (P3) — disputed

Review b.

Retain A(e,p,r). CN Theorem 1.1(ii), CN line 83–84, and EN Theorem 2.3, EN line 334–335, explicitly assert this uniformity. CN Theorem 5.4(ii), CN line 2605–2606, states a weaker K-dependent bound, which does not contradict either theorem. The witness supplies neither a counterexample nor an unbounded family of necessary exponents. The README now identifies both versions precisely.

Passing to K(ζ_(p^i)) at CN line 2640–2641 and using the relative ramification cost at CN line 2748–2751 does not itself show that dependence on K is necessary. The finding identifies an omitted uniformity explanation in that proof, not a false target. Weakening the roadmap below the expressly stated CN/EN theorem would conflict with the required generality. The e-uniform assertion remains a theorem target to prove, rather than an assertion that any supplier has already implemented it.

## F03 (P3) — applied

Review b.

Twenty-six unprefixed needs sentences → every registered gap has exactly one `What <Supplier> must provide (gap:<slug>): <needs>` occurrence under Exact supplier contracts. All 34 final needs strings agree verbatim with the registry. The 26 formatting repairs preserve their mathematical text; the separately reviewed relative-rigid contract split accounts for the new entry.

## F04 (P3) — not actionable in this package: supplier announcements require maintainer action

Review b.

The comparison with the accepted design confirms seven amended entries. Their mathematical corrections remain. Announcing revised contracts on suppliers’ jobs is outside the permitted package edits and GitHub writes. Adding “Amended since the accepted design” to the README would violate its binding timelessness rule. The complete announcement ledger is recorded below for the maintainer; no supplier task or accepted target is invented.

## Maintainer consequences

The following ledger compares the accepted design with the final contracts, including the new relative split. It is reporting, not a claim that the suppliers already state the stronger interfaces.

| Supplier | Gap | Amendment or prerequisite to announce |
|---|---|---|
| CrystallineCohomology | `hyodo-kato-proper` | The proper HK contract is explicitly consumed by §5.2 as well as §5.1; the enhanced arithmetic-pair deformation contract remains separate. |
| PadicPeriodRings | `period-rings` | Integral Fontaine–Messing fundamental sequences for ordinary small-weight and factorial all-weight lattices are required. |
| PadicDifferentialEquationsAndRigidCohomology | `rigid-realizations` | Absolute rigid realization only; the algebraic de Rham clause belongs to `relative-hodge`. |
| PadicDifferentialEquationsAndRigidCohomology | `relative-rigid-coefficients` | Frobenius coefficient realization, lift transport and Frobenius enhancement on AM bases; the unenhanced realization and affine models now have the distinct contract below. §6.5 consumes this contract only for conditional Frobenius compatibility. |
| PadicDifferentialEquationsAndRigidCohomology | `relative-rigid-realization` | New registered gap: general relative rigid complex, analytic relative-form description and Gauss–Manin connection without F_V; affine coherent models and derived-colimit comparison for arbitrary such V. Construction locators: AM line 451–496, AM line 612–620; extension beyond AM line 117–120 is explicit. |
| CohomologyComparisons | `relative-hodge` | Absolute filtered algebraic de Rham realizations over characteristic-zero fields, as well as the relative filtered-realization and strict residue contracts. |
| PadicHodgeTheory | `local-period-galois` | Its intermediate Galois comparisons do not include the Koszul-to-continuous bridge; that is registered as `local-period-koszul-resolution`. |
| CohomologyComparisons | `rational-descent` | Shared-carrier identification with N_base,norm=−N_c/e and its uniformizer-change law, compatible with Frobenius and de Rham projection; consumed by §5.2. |
| PadicHodgeTheory | `local-period-fundamental-sequences` | Remains an intermediate §4.4 input. Its former §4.2 use for an unsupported CN period map is deleted. |

The final period target is L_EN/p^n throughout §§4.2,4.4,4.5, with bound A(e,p,r), or Nr+c_p under the stated enough-roots hypothesis. Consumers must stop citing `Syntomic.boundedPeriod_lattice`; no Lean declaration of that name existed. The name `Syntomic.modifiedLattice_EN_CN` remains a coordinate inclusion, and `Syntomic.modifiedLattice_errorTransport` remains module algebra. All nine names declared in `Suggested.lean` are unchanged, and their signatures are unchanged. No ownership moves from later roadmaps, merge-order changes, or new integration dependency are needed.

## Adversarial mathematics pass

Each subsection row includes its milestone, component API, defining conditions and Checks. This is a by-hand mathematics pass over the full README and all Lean declarations, not an elaboration result or independent acceptance.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Conventions: AM base and classical bases | p=2,3; π²=p; identity; empty/generic-only chart | A modulo-p Frobenius lift fails on the ramified trait; this restriction is absent from the classical and unenhanced relative constructions. | Separate general relative gap. |
| Conventions: shifts, twists, monodromy, residues | (2,5) under d_A=id,d_B=2id,f=3id; O(±1); rank-two N; 0,∞ | Fibre output (2,−4); φ(dlog t)=p dlog t; positive Taylor change; residues (1,−1). | None. |
| Supplier interfaces, scalar towers and universes | K=K0 and ramified K; zero coefficients; arbitrary perfect k; exact versus abelian category | Keep semilinearity, actual extensions and chosen exact structures; no abelian Ext instance for FilFMIC. General relative consumers formerly exceeded AM contract. | New gap and canonical prefixes; no duplicate construction. |
| §1.1 FilFMIC, data, morphisms, forgetful API | Zero, unit, Φ(e)=te on G_m, generic-only component | Zero/unit valid; te fails horizontality; generic-only rigid realization is not faithful. | None. |
| §1.2 tensor, dual, Tate and pullback API | m=0,±1; zero factor; identity pullback; three lifts | Filtration jumps and inverse Frobenius factors agree; identity and cocycle laws concern supplied transport. | None. |
| §1.3 strict exactness and Yoneda API | Split extension, zero module, identity from F⁰=0 line to F⁰=all line | Split class zero; differently filtered identity not admissible; tensor exactness uses locally free graded pieces. | None. |
| §1.4 connection fibre and coordinate API | Point O(0), O(1); zero modules; basis vectors; (2,5) | Point unit has H⁰=H¹=Q_p; Tate point has only degree-one Q_p; coordinates give (0,2),(0,−1),(2,−4). | None. |
| §1.5 extension evaluation API | i=0; split extension; Φe=e−h; O(1); T | The nonsplit class is +(0,h). O(1) vanishing also follows from Frobenius; T isolates the filtration obstruction. | Corrected Check. |
| §1.6 injectivity, lifts and projections | F⁰H=0; Φe=e+ah; F⁰H≠0 | R=−ah; zero degree-zero source removes coboundaries; without F⁰H=0 lifts differ. | None. |
| §2.1 specialization API | Point; empty scheme; Spec(K); identity | sp=id on point and K→0 on generic-only component; no universal equivalence. | None. |
| §2.2 rigid fibre API | V=Z_p,r=0,1; empty special fibre | Weight zero has diagonal H⁰ and first-target H¹; positive weight has H¹=Q_p; generic-only fibre is F^rDR. | None. |
| §2.3 exact sequence, descent, cup and elimination API | bc=id, sp=0; G_m; odd degrees; empty product | Eliminate a=sp(b) without inverting sp; twist factor p⁻¹; Koszul sign retained. | None. |
| §3.1 divisible PD API | n=1;r=0,p−1,p;p=2 | Division takes place before reduction; equality at r≤p−1 does not extend the exact period range. | None. |
| §3.2 divided/undivided fibres and realization API | r=0; zero A→B; empty log scheme | Weight-zero fibres agree; zero map has H⁰=A,H¹=B; kernel replacement is site-specific. | None. |
| §3.3 error maps and products | r=0; p on Z/p²; weights r,s; odd degrees | Both composites p^r; killed errors do not imply integral inversion; no multiplicativity assigned to τ. | None. |
| §3.4 presentations, completion and rational fibre | r=0; horizontal point; tail inclusion tower | Quotient DR/F⁰=0; inverse to ω is p^(−r)τ; tail lim¹ is product/direct sum, not zero. | None. |
| §4.1 lattices and all coordinate/product/error API | p=2,r=0,1,2; p=3,r=4; floor carry 0,1; reduction mod 2 | Kernel generator t²/8 differs from printed t²/4; coordinate inclusion 2 reduces to zero on nonzero quotients; 2 is a Z_3 unit; product coordinate p^c(a_r+a_s+c)!/(a_r!a_s!) is integral. | Distinguish kernel and printed lattice; retain module statements. |
| §4.2 Fontaine–Messing maps, reduction, ω, cup and site | Weight zero; trivial-log and canonical-log point; inertia character | EN composite lands in factorial lattice; nearby cycles retain nonzero H¹ stalk; j starts at generic trivial-log locus. Inclusion L_CN→L_EN cannot construct a period map in reverse. | Delete CN period-map claim and its supplier use. |
| §4.3 exact divided comparison and naturality | p=2,3;n=1; t dlog t on G_m | Exact range r≤p−2; inverse Cartier uses a^p; undivided comparison does not follow integrally from ωτ=p^r. | None. |
| §4.4 bounded comparison and uniform/refined API | r=0,1; p=2; xy=π^h,h>1; q>r; fixed e versus fixed K | EN gives factorial target directly; no factorial transport cost. CN main theorem/EN assert e-uniformity; body theorem gives weaker K-uniformity. Enough-roots p=2 qualification retained. | Correct target, delete lattice-bound target; retain e-uniform milestone. |
| §4.5 gluing and restriction/triangle/period/truncation API | Empty closed part; identity open map; closed and generic stalks | Exact restrictions detect cohomology kernel/cokernel; bound is A or Nr+c_p, with neither factorial addition nor doubling. | Update exponents. |
| §5.1 HK adapter and isocrystal API | Point; nilpotent rank-two block; non-Cartier k[t]/t^m | Nφ=pφN; positive Taylor change; nonbijective φ excludes non-Cartier example from isocrystal instance. | None. |
| §5.2 total fibre, comparison and convention API | D=E=0;r=0,1;e=0,1,2; independent D1 inputs | D1D0=−p^(−r)Nφ+p^(1−r)φN=0; at r=0 lower map is 1−pφ; both chain squares valid at e=0 but no equivalence. Nonzero D1 values e0,e0,e1 and −e0/2 fix signs. | None. |
| §5.3 classical-to-h and period adapter API | Identity; geometric extension; p=2;r=0;q>r | Classical comparison retains arithmetic-pair hypotheses; base periods only assert τ≤r. | None. |
| §6.1 relative datum and comparison/frame/naturality API | id_S; empty family; P¹/S | H²(P¹)=O(−1), Frobenius p; arbitrary open-family datum asserts no coherence. | Consume general realization plus conditional Frobenius enhancement. |
| §6.2 promotion and forget/pullback/uniqueness API | c=0 on line; nonfree graded piece; D(pt−1) | Rigid coherence does not descend algebraic finiteness; unbounded pole orders obstruct finite algebraic H⁰ in generic-divisor Check. | None. |
| §6.3 good compactification and transport/independence API | Constant G_m; empty horizontal boundary; sections 0,t | Both total and relative NC conditions matter; collision is not a relative NC boundary; no compactification-existence claim. | None. |
| §6.4 geometric finiteness and horizontal comparison API | Constant genus 0,g curves; G_m;p=2 | Separate rigid and algebraic inputs give ranks 1,2g,1 and Frobenius p on dlog; AM domain still requires its lift. | None. |
| §6.5 continuous-form comparison and coherent corollary | A¹; G_m; elliptic curve; π²=2 relative affine line; general acyclic input | Dagger H¹(A¹)=0,H¹(G_m)=K dlog t; proper elliptic H¹(O)=K invalidates unrestricted vanishing. Ramified realization needs no F_V; coherent corollary is narrower than general acyclicity theorem. | New supplier gap and ramified Check; Frobenius conditional. |
| §6.6 residue sequence and Ext API | Split G_m; t²+t+1 over Z_2; empty D | Res=(1,−1), Gys=sum; nonsplit trace-zero Frobenius −2; empty proper boundary retains H² and is excluded by affineness. | None. |
| §6.7 geometric projection API | Split extension; G_m,n=1; n=0 | H¹(G_m)(2)=O(1), F⁰=0; residue lands in H⁰(D)(1); no n≥1 restriction. | None. |
| §7.1 compatible lifts and uniqueness/naturality API | σ(t)=t^p and t^p+p; t=p;p=2,3 | Teichmüller lifts commute with Frobenius; t=p fails first lift; second lift of zero is p mod p². | None. |
| §7.2 section detection and equality/choice API | M=0;x=1;k=F_p,t^p−t; empty special fibre | Finite-field Teichmüller evaluations do not detect nonzero t^p−t; algebraically closed residue and reduced special fibre are essential. | None. |
| §7.3 extension specialization and lift/remainder API | Split; point identity; t=p under σ(t)=t^p | Connecting maps commute under actual pullback; arbitrary substitution is not a Frobenius-compatible extension. | None. |
| §7.4 log/rigid comparison, cup and period API | Point r=0; G_m; vertical-log point r=1 | Horizontal fibre gives H¹=Q_p, vertical C_st gives Q_p²; the two log structures cannot be identified. | None. |
| §7.5 absolute value and connecting/naturality/period API | n=1,r=2 curve; split extension; missing filtered vanishing | Connecting representative +(0,b); two vanishings give inverse; omission can destroy surjectivity. | None. |
| Lean definitions and admitted signatures | All five real bodies; both lattice signatures; square-zero and two adapter squares; zero and rank-two modules | All binders are explicit in each signature. Nonzero denominators use primality/characteristic zero. No theorem uses an unstated geometric hypothesis. Six proved examples discriminate the five definitions. | Three docstrings clarify printed CN coordinates; no signature change. |

## Checks and verification limits

- **Suggested.lean elaboration:** not available under the job instructions. No Lean command was run. By-hand checking does not certify elaboration of the existing proof scripts.
- **Dependency check:** prescribed `tauceti-roadmap gate --depcheck` invocation for `packages/CohomologyComparisonsPartII/README.md`, name `CohomologyComparisonsPartII`, and the supplied configuration/order exited with status 0 and output:

  ```text
  depcheck: 5 roadmaps, 37 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. No tooling or merge-order file changed.
- **Registry and file consistency:** 34 canonical gap prefixes, each exactly once, each followed by its registry needs string. Every top-level plan value outside `gaps` is unchanged. All nine Lean declaration names occur in the README. The deleted `boundedPeriod_lattice` name and obsolete CN period/exponent variables are absent from the roadmap. Single `import Mathlib`; five real-bodied definitions, four admitted theorem signatures, six proved examples; no new declaration, admitted data, option override or prohibited diagnostic.
- **Sources:** the manifest parses with 26 entries. Added precise EN Theorem 2.3 and NN kernel-lattice locators, AM relative-realization locator and usage, and CN body-theorem locator. No new work or missing reference was needed; BesserII remains settled as uncertified and supplies no producer target. No source text was copied into the package.
- **Pins and duplication:** inspected local library checkouts at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, equal to the content manifest. Checked scalar action, generator spans/unit invariance, reduction kernels and isocrystal carriers against the pinned files and certified extractions (MathlibPadicLattice line 580–588; MathlibSpanReview line 241–254, MathlibSpanReview line 895–906; MathlibPadicReductionReview line 450–464; MathlibPin line 117). Object searches give no native replacement for the relative rigid complex or FilFMIC at the pins. The new geometric Checks therefore stay in README, rather than forcing missing carriers into Lean.
- **Ownership:** read the main AdicSpacesPartIV, GrothendieckEulerForms and completed HodgeStructures shapes; checked AdicSpacesPartIV §F1.7 and QWittVectors §1.7 against the consumed interfaces. Inspected the supplied ColemanIntegrationPartII ownership boundaries; searched the supplied ErdosProgressionPowers and ArithmeticDynamics roadmaps for competing syntomic/coefficient constructions. No new overlap was established. Unavailable general rigid/cohomology supplier sections remain explicit gaps, not asserted exports.
- **Whitespace:** `git diff --check` passed with no output. No commit, push, issue edit, supplier message or pull-request write was made.
