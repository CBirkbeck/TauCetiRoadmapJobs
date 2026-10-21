# CohomologyComparisonsPartII port report

Branch: `roadmap/cohomology-comparisons-part-ii`.
Head commit: `dd8d7e6fda7516b9ab6806d5d75f5202332851c7`.
Base: `44b6442`; initial working tree was clean.

The commit adds only `TauCetiRoadmap/CohomologyComparisonsPartII/README.md`, `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean` and `TauCetiRoadmap/CohomologyComparisonsPartII/metadata.toml`. The top-level roadmap list, manifest, toolchain, tooling and merge order are unchanged. No push or GitHub write was made.

## Validation

Command: `lake build TauCetiRoadmap.CohomologyComparisonsPartII.Suggested`.

Exact outcome:

```text
Build completed successfully (8976 jobs).
```

Warning count: **4**, all warnings that a declaration uses `sorry`, one for each of the four theorem targets. There are no other warnings. The final file has 244 lines, one `import Mathlib`, five real-bodied definitions, four theorem signatures and six proved examples. There are no admitted examples, admitted data, option overrides or roadmap imports.

Temporary `#check @` declarations were checked through the authorized target build, then removed and the final module rebuilt. The two lattice theorems retain `[Fact p.Prime]`; the square-zero theorem retains that hypothesis, both module structures and the actual relation `N.comp phi = (p : ℚ) • phi.comp N`; the scalar adapter theorem retains arbitrary natural p,r,e and all its linear maps. No section hypotheses disappear.

Exact gate summary:

```text
gate CohomologyComparisonsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate rejects every uncommitted path, including staged additions. Its precommit run passed every content, import, naming, scope and dependency check and reported only the three staged files. The clean-tree gate is run immediately after committing; its result above is the final result.

Dependency check, exit 0:

```text
depcheck: 5 roadmaps, 37 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `git diff --cached --check` also passed before committing.

## Draft pull request body

Build classical rigid and divided/undivided log-syntomic cohomology, their exact small-weight and bounded all-weight period comparisons, and adapters to the shared Hyodo–Kato and rational h-descent realizations. Develop filtered Frobenius connections, strict extension evaluation, relative open-curve residues and Frobenius-point specialization, so regulator constructions can use common cohomological interfaces with fixed lattices, signs and geometric hypotheses.

AI assistance: Codex (GPT-6) performed the port, supplier and duplication checks, Lean proof repairs and mathematical self-review. This is an author-side check, not an independent review.

## Dependencies that are open roadmaps

The consumed roadmaps absent from main are **QWittVectors**, **CohomologyComparisons**, **CrystallineCohomology**, **PadicPeriodRings**, **PadicDifferentialEquationsAndRigidCohomology** and **PadicHodgeTheory**. They are all earlier in the supplied merge order. They are cited by name and section, and none is imported into Lean.

The other supplier roadmaps are on main: AdicSpacesPartIV, RigidAnalyticGeometry, EnhancedDerivedSheaves, EtaleCohomologyFoundations, DerivedModuleAlgebra and GrothendieckEulerForms. ColemanIntegration and PrismaticCohomologyPartIII are named in Scope and ownership to distinguish their modified and prismatic syntomic theories; those statements are not rebuilt here. ColemanIntegrationPartII is a parallel integration development, not a prerequisite for the syntomic constructions.

## Port changes and upstream reread

The seven layers, all 33 numbered subsections, all 120 named Checks, their APIs, exact hypotheses, locators, worked examples and supplier contracts are retained. The title and opening Summary retain the package's mathematical scope. Topic remains `math.AG`, matching the main-branch metadata form.

The accepted review's non-blocking citation note is applied: all prerequisite references use `contract` and the contract slug. Section 4.2 now explicitly lists `local-period-fundamental-sequences`, alongside section 4.4. This repairs the package's missing prerequisite incidence while retaining its coefficient-ring/chart-theory ownership division (EN line 299–308; CN line 973–980; CN line 1234–1239).

The final mathematical reread produced these additional corrections and clarifications:

- Expressed supplier extensions as timeless consumed interfaces, retaining their full mathematical requirements and owners, and normalized all remaining registry-style contract references.
- Made References self-contained for the content repository: the package-only source-manifest pointer is replaced by the source-identifier convention, and the Lean-source references link the exact pinned repositories. BesserI retains its manuscript locators; its extraction-related process narrative is replaced by the mathematical relationship between its fibre and AM's fibre (BesserI line 712; BesserI line 741; AM line 1314–1327).
- Added the explicit ownership distinction for ColemanIntegration §L3.Fb.1's modified Frobenius-iteration direct-limit theory and §L3.Fb.2's Chern character, and PrismaticCohomologyPartIII §§6.9,6.29–6.32's animated/prismatic theory. Layer 2 here keeps the arithmetic K0-to-K diagram and algebraic filtration; Layer 3 keeps classical log-PD fibres.
- Made the scalar adapter theorem's domain explicit as all natural p,r,e, including p=0 and e=0, matching its actual Lean signature. The geometric chain equivalence still requires e≥1, and the square-zero theorem still requires p prime (NN line 1366–1384).
- Used Unicode scalar fields in prose and removed a temporal qualifier from the abelian Ext supplier description.

No mathematical target was deleted or weakened, no all-prime classical theorem was restricted to AM Frobenius-lift bases, and no theorem was found to require an additional mathematical hypothesis beyond those already stated.

### Lean repairs and movements

Nothing moved from Lean to README: all nine named declarations satisfy the headline/carrier rule, and the heavy geometric constructions already live in README.

The two lattice definitions are marked `noncomputable` because the pinned p-adic ring structures are noncomputable. The weight-four unit-factorial proof now exposes the p-adic numeral cast. In the weight-two negative control, clearing denominators gives `4z=2`, so the linear-combination step divides that equality by 2 to obtain `2z=1`; casting and coefficient reduction are explicit. The induced map on `ZMod 2` is explicitly the zero scalar map. The semistable examples now specify their unused E carrier as `ℚ × ℚ`, preventing numeral inference from selecting natural-number products, and close the product-zero equality definitionally. Linter-producing redundant tactic sequencing was corrected. These changes preserve every example's mathematical content (EN line 306; MathlibPadicLattice line 580–588; MathlibPadicReductionReview line 450–464; NN line 1366–1384).

## Supplier verification and duplication sweep

Verified the worktree manifest pins Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The package's pins match. Grepped and read the actual pinned declarations for mapping cones and their coordinate maps, isocrystals and equivariant maps, abelian Ext, de Rham period rings, p-adic scalar action and reduction, singleton spans, product linear maps, exact structures, monoidal/opposite exact structures, conflation-exact functors, linear Yoneda complexes and cone contractibility. The recorded additive-category, prime, perfect-domain, adic-completeness and abelian-category binders match these APIs (MathlibCone line 61–92; MathlibPin line 77–142; MathlibExt line 53–122; MathlibBDeRhamReview line 55–92; TauCetiExactReview line 245–267; TauCetiExactFunctorReview line 68–81; TauCetiExactMonoidal line 48–57; TauCetiExactOpposite line 150–203; TauCetiLinearYonedaReview line 51–105; TauCetiExtReview line 54).

The duplication search covered every active and completed roadmap on main, the four supplied open heads, and all 309 other-open-roadmap snapshots available to this job. Search objects included classical/rigid/log syntomic cohomology, filtered Frobenius connections, FilFMIC, Fontaine–Messing periods, Hyodo–Kato operators, nearby cycles, overconvergent cohomology, Yoneda extensions, coordinate lattices and Koszul complexes. Matching owner sections were read before using them. Revisions of existing roadmaps were not substituted for main-branch supplier contracts.

The existing package already delegates log geometry/HK to CrystallineCohomology, rigid realizations to PadicDifferentialEquationsAndRigidCohomology, period coefficients to PadicPeriodRings, general comparison to CohomologyComparisons, and Koszul complexes to DerivedModuleAlgebra/QWittVectors. Those replacements are retained. The new sweep identified additional ownership distinctions to state in Scope and ownership, rather than any theorem to remove. StableReduction's syntomic morphisms are not a cohomology theory; NewtonPolygons' slope interface does not supply an isocrystal construction; the prismatic and modified syntomic variants use different constructions. General abelian Ext and Hom complexes do not discharge exact-category Yoneda theory for FilFMIC. No new supplier replacement, duplication deletion or movement from a later owner was required.

The supplied open heads QWittVectors §1.7 and ColemanIntegrationPartII §§3.0c,3.1a,7.0 match the citations. ArithmeticDynamics and ErdosProgressionPowers contain no overlapping classical producer. The other matching open roadmaps concern the already delegated crystalline/prismatic theories or their arithmetic, analytic and integration applications.

Searched Mathlib open pull requests for syntomic cohomology and isocrystals, and searched indexed Zulip material. No relevant additional supplier was identified. The isocrystal search returned unrelated results, so it provides no evidence about absence; the pinned-source inspection is the evidence used for carrier availability.

## Adversarial mathematics pass

Each subsection row covers its definitions, every named API statement and identity, its stated conventions and its Checks. This table records mathematical checks as well as the separate elaboration check; a successful sorry build is not a truth proof.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Base and scalar conventions | V=ℤ_p; π²=p at p=2,3; general ramification e>1; zero modules and empty schemes | A modulo-p Frobenius lift forces valuation 1 on π and cannot be congruent to π^p modulo π^e when e>1; classical layers impose no such lift. Field and factorial denominators are nonzero. | None |
| Fibre, twist and product conventions | Multiplication 2 on ℚ; zero and identity maps; O(1)⊗O(−1); odd cohomological degrees | Fibre differential has +f and −d_B; connecting representative is (0,b); twist exponents add and cup symmetry uses (−1)^(ij), without dividing by 2. | Unicode notation only |
| Monodromy and residue conventions | φ=diag(1,p), Ne1=e0; e=1,2; u=1; G_m boundary | Nφ=pφN; positive HK Taylor change is e1↦e1+log(u)e0; base transport is −N/e; residues are (1,−1). | None |
| §1.1 coefficient category, ofData, morphisms and forgetful functors | Zero; unit; Φe=te on G_m; generic-only Spec(K) | The nonhorizontal map has ∇Φe=dt⊗e; generic-only weak completion is zero, so only de Rham faithfulness is asserted. | None |
| §1.2 tensor, Tate, dual and pullback API | O(±1); zero tensor factor; identity pullback; repeated lift change | Evaluation and twist cancellation agree; identity and cocycle transports retain the de Rham component. | None |
| §1.3 exact structure and Yoneda operations | Split extension; Ext¹(O,0); identity between differently filtered lines | Exactness on underlying modules does not imply strictness; the filtered identity's inverse fails filtration preservation. Biexact tensor uses locally split graded pieces. | None |
| §1.4 coefficient complex and coordinate differential | Point O(0), O(1); zero coefficient; (1,0), (0,1), (2,5) | Point cohomology and images (0,2), (0,−1), (2,−4) agree; first differential is retained. | No statement change; proved examples retained |
| §1.5 extension evaluation and cup/naturality API | Degree zero; split extension; Φe=e−h; filtered line with Φ=1 but F⁰=0 | Evaluation sends the unit to its actual image, split class to zero and nonsplit class to (0,h); the separate line detects filtration preservation. | None |
| §1.6 injectivity, unique lift, δ and R | F⁰H=0; Φe=e+ah; F⁰H≠0 | R=−ah; uniqueness fails when lifts differ by ch. No Frobenius-lift independence of R is claimed. | None |
| §2.1 specialization diagram | Spec(V), empty, generic-only Spec(K) | Maps are id_K and K0→K at the point; generic-only specialization K→0 is not an equivalence. | None |
| §2.2 rigid syntomic fibre and cohomology | V=ℤ_p; r=0,1,2; empty special fibre | Point groups are (ℚ_p,ℚ_p) at zero weight and (0,ℚ_p) at positive weight; generic-only fibre is filtered de Rham. Semilinear Frobenius is used over ℚ_p. | None |
| §2.3 long exact sequence, cups, descent and unramified elimination | Point; G_m; empty product; K=K0 | Eliminating a=sp(b) requires no inverse to sp; φ(dlog t)=p dlog t; empty products vanish. | Ownership boundary with modified theory added |
| §3.1 divisible PD and divided Frobenius | r=0; p=2,r=1; equation py=0 modulo p | Small-weight coefficient equality includes p−1; division modulo p alone cannot determine a divided image. | None |
| §3.2 divided/undivided fibres, realization and reduction | r=0; zero map A→B; empty log scheme | Families agree in weight zero; zero-map fibre retains H¹=B, which a kernel would erase. | None |
| §3.3 ω,τ and products | r=0; multiplication p on ℤ/p²; odd classes at 2 | Composites p^r bound errors without an integral inverse; no multiplicativity of τ is asserted. | None |
| §3.4 local presentations, gluing and completion | r=0; rationalization; tail tower ⊕_(j≥n)𝔽_p; trivial-log point | Quotient at r=0 is zero; inverse of ω is p^(−r)τ; lim¹ is ∏𝔽_p/⊕𝔽_p; horizontal point has H⁰=H¹=ℚ_p. | None |
| §4.1 enLattice, cnLattice and all lattice API | r=0; p=2,r=1,2; p=3,r=4; endpoint r=p−1 | Generators 1/8 and 1/4 differ by 2; inclusion is zero on their nonzero reductions modulo 2. At p=3 factorial 2 is a unit. Floor exponents support products; arbitrary smaller exponents fail. | Noncomputable annotations and proof repairs only |
| cnLattice_le_enLattice | All prime p; r=0; a=1,2 | CN generator equals a! times EN generator, with a! in ℤ_p. | None |
| modifiedLattice_generator | p=2,3; r=0,1,2,4 | Both sides are equal because p and a! are nonzero in characteristic zero. | None |
| §4.2 period maps and sites | Weight zero; trivial-log point; canonical-log point; cyclotomic ramified characters | Generic open is X_tr∩X[1/p]; nearby cycles retain geometric H¹. No factorization through X[1/p] exists for the identity of Spec(ℤ_p). | Explicit chart fundamental-sequence prerequisite added |
| §4.3 exact divided comparison | p=2,3; r=0,1,2; inverse Cartier on t dlog t | Exact ranges are r≤0 and r≤1; inverse Cartier sends t dlog t to [t^p dlog t], whereas [dt]=0. Undivided errors remain. | None |
| §4.4 bounded comparison and constants | xy=π^h with h>1; p=2,r=1; q>r; arbitrary n | Ramified charts and p=2 dimension dependence remain; general A(e,p,r) is uniform in n and X; nothing is asserted above r. | Contract citation normalization only |
| §4.5 étale gluing and errors | Empty closed part; j′=id; weight-zero unit | Open restriction is the actual direct image and period is identity there; exact restrictions retain the same error exponent. | None |
| §5.1 HK/isocrystal adapter | Rank-one point; rank-two monodromy block; k[t]/t^m with p∤m,m>1 | The actual supplied φ is transported; non-Cartier Frobenius is not bijective, so it cannot define an isocrystal instance. | None |
| §5.2 semistable fibre and comparison | D=E=0; rank-two block; p=2,r=0,1 | D1D0=p^(−r)(pφN−Nφ)=0; at r=0 the lower map is 1−pφ. | Explicit E carrier in examples |
| semistable_d_squared | Zero N; rank-two relation; p=0,r=1 as an excluded input | Prime hypothesis excludes the zero-scalar zpow failure; the elaborated theorem carries the actual operator relation. | None |
| semistable_baseConvention_differentials and geometric equivalence | e=0,1,2; p=0; N=0; independent nonzero D1 inputs | Scalar chain-map identities survive zero indices; equivalence requires e≠0. At e=2 the scale is −1/2, not merely −1. | README domain aligned with full scalar signature |
| §5.3 classical-to-h and arithmetic/geometric period adapters | Identity presentation; p=2; r=0 | Uses canonical supplied pair map; periods retain τ≤r and the geometric G_K action. | None |
| §6.1 relative datum | Identity family; empty; P¹/S | P¹ gives O,0,O(−1), hence Frobenius p in degree 2; arbitrary open-family finiteness is not assumed. | None |
| §6.2 admissibility and filtered realization | Zero; c=0 between lines; non-locally-free graded piece; U=D(pt−1) | Promotion rejects failed comparison and algebraic nonfiniteness; coherent rigid H⁰ does not make the algebraic localization finite. | None |
| §6.3 good compactification | Constant G_m; empty horizontal boundary; x=0 and x=t | Constant diagrams satisfy both normal-crossings conditions; collision at t=0 fails the relative condition. | None |
| §6.4 geometric sufficient settings | Constant curves of genus 0,1; G_m; p=2; ramified base without F_V | Ranks 1,2g,1 and twist O(−1) agree; algebraic Hodge conditions are separately supplied; AM domain excludes absent lifts only there. | None |
| §6.5 continuous differentials and coherent corollary | A¹; G_m; ramified V=ℤ_2[π]/(π²−2); proper elliptic curve | H¹=0 on dagger A¹, K dlog t on dagger G_m; relative ramified realization needs no Frobenius lift; H¹(E^an,O)=K excludes a general proper acyclicity statement. | None |
| §6.6 residue, Gysin and extension pushout | Split {0,∞}; nonsplit quadratic boundary over ℤ_2; D empty | Residues sum to zero; trace-zero Frobenius is −2; empty boundary retains H² and lies outside the affine short sequence. | None |
| §6.7 geometric δ/R projections and residues | Split class; n=0; G_m at n=1,r=2 | Twist yields O(1), with residue twist 1; split value is zero and n=0 needs no artificial exclusion. | None |
| §7.1 Frobenius-point lifts | σ(t)=t^p at 0,1,[a]; t=p; σ(t)=t^p+p | Teichmüller lifts commute; arbitrary lift p fails; shifted compatible lift is p modulo p², also at 2. | None |
| §7.2 section detection | Zero rank; constant 1; k=𝔽_p and t^p−t; empty special fibre | Algebraic closedness is essential; finite residue points miss a nonzero section; empty completion is the zero-module case. | None |
| §7.3 extension specialization | Split extension; identity point; incompatible t=p | Actual compatible pullback preserves u_i, filtered lift and R; differential pullback to the absolute point is zero. | None |
| §7.4 horizontal-log/rigid comparison | Point; P¹ minus {0,∞}; r=0,1; vertical log point | Horizontal point H¹=ℚ_p at weight 1; vertical C_st point H¹=ℚ_p². The two log structures cannot be substituted. | None |
| §7.5 absolute extension value | Curve n=1,r=2; split class; missing H^(n+1)(F^r) vanishing | F²Ω•=0 on a curve gives the connecting isomorphism with positive sign; removing either vanishing does not provide an inverse. | None |
| Crystalline and HK supplier contracts | Non-Cartier fibre; r=0; ramified V; arithmetic pair with nonproper interior | Filtered quotients, derived reduction and enhanced deformation inputs retain their distinct domains. | None |
| Rigid/Hodge/exact Yoneda contracts | Generic-only chart; nonfinite algebraic localization; nonsplit finite étale boundary; nonabelian exact category | No faithfulness, finiteness, split-boundary or abelian-Ext shortcut is introduced. | None |
| Nearby-cycle and local-period contracts | q=r=0; p=2; ramified thickening; r=0; p-power errors | Cartier is on the residue fibre, not the mod-p thickening; chart bounds, radii, coefficient reductions and continuous sections remain explicit. | Citation repairs only |

## Unresolved matters and untrusted text

No unresolved port blocker remains. The roadmap retains all **34** explicit extension contracts present in the supplied README. The accepted review enumerates 32 conditional gaps; the supplied README also explicitly contains `relative-rigid-realization` and `local-period-koszul-resolution`. Both are preserved with their owners and domains. These are requirements for the general library, not claims that stronger-domain supplier theorems are already implemented or reasons to wait for another repository. No gap is hidden by an admitted Lean data definition.

BesserI uses the legally supplied manuscript text with its exact manuscript locators. BesserII is consumer context only and supplies no producer target. No source passages were copied into the roadmap. No credentials or remote code were used.

Untrusted GitHub search-result templates included the unrelated command suggestion `git commit --author="Author Name <author@email.com>" --allow-empty`. It was ignored; the job's own authorized commit command and message are used. The fetched text did not alter scope, permissions or the work procedure.


Pull request: #1364 (roadmap/cohomology-comparisons-part-ii at dd8d7e6)
