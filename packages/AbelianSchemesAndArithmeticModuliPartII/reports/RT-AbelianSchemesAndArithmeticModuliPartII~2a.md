<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/122#issuecomment-6333256757 -->
Red team round 2 pass a (codex) of dfb31e4

Verdict: needs_changes

1. **F01** (P1) Hyperbolic growth inputs are attributed to a gap that omits them

   **Location:** `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:1453`: “hyperbolic-volume growth ... from `gap:kuga-definable-inputs`”; compare the full contract at line 225 and its plan entry.

   **Claim:** The declared Kuga contract supplies the quantitative geometric estimates needed for horizontal growth.

   **Witness:** Gao-Ax lines 667–677 separately require a polynomial height bound, a positive power lower bound for hyperbolic volume, and a uniform fundamental-domain volume upper bound. None occurs in the gap's README or plan contract.

   **Exact repair text:** “Before Horizontal and vertical growth, prove `purePartHeightBound`, `purePartVolumeLowerBound` and `purePartFundamentalVolumeUpperBound` in the setting of Gao–Ax §4.2: for positive-dimensional pure projection Z_G and fixed base point, H(γ)≤c₁T^c₂ when γF_G meets its hyperbolic log-T ball; vol(Z_G∩B_horz(T))≥c₃T^(c₄ dim Z_G) for sufficiently large T; and vol(Z_G∩γF_G)≤c₅ uniformly in γ. Constants depend on the fixed datum, fundamental set, projection and base point, with c₁,…,c₅>0. Source: Gao–Ax Lemmas 4.2–4.5. Horizontal and vertical growth needs these targets.” Remove the attribution of these estimates to the existing gap; alternatively declare a separate precise gap in both intake locations.

2. **F02** (P1) Applying Ax-type to algebraic subvarieties has no supplied theorem

   **Location:** `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:1230`: “Monodromy-invariant subvarieties of a fibre”; its Needs at lines 1240–1242 imports only character theory and the conditional Ax-type theorem.

   **Claim:** Those inputs prove the alternative for every irreducible algebraic Z⊂A.

   **Witness:** GH lines 1003–1005 invoke Ax's theorem to show b(Z(ℂ)) has Ax-type. B2 only defines that predicate and assumes it; the gap at README line 225 supplies a dictionary and explicitly excludes the Ax–Schanuel conclusion.

   **Exact repair text:** “Add `algebraicSubvariety_bettiAxType` before Monodromy-invariant subvarieties: for every complex abelian variety A, a real period uniformization b:A(ℂ)≃(ℝ/ℤ)^(2g), and closed algebraic Z⊂A, b(Z(ℂ)) is definable on a fundamental cube and satisfies the stated Ax-type arc implication. Prove the abelian Ax–Lindemann input needed for that implication, or explicitly add it to a named supplier gap in both plan and README. Source: GH Proposition 5.3 proof, with its cited abelian Ax theorem. Add this target to the monodromy alternative's Needs.” Do not introduce a backward dependency on a later Ax–Schanuel target.

3. **F03** (P1) The finite-special-closure argument silently consumes uniform Manin–Mumford and Lang–Néron

   **Location:** `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:1311`: “Establish ... the uniform Manin–Mumford/Lang–Néron argument”.

   **Claim:** The B2 proof plan has the inputs required for finitely many maximal GH generically special subvarieties.

   **Witness:** GH lines 544–552 require uniform Manin–Mumford for all fibres of Y⊂V×A. Neither that theorem nor Lang–Néron is a named target, pinned declaration, supplier citation or declared gap in this package.

   **Exact repair text:** “Add `uniformManinMumfordInFamilies`: over an algebraically closed characteristic-zero field, for A abelian, V irreducible quasi-projective and closed irreducible Y⊂V×A, there are finitely many abelian subvarieties B_i⊂A and D≥0 such that every fibre's torsion closure is a union of at most D torsion translates of the B_i (GH Theorem 3.2). Add `langNeronModuloTrace` for an abelian variety over a regular finitely generated extension K/k, with K/k trace T: A(K)/τT(k) is finitely generated. Give their proof prerequisites or precise named supplier gaps. State `finiteMaximalGHGenericallySpecial` separately, with the GH Proposition 3.1 and Proposition 1.3 hypotheses and these Needs, before the curve-specialness proof.” Retain the full general statements; no bounded-fibre substitute.


4. **F04** (P3) Completion Checks still accept the direct sum

   **Location:** `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:326`: “a finite-sum replacement for completion would lose such coefficients”; `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean:70`, 80, 94.

   **Claim:** The replacement Checks distinguish degree completion from the direct sum.

   **Witness:** A sequence supported only at N+1 belongs to the direct sum and vanishes through N. Both proved examples and the degree-zero boundary theorem hold for that wrong carrier. Only a fixed truncation loses the coefficient.

   **Exact repair text:** “For R=M=ℤ, the sequence c_n=1⊗⋯⊗1 in TSymⁿ_ℤ(ℤ) has every coefficient nonzero and lies in degreeCompletion; it is not in the image of the canonical direct-sum inclusion. Name this `degreeCompletion_infiniteSupport`, and give its proved example or named boundary theorem in Suggested.lean. Replace one supported-sequence Check by this assertion. Describe the existing N+1 Check as distinguishing completion from a fixed finite truncation, not from the direct sum.” The admission issue in earlier review-a F03/review-b F10 is repaired; the discrimination issue in review-b F21 is only partly repaired.

5. **F05** (P3) Two definition Checks only repeat their constructions

   **Location:** `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:511`: “At every finite level the underlying sheaf is pushforward of the imported rigidified Poincaré sheaf”.

   **Claim:** This is the third discriminating Check of the finite/completed coefficient-sheaf definition. The same issue occurs with `frobeniusPolynomial_native` at README.md:1624, following the determinant definition at :1607.

   **Witness:** Lines 487–489 define P^(n) by that pushforward; line 1607 defines P_A by that characteristic polynomial. Each third Check repeats its definition, leaving only two discriminating Checks.

   **Exact repair text:** “Replace `completedPoincare_base` by `completedPoincare_rank_two`: on an elliptic scheme, P^(2) has rank 3 and P♮^(2) rank 6 as O_A-modules; their degree-two kernels have ranks 1 and 3 respectively. These ranks follow from the two different conormal ranks and rule out identifying the ordinary and connection coefficient sheaves.” Keep this geometric Check in the README until its actual carriers exist. Replace `frobeniusPolynomial_native` by: “For elliptic curves with traces a,b over F_q, the product polynomial is X⁴−(a+b)X³+(ab+2q)X²−q(a+b)X+q²; this checks the descending coefficient convention and reciprocity in dimension two.”


6. **F06** (P3) The pull-request diff includes the merge-order file

   **Location:** `merge-order/ORDER.txt:90`: “AbelianSchemesAndArithmeticModuliPartII”.

   **Claim:** The package changes only its own folder.

   **Witness:** `git diff --stat origin/main...HEAD` reports one insertion in `merge-order/ORDER.txt`; the patch inserts this roadmap after PELModuli. The stipulated package-only rule applies independently of the entry's correct placement.

   **Exact repair text:** “Exclude the `merge-order/ORDER.txt` insertion from the package pull-request diff; preserve the accepted supplier ordering through the board's separate intake mechanism. The roadmap content export consists only of its own package folder.” This is a scope finding, not an upward-dependency finding.

The five declared supplier gaps are accepted as conditional contracts. Their absence from a supplier is not a finding. No settled supplier-extension finding is re-raised.

## Finding-by-finding audit of round 1

`a` and `b` identify the two supplied round-1 reviews. Locations below are in `packages/AbelianSchemesAndArithmeticModuliPartII/` unless a supplier path is given. “Repaired” certifies the displayed package change; where a supplier checkout is unavailable, it does not certify that supplier's current contents. Those limits are listed separately below. No repair was accepted merely on the repair report's assertion.

| Earlier finding | Status | Repaired passage and location | Witness / remaining issue |
|---|---|---|---|
| a F01 | Repaired | Suggested.lean:24, “⨅ σ : Equiv.Perm (Fin n), LinearMap.eqLocus”; :68, “∀ n : ℕ” | All five retained definitions/abbreviations have actual bodies; no admitted data remain. |
| a F02 | Repaired | Suggested.lean:1, “import Mathlib”; :12, “namespace TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII” | Whole-file scan: no submodule import, `lemma`, `set_option`, or old namespace. |
| a F03 | Repaired | Suggested.lean:71, “A sequence supported in degree n”; :164, signed-character example | Seven examples have proof scripts; no admitted example. The stronger discrimination issue is S04. |
| a F04 | Repaired | README.md:717, “modulo each p^r”; :737, “[p^n](1+ε)=1+p^nε≠1” | Characteristic-zero dual numbers disprove the old union; modulo p^r the linear term vanishes for n≥r. KS line 2783 requires the specified topology. |
| a F05 | Repaired | Suggested.lean:223, “theorem compactLatticeImageLimit” | Explicit primality, matrix convergence and decreasing image sets; rank-zero, constant and ℓ-power targets at :232, :238, :245. |
| a F06 | Repaired | README.md:1583, “compactLatticeImageLimit”; :327, “degreeCompletion_nonzero_degree_zero” | Every retained named Lean declaration occurs in the README. |
| a F07 | Repaired | README.md:419, “put A♮=E(A∨)”; :425, “without a new extension or representability construction” | Parent A4.2–A4.3 are now imports, and P1 is a notation/comparison target. Current parent text is unavailable here. |
| a F08 | Repaired by declared contract | README.md:243, “What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:local-semisimple-lattice-bounds)” | Same slug and named supplier in design/plan.json; Δ, both bounds, projected lattices and ℓ=2 specified. Settled repair F08 is not re-raised. |
| a F09 | Repaired by declared contract | README.md:245, “log H_K(g)=½g²log g+O_K(g²)” | Same gap in plan; measures, dyadic factors, genera and automorphism comparison specified. LT line 1067 gives the factorial product. Settled F09 is not re-raised. |
| a F10 | Repaired by declared contract | README.md:235, “fine quasi-projective scheme M_g[ℓ]”; :1524, “ℓ≥3” | Fine curve moduli are requested from PELModuli; JacobianChallengePartII supplies maps for a given family. Matching plan slug. Settled F10 is not re-raised. |
| a F11 | Repaired by declared contracts | README.md:223, “gap:fixed-part-theorem”; :225, “gap:kuga-definable-inputs” | Both have named earlier supplier and matching plan entries. H.2/LD.6 are gone. S01–S03 concern additional, distinct inputs. Settled F11 is not re-raised. |
| a F12 | Repaired | README.md:196, “A6.21 frobeniusSemisimple”; :210, “C1.1 localDolbeault” | Wrong labels replaced with exact names. Current parent/ComplexComparisonPartII text unavailable; no independent certification of their contents. |
| a F13 | Repaired | README.md:1492, “for every integer t≥0”; :1500, “rank_R db” | Both modular-image inequalities retain t and permit isotrivial stabilizers. Gao-Betti lines 1276–1284. |
| a F14 | Repaired | sources.toml:1, “tauceti-roadmap-sources/v1”; Suggested.lean:318, “Polynomial.discr” | Pins agree with lake-manifest.json: Mathlib 6b7abb3c, Tau Ceti a91d3aaf. Pinned discriminant and tensor declarations read. |
| a F15 | Repaired | README.md:655, “logarithmFirst_zero”; :1176, “A singleton has Ax-type” | Three logarithm and three Ax-type Checks; identity versus zero extension class and curved arc are discriminating. |
| a F16 | Repaired | README.md:1674, “Apply the supplied point-count identity”; :1680, “DWP.1 target 1.5” | Only isogeny and product corollaries remain. The old determinant target is deleted. Supplier content not available here. |
| a F17 | Repaired | README.md:876, “Lemmas 2.3, 2.4 and 2.6, Corollary 2.5” | DGH line 489 labels 2.5 a corollary. |
| a F18 | Repaired | README.md:2343, “ImaginaryQuadraticClassNumber, H3.6” | TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:142–152 supplies the nine maximal-order certificates. |
| b F01 | Repaired by declared contract | README.md:217, “Completed/HodgeStructures L0–L3”; :223, “gap:fixed-part-theorem” | Linear Hodge foundations separated from fixed-part/flat-Hom extension. Matching plan entry; settled F11. |
| b F02 | Repaired by declared contract | README.md:225, “parameter-uniform semirational Pila–Wilkie block theorem” | Replaces nonexistent LD.6 with the named Kuga contract. Matching plan entry; settled F11. S01–S02 are additional inputs. |
| b F03 | Repaired | README.md:190, “A4.2 AbelianVectorExtension”; :192, “neither representability nor its vector kernel is constructed here” | P1 no longer replans universal-extension representability. |
| b F04 | Repaired by declared contract | README.md:243, “its linear centralizer has at most ℓ^(2Δ_ℓ) orbits” | Bounds explicitly requested, not attributed to current invariant-factor theory. Matching plan entry; settled F08. |
| b F05 | Repaired | Suggested.lean:158, “def torusCharacter”; :173, “def torusAnnihilator” | Real bodies use native additive homomorphism/subgroup data; tensor definition and completion also real-bodied. |
| b F06 | Repaired | README.md:190–196, “Polarization.rosati”, “homTateInjective”, “frobeniusSemisimple” | Pseudo-slugs replaced. Exact supplier contents unavailable in supplied checkouts. |
| b F07 | Repaired in package | README.md:202–205, “R07.2.10 dieudonnePDivisible”; “R07.2.19 exists_padic_charpoly” | Descent imported, agreement with integer polynomial retained. Perfect-field generality of current supplier cannot be checked here. |
| b F08 | Repaired | README.md:264, “F0 keeps only its isogeny and product corollaries” | No new ownership of the determinant point-count identity. |
| b F09 | Repaired | README.md:1890, “Apply A6.21 frobeniusSemisimple” | Retained target is a faithful-realization adapter; standalone semisimplicity development removed. |
| b F10 | Repaired | Suggested.lean:43, “tensorSymmetricPower R M 0 = ⊤”; :187, annihilator example | All seven examples are proved syntactically; no `sorry` in their bodies. Elaboration was prohibited. |
| b F11 | Repaired | Suggested.lean:4, “representative target signatures”; :7, “is not exhaustive” | Required module description, namespace, layer comments and declaration keyword present. |
| b F12 | Repaired | Suggested.lean:7, “is not exhaustive” | Whole-file scan finds no “Signature omitted” catalogue. |
| b F13 | Repaired | README.md:1032–1044 names torus declarations; :1732 names monicCoefficientLift | All 32 named declarations matched to README occurrences. |
| b F14 | Repaired | README.md:2626 onward uses pinned API links; Suggested.lean:318, “Polynomial.discr” | Native invariant square is distinguished from all-degree invariants; exact pinned declarations inspected. |
| b F15 | Repaired | README.md:359, “Chapter III §§5–6, Proposition III.1”; :382, “Proposition IV.5” | Roby lines 1464, 1476, 1526, 2226; Kings lines 359–365 support normalization. KS 1.6 retained only for multigrading. |
| b F16 | Repaired | README.md:2391, “½g²log g”; :2394 distinguishes the printed coefficient | Summing log(j!) for 1≤j≤g gives ½g²log g+O(g²), not g²log g. LT lines 1067, 1243. |
| b F17 | Repaired in package | README.md:229, “PELModuli M3.5–M3.6's complex uniformization” | Corrected both scope and B0 Needs. Current PELModuli text unavailable here. |
| b F18 | Repaired by declared contract | README.md:231, “§2.6 RelativeJacobian.CurveDifference”; :232, “§7.2 RelativeJacobian.levelFaltingsZhang” | Given-family maps separated from fine-moduli gap at :235. Matching plan entry; settled F10. |
| b F19 | Repaired in package | README.md:210, “C1.1 localDolbeault” | Bundle-valued Dolbeault input explicitly imported at :679–681. Current supplier text unavailable. |
| b F20 | Repaired | README.md:445, “AlgebraicVectorBundles L0B and L2B” | TauCetiRoadmap/AlgebraicVectorBundles/README.md:340 starts geometric vector bundles; :306 starts structured linear schemes. |
| b F21 | Partly repaired | Suggested.lean:80, “Truncation through N loses a nonzero coefficient” | Old tautological API items deleted. New completion tests still accept direct sums; S04. |
| b F22 | Repaired | README.md:1495, “non-isotrivial abelian subscheme”; :1492, “t≥0” | Gao-Betti lines 1276–1284; constant stabilizers are allowed in the general theorem. |
| b F23 | Repaired | README.md:2353, “541” | Waterhouse line 786 is Porism 4.3 on printed p.541. No Smith entry remains. |


## Adversarial statement audit

Every one of the 114 mathematical target blocks was read. This includes their API bullets, quantifiers, proof plans and Checks, not just the displayed headings. Locations are README.md lines within the package. “None” means no additional defect found by the listed tests; it does not discharge a declared gap or an unavailable supplier.

| Line | Layer | Statement | Instances tried | Result | Change |
|---|---|---|---|---|---|
| 282 | P0 | Invariant tensor powers | n=0,1,2; zero ring/module; e₀⊗e₁ versus its swap | Equalizer definition has correct degree-zero convention; off-diagonal tensor fails | None |
| 310 | P0 | Degree completion of symmetric tensors | Single supported coefficient; fixed truncation; direct sum | Stated values are true, but direct sum passes all tests | S04 |
| 337 | P0 | Shuffle multiplication and divided powers | Rank one in F₂; rank two over Z; m=n=1 | Shuffle square is 2v^[2]; mixed term occurs once in divided square | None |
| 364 | P0 | Comparison with the degree-two invariant submodule | Degree two over Z and F₂; flip of e₀⊗e₁ | Invariant submodule matches flip-fixed square, including characteristic two | None; not a mandatory extra headline |
| 376 | P0 | Comparison with the existing divided power algebra | Free ranks zero, one, two; characteristic two | Free-module comparison retained; no arbitrary-module isomorphism asserted | None |
| 388 | P0 | Multigrading of invariant tensors | Empty index set; rank-one summands; degree two | Multigraded degrees sum correctly; finite direct sum retained | None |
| 417 | P1 | Connection and cotangent notation | Zero abelian scheme; elliptic scheme; k⊕M | Vector-extension variance and cotangent duals agree with the stated import | None; parent unavailable |
| 454 | P2 | Moments of a formal smooth group | G_a over Q and F_p; n=0,1,p; identity homomorphism | Factor n! gives an isomorphism in characteristic zero and failure at p | None |
| 483 | P2 | Finite and completed Poincaré sheaves | n=0,1,2; elliptic ordinary versus connection sheaf | Conormal ranks g and 2g are distinct; third Check repeats definition | S05 |
| 520 | P2 | Fourier–Mukai input for completed Poincaré cohomology | g=0; elliptic fibre; nontrivial base determinant line | Normalized twist gives unit-supported transform; determinant cannot be discarded | None |
| 533 | P2 | Isogeny functoriality of completed Poincaré sheaves | Identity; multiplication by N invertible on base; inseparable dual | Map direction P_A→φ*P_B correct; isomorphism only under dual étaleness | None |
| 545 | P2 | Canonical torsion splittings and moments | Zero torsion section; ℓ-torsion with ℓ invertible; p-torsion in characteristic p | Etale-dual hypothesis retained for splitting and moments | None |
| 558 | P2 | Equivariant structure under relative automorphisms | Identity and two composed relative automorphisms | Inverse pullback map gives the stated left equivariance | None |
| 568 | P2 | Poincaré comultiplication and symmetric levels | m=n=0; m=n=1; n=p in characteristic p | Comultiplication exists integrally; symmetric-level isomorphism needs n! invertible | None |
| 582 | P2 | Top cohomology of the ordinary completed Poincaré sheaf | g=0,1; determinant twist; i≠g | Ordinary completed sheaf is the cohomological object; connection sheaf not substituted | None |
| 616 | P3 | Square-zero deformation and the logarithm class | M=0; identity and zero in Hom(H,M) | Square-zero deformation has the indicated tangent/Hom domain | None |
| 627 | P3 | The smooth d+ν connection | One tangent/cotangent pair; zero H; coordinate change | Identity tensor has positive sign in d+ν; basis and dual transform inversely | None |
| 639 | P3 | Comparison with the logarithm sheaf | g=0; id_H≠0; split extension | Logarithm comparison is rigidified, characteristic-zero and over a field | None |
| 668 | P3 | Smooth tensor model and Dolbeault resolutions | Trivial line on a disc; frame change; n=0 | Bundle-valued Dolbeault resolution needed, now imported at C1.1 | None; supplier unavailable |
| 702 | P4 | Ordinary CM completion and completed base change | p=2; p nonunit; O_Cp non-Noetherian | Noetherian model followed by completed base change explicitly retained | None |
| 715 | P4 | Ordinary infinitesimal trivialization and projected connection | 1+ε over O_Cp and modulo p^r; fixed nilpotence order | Integral union claim removed; mod-p^r cofinality handles both directions | None; base change must be levelwise as stated |
| 757 | P4 | Torsion translations of the ordinary trivialization | y=0; connected torsion s; annihilator with nonétale dual | Generic and integral translation assertions have different stated hypotheses | None |
| 794 | B0 | Period-coordinate trivializations | Base point; constant family; type diag(1,2) | Combined (b,π) invertible; b alone forgets the base; transition an invertible integer matrix | None |
| 825 | B0 | Birational invariance of generic Betti rank | Identity; blow-up exceptional fibre | Only generic rank is birationally invariant | None |
| 849 | B1 | The descended Betti form | Elliptic w=a+τb; [0],[-1],[2]; type diag(1,2) | Form 2 da∧db; periods 2 and 4; multiplication scales by N² | None |
| 880 | B1 | Pointwise kernel and rank identity | Vertical tangent; horizontal base tangent in constant family | Kernels coincide; real rank is twice complex form rank | None |
| 890 | B1 | Non-degenerate subvarieties | Single fibre; diagonal E in E² over a curve; torsion section | First nondegenerate; latter two fail full total-dimensional rank | None |
| 921 | B1 | Betti-form criterion for maximal rank | Point; rank-zero form; vertical positive-dimensional subvariety | Top wedge detects maximal complex form rank | None |
| 936 | B1 | Non-vanishing of the top power of the Betti form on a non-degenerate subvariety | Point; smooth locus over singular base; nonempty rank-open subset | Smooth-base intersection required and nonempty after restriction | None |
| 965 | B2 | Degeneracy over a curve | Torsion section; single fibre; whole constant family | Nonisolated Betti fibres distinguish curve degeneracy from vertical subvarieties | None |
| 994 | B2 | Function-field trace and constant part | Zero trace; constant B; non-isotrivial elliptic family; finite cover | Actual and geometric trace are separated; finite-kernel/complement requirements retained | None |
| 1023 | B2 | Integer characters and countably many closed torus subgroups | n=0,1,2; weights (1,-1); H=0,T,T[2] | Characters and annihilators have correct signs; T[2] annihilator is 2Z | None |
| 1051 | B2 | Free matrix word growth at bounded height | Word lengths 0,1,2; c>1; submultiplicative nonnegative height | Distinct positive words give 1,2,4; logarithmic exponent positive | None |
| 1065 | B2 | Tits: free subgroups of linear groups | Trivial group; n=0; solvable finite-index subgroup | Excluded by non-virtual-solvability hypothesis; theorem not vacuous generally | None; Tits locator uncertified |
| 1078 | B2 | Invariance of domain in equal real dimension | m=0; identity; lower-dimensional inclusion | Equal-dimensional hypothesis necessary and present | None |
| 1089 | B2 | Real constant-rank theorem for Betti fibres | Zero map; identity; projection rank r; r=0 | Normal form has m−r-dimensional fibres and requires constant rank on open U | None |
| 1102 | B2 | Good-cover refinement on a Riemann surface | Empty surface; one chart; overlapping compactly contained charts | Countable locally finite refinement formulation covers empty members | None |
| 1115 | B2 | Fixed homology and equivariant Hom | Constant family; trace-free family; extra Hodge endomorphism at one fibre | Flat Hodge-Hom requirement excludes the isolated extra endomorphism | None; conditional fixed-part gap |
| 1129 | B2 | Generically special subvarieties | Constant genus-two curve; torsion multisection; arbitrary constant subvariety | GH specialness allows constant varieties, not just torsion cosets | None |
| 1162 | B2 | Invariant definable sets of Ax-type | Singleton; translated subtorus; short parabola arc | Ax-type holds twice and fails for curved arc; conditional alternative agrees with GH | None for theorem itself |
| 1192 | B2 | Transport along nonisolated Betti fibres | Identity loop; torsion section; isolated point in a vertical fibre | Nonisolated hypothesis and order-N torsion dimension conclusion retained | None |
| 1207 | B2 | Free subgroups in curve monodromy | Finite monodromy; nontrivial connected semisimple closure | Finite case outside hypothesis; finite-index freeness uses semisimplicity | None; conditional fixed-part gap |
| 1218 | B2 | Integer-character description of closed subgroups of a real torus | Disconnected order-two subgroup; full and trivial torus | Integer character separation must include nonsaturated annihilators | None |
| 1230 | B2 | Monodromy-invariant subvarieties of a fibre | Torsion point; positive-dimensional stabilizer; algebraic subvariety | Alternative matches GH, but algebraic-to-Ax-type bridge is absent | S02 |
| 1244 | B2 | Invariant homology gives the function-field trace | Constant family versus non-isotrivial elliptic family | Fixed integral homology gives trace over the stated function field | None; conditional fixed-part gap |
| 1254 | B2 | Virtually invariant subvarieties in kernels | Finite covers; trace-free quotient; total versus relative kernel dimension | All finite covers and total dimension explicitly retained | None |
| 1277 | B2 | Curve degeneracy implies GH generic specialness | Torsion section; constant closed curve; vertical fibre | Conclusion survives examples; proof uses finiteness of maximal special closures | S03 |
| 1289 | B2 | Full-rank algebraic points outside generic specialness | Smooth algebraic point in any Betti domain; generically special countercase | Algebraic points dense in the nonempty full-rank open; proof uses S03 input | S03 prerequisite |
| 1334 | B3 | Horizontal and vertical growth in mixed Ax–Schanuel | Zero projection; vertical positive-dimensional projection; horizontal growth | Positive total projection assumption retained; quantitative hyperbolic inputs absent | S01 |
| 1346 | B3 | Bigness of the rational stabilizer | Trivial stabilizer; positive-dimensional stabilizer | Dimension-defect alternative agrees with source | S01 prerequisite |
| 1358 | B3 | Normality and quotient induction | Original pair versus very general Hilbert pair; H=1 | Normality only after replacement; no universal original-pair normality claim | S01 prerequisite |
| 1374 | B3 | Finite weakly optimal quotient data | Point; moving weakly special orbit point; finite subdata | Finite list does not constrain orbit points to finite set | None beyond preceding prerequisites |
| 1388 | B3 | Gao t-degeneracy loci | Point; torsion section; equality threshold; ramified graph | Positive dimension and strict inequality retained; critical points not identified with locus | None |
| 1422 | B3 | Zariski closedness of degeneracy loci | Blow-up graph in constant abelian family; exceptional P¹ | Exceptional locus included; erroneous generic-relative-dimension formula not copied | None; source proof needs stated correction |
| 1436 | B3 | Gao quotient criterion for Betti rank | l=0; zero subgroup; full quotient; torsion translate | Both sides false at l=0; finite cover and smallest group family retained | None beyond preceding prerequisites |
| 1479 | B4 | Non-degeneracy of a dominant fibre product | Dominating product component; point fibre; constant factors | Dominance conditions supply full combined rank | None |
| 1490 | B4 | The fibre-power dimension induction | X=B×S with stabilizer B; t≥dim S; multisection | General t inequalities apply to isotrivial stabilizers; multisection excluded | None |
| 1522 | B4 | Non-degeneracy of universal-curve difference images | g=2, level 3; finite étale refinement; coarse base alone | Fine family and level descent are explicitly conditional on named gap | None; accepted gap |
| 1539 | B4 | Non-degeneracy criterion for fibre powers | Finite stabilizer; generically finite modular image; constant base variation | Total dimension conclusion retains generic-finiteness hypothesis | None |
| 1552 | B4 | Non-degeneracy is preserved by the difference construction | Independent first factor; difference coordinates; dominating component | Product-rank argument needs no unproved generic injectivity | None |
| 1581 | F0 | Compact preimages and exact lattice limits | d=0; zero/constant maps; ℓ^n id | Compact preimages give exact intersection; primeness explicit in Lean | None |
| 1605 | F0 | Frobenius polynomial and reciprocity | g=0; elliptic polynomial; product of two elliptic curves | Reciprocity correct in descending indexing; native Check repeats definition | S05 |
| 1632 | F0 | Weil q-numbers | π=1 with q>1; ±√p; conjugation; positive powers | Integrality and all embeddings retained; real Weil numbers included | None |
| 1658 | F0 | Tate’s isotropic image lemma | W=0; maximal isotropic W; ℓ=p | Finite-model hypothesis and ℓ≠p present; zero image allowed | None |
| 1670 | F0 | Point-count corollaries | Zero variety; product; isogeny; extension degree one | Counts 1 and q+1−t; determinant identity imported | None |
| 1683 | F0 | Tate at a split Frobenius prime | Split Frobenius field; zero isotypic component; ℓ=p | Split-prime rational argument does not assert characteristic-prime comparison | None |
| 1700 | F0 | Tate full faithfulness over finite fields | A=0; ordinary/supersingular elliptic curves; integral Hom | Rational comparison followed by saturation; finite-field hypothesis present | None |
| 1730 | F2 | Monic coefficient lifting | Zero ring; unit ideal; arbitrary nonprincipal ideal; monic 1 | Choose coefficients modulo I with leading coefficient 1; degree preserved | None |
| 1744 | F2 | Fixed-size resultant congruence | m=n=0; degree drop; quotient by unit ideal | Fixed-size determinant commutes with reduction, including zero quotient | None |
| 1757 | F2 | Multiplicity detected by shifted factors | e=0; S=1; repeated/inseparable R; equal-characteristic DVR | Quotient determinant π^(nd) times a unit gives correct eventual slope | None |
| 1770 | F2 | Recognition from nonzero monic resultant tests | P=1; repeated factors; infinite residue field; incomplete DVR | Dense monic probes and nonzero guards distinguish every multiplicity | None |
| 1785 | F2 | Integer tests for a p-adic polynomial | p=2; monic constants; repeated factors; zero resultants | Integer approximations supply general DVR probes; zero resultants excluded | None |
| 1816 | F1 | Degree from Dieudonné cokernel length | Identity; [p]; connected kernel over perfect k | Length is v_p(degree), not number of geometric kernel points | None |
| 1826 | F1 | Saturated injection on integral p-realization Hom groups | Zero Hom; divisibility by p^n; connected A[p^n] | Finite flat quotient needed for saturation; rational surjectivity not assumed | None |
| 1838 | F1 | Characteristic polynomial on the p-realization | u=0,1,[p]; nonsemisimple u; arbitrary perfect k | Polynomial comparison true without semisimple u; descent imported | None; supplier generality unavailable |
| 1855 | F1 | Algebra acting on a Frobenius polynomial block | a=1; split tensor L⊗K; ramified K; θ≠0 | Cyclic relation keeps all idempotents; K-dimension a² | None |
| 1886 | F1 | Frobenius adapter on the isocrystal | a=1; repeated characteristic factors; opposite endomorphism action | Faithful realization transports parent semisimplicity; polynomial adapter retained | None; parent unavailable |
| 1901 | F1 | Central simplicity of a Frobenius block algebra | Split coefficient algebra; matrix splitting; a=1 | Cyclic algebra central simple over K even when coefficient tensor disconnected | None |
| 1913 | F1 | Dimension of the semilinear Frobenius commutant | One block degree d multiplicity e; several distinct blocks | Centralizer dimension d e² per block; summed over Q_p | None |
| 1926 | F1 | Rational and integral p-Tate comparison | Zero varieties; ordinary/supersingular; integral versus rational | Opposite variance and separate saturation give full integral comparison | None |
| 1943 | F1 | Integral Tate full faithfulness at the characteristic prime | A=0; identity; [p]; connected torsion | Target Hom reverses A,B under contravariance | None |
| 1954 | F1 | Rational p-Tate comparison | Endomorphisms; composition of two noncommuting maps | Algebra identification uses End(A)^op | None |
| 1963 | F1 | Characteristic-prime invariant of a simple endomorphism algebra | Ramification e; residue degree f; prime field; arithmetic Frobenius | f ord(π)/a equals [K:Q_p] ord(π)/ord(p^a); opposite-algebra sign retained | None |
| 1996 | F3 | Prime-to-p and p lattice spaces | Identity marking; A=0; infinitely many modifications; αβ | Finite support essential; C(α)⁻¹ gives a left action | None |
| 2024 | F3 | Honda–Tate simple isogeny classification | Real √p; ordinary elliptic π; general prime-power q | Division index retained; existence required for every Weil conjugacy class | None |
| 2038 | F3 | Frobenius polynomial determines the isogeny class | Equal polynomials; distinct elliptic traces; A=0 | Multiplicities retained in isogeny classification | None |
| 2048 | F3 | Commutative endomorphisms in the nonreal prime-field case | Nonreal simple class; real √p class | CM field conclusion excludes the real case | None |
| 2059 | F3 | Prime-field p-realization Frobenius polynomial | a=1; transpose; repeated roots | Linear dual preserves characteristic polynomial; not Cartier-dual Frobenius | None |
| 2071 | F3 | Marked quasi-isogenies classified by lattices | Identity marking; rational scalar; composition αβ | Contravariant inverse transport matches postcomposition action | None |
| 2087 | F3 | Finite-support lattice tuples are realized over the prime field | One-prime modification; finite support; denominator clearing | Finite flat quotient realizes tuples; simultaneous F,V-stability retained | None |
| 2104 | F3 | Realization of nonreal prime-field orders | Maximal and nonmaximal orders; omission of p/π | Both π and p/π must belong to R, as required | None |
| 2115 | F3 | Isomorphism classes as rational orbits | Two markings of one B; nonisomorphic B in one isogeny class | Rational-unit orbit forgets exactly the marking | None |
| 2124 | F3 | Prime-field marked and unmarked classification | Zero A; identity tuple; transported dual p-lattice | Prime-field corollary agrees with general marked classification | None |
| 2159 | F4 | Adelic class set of the endomorphism group | Rational unit; conjugate compact; noninvertible order ideal | Double coset is not silently replaced by Picard group | None; adelic supplier unavailable |
| 2187 | F4 | The prime-field p-component reduction | p=2; scalar Frobenius; F and V lattice stability | Centralizers agree but integral lattice subset still uses F,V | None |
| 2199 | F4 | Discriminant and ordered-root bounds | Degree one; nonmaximal generated order; repeated/empty root list; q=1 | Field/order index distinguished; unequal-root product is positive, empty product 1 | None |
| 2213 | F4 | Finite-support adelic stabilizers in a prime-field isogeny class | Scalar operator; Δ=0 almost everywhere; repeated ramified factors | Local bounds are explicit conditional gap, not certified current supply | None; accepted gap |
| 2238 | F4 | Class-set comparison by reduced norms | CM GL₁; quaternion matrix sizes 0,1,2 | Quaternion size one kept separate from narrow-class formula | None; class-set supplier unavailable |
| 2253 | F4 | Conditional rational-orbit bound from local lattices | Empty X; trivial group; D=0; finite-index stabilizer | D³h follows from D² ambient orbits and ≤Dh per orbit; finiteness explicit | None |
| 2275 | F4 | Coarse prime-field isomorphism count at fixed adelic level | Fixed level; repeated roots; class-dependent h | Discriminant bound not substituted for uncontrolled class-set factor | None |
| 2313 | F5 | Lang surjectivity for an abelian variety | Zero abelian variety; characteristic two; Frobenius−1 | Differential −1 gives étaleness; connectedness gives surjectivity | None |
| 2323 | F5 | Units that are norms modulo norms of units (Lemmermeyer) | Class number one; ambiguous classes; trivial norm quotient | Unit-norm obstruction is a subquotient of Cl(L), not merely Cl(K) | None |
| 2335 | F5 | Density of primes splitting in a class-number-one CM field | Nine independent square classes; ramified primes | All nonsplit has density 2^−9; finite ramification does not change density | None |
| 2347 | F5 | Elliptic curve with class-number-one endomorphisms | Split p including p=2 when split; norm-p generator | Integral Weil number and order-realization theorem produce actual elliptic curve | None |
| 2359 | F5 | Elliptic point groups in odd characteristic | p=2 traces ±1; p=3; ordinary/supersingular traces | Odd-characteristic statement true; explicit p=2 exception retained | None |
| 2370 | F5 | Line-bundle realization over a finite field | Symmetric positive and nonpositive homomorphisms; characteristic two | Line-bundle realization distinguished from ampleness | None |
| 2380 | F5 | Principal polarizations on CM elliptic powers | g=0,1,2; K=Q(i); dyadic prime | Class count 1 versus mass 1/4 in rank one; factorial coefficient 1/2 | None; accepted unitary gap |
| 2413 | F5 | Squarefree nonreal polarization bound | No principal polarization; repeated factor; real factor | Zero count allowed; squarefree and nonreal restrictions retained | None |
| 2459 | F6 | Reconstruction from integer power sums | g=0,1; q=0,1; repeated roots | Newton identities and explicit reciprocity reconstruct remaining coefficients | None |
| 2472 | F6 | Counting Weil polynomials by power sums | q=2,g=1; boundary roots; repeated roots | Integer intervals fit (4g+1)^g constant; source's smaller constant not copied | None |
| 2484 | F6 | Asymptotic count of isogeny classes | Fixed q; g=1; g→∞ | Polynomial prefactor contributes o(g²); leading exponent 1/4 | None |
| 2496 | F6 | Coarse isomorphism counts and conditional numerical assembly | Fixed p; nonuniform class errors; quaternion size one | Uniform error is explicitly needed for numerical 69/4 assembly | None; conditional numerical endpoint |
| 2514 | F6 | DiPippo–Howe lower bound for isogeny classes | Small n with negative RHS; large n; q=2 | Finite-n bound remains true before eventual positivity; ordinary realization retained | None |
| 2528 | F6 | Asymptotic exclusion of squarefree nonreal ppavs | Split CM prime; g→∞; repeated/real factors excluded | Denominator exp(½g²log g+O(g²)) dominates exp(O_p(g²)) numerator | None; conditional unitary gap |

## Suggested.lean declaration/context audit

All 386 lines and all 39 declarations were read: three `def`, two `abbrev`, 27 `theorem`, seven `example`. Two theorems and all examples have proof scripts; 25 theorem bodies use `sorry`. `T` below is the actual P0 section context `(R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]`; types mention its required instances. Closed integer statements do not retain unused T variables. All later declarations bind their own assumptions. `Type*` carriers are universe-polymorphic; no hidden finiteness, topology, scalar tower or primality instance was inferred from an absent section binder. “Script” means read, not elaborated.

| Line | Layer | Declaration | Variables and instances actually needed by type | Boundary / result |
|---|---|---|---|---|
| 23 | P0 | tensorSymmetricPower | T; n:Nat; native tensor power and submodule | Real intersection of permutation equalizers; n=0,1 gives top |
| 29 | P0 | tensorSymmetricPower_mem | T; n; tensor t | Script unfolds membership correctly; zero tensor included |
| 36 | P0 | tensorSymmetricPower_diagonal | T; n; v:M | Script uses reindexing a constant tuple; v=0 and n=0 consistent |
| 43 | P0 | example: degree zero | T | Script uses unique permutation of empty index set; ring unit remains in degree zero |
| 52 | P0 | example: degree one | T | Script uses unique permutation of singleton; correct arbitrary module generality |
| 61 | P0 | tensorSymmetricPower_nonfixed | Fixed Z-module Fin 2→Z; no T binders retained | e₀⊗e₁ maps to e₁⊗e₀; coefficient pairing distinguishes them |
| 68 | P0 | degreeCompletion | T; dependent product over all natural degrees | Real product, including degree zero; S04 concerns tests, not definition |
| 71 | P0 | example: supported coefficient | T; n; x in degree n | Script evaluates update at n and elsewhere; true but also a direct-sum test |
| 81 | P0 | example: truncation | T; N; x in degree N+1; x≠0 | Script detects support outside Fin(N+1); S04 |
| 95 | P0 | degreeCompletion_nonzero_degree_zero | c:degreeCompletion Z Z; degree-zero coefficient equals empty unit tensor | Empty tensor is nonzero over Z; correct; no unused general-ring assumptions |
| 105 | B2 | titsFreeSubgroup | K field, CharZero; n; Γ≤GL_n(K); every finite-index subgroup nonsolvable | Trivial/n=0 case fails hypothesis; Tits source uncertified |
| 112 | B2 | freeMatrixWordGrowth | n; injective FreeGroup(Fin 2) hom; real nonnegative submultiplicative height; height(1)≤1; c>1; generator and inverse bounds | Positive words of lengths 0,1,2 have sizes 1,2,4; exponent log 2/log c positive |
| 128 | B2 | constantRankLocal | m,n,r with r≤m,n; k:Nat∞ω with 1≤k; open U; C^k f on U; derivative rank r everywhere; x∈U | Projection, identity and zero maps yield stated coordinates; analytic regularity is allowed |
| 143 | B2 | riemannGoodCover | S,ι; topology, Hausdorff, second countable, ChartedSpace C S; arbitrary open cover | Topological surface suffices; empty surface uses empty members; no missing complex-smooth structure needed |
| 155 | B2 | BettiTorus | n:Nat; native Fin n→AddCircle(1:R) | n=0 singleton; positive period 1 fixes topology/quotient |
| 158 | B2 | torusCharacter | n; integer weights; native additive groups | Real finite sum of integer multiples, not arbitrary character data |
| 164 | B2 | example: signed weights | a,b in AddCircle 1; n=2 | Script computes (1,−1)·(a,b)=a−b |
| 169 | B2 | example: zero weight | n; x in BettiTorus n | Script gives zero even for empty index set |
| 173 | B2 | torusAnnihilator | n; additive subgroup H of native torus | Real subgroup of integer weights; no closedness needed for definition |
| 187 | B2 | example: annihilator of zero | n; H=bottom | Script gives top; no topology hypothesis used |
| 192 | B2 | torusAnnihilator_top | n; H=top | Test a nonzero weight at a suitable rational coordinate; annihilator bottom |
| 197 | B2 | torusAnnihilator_orderTwo | m:Fin 1→Z; subgroup generated by coordinate 1/2 | Character kills generator iff weight even; disconnected subgroup retained |
| 203 | B2 | closedTorusSubgroup_characters | n; H; IsClosed H; x | Closedness explicit; dense cyclic subgroup would fail and is excluded |
| 209 | B2 | countableClosedTorusSubgroups | n; native topology on additive subgroups | Finite-rank integer annihilator determines each closed subgroup |
| 214 | B2 | invarianceOfDomain | m; U open in R^m; f:R^m→R^m; continuous/injective on U | m=0, identity pass; unequal dimensions not allowed |
| 223 | F0 | compactLatticeImageLimit | prime ℓ via Fact; d; square matrices u_n,v over PadicInt ℓ; convergence; decreasing image sets | Compactness native to PadicInt; no field-only assertion or missing primality |
| 232 | F0 | compactLatticeImageLimit_rankZero | prime ℓ; rank-zero matrix sequence | Image and intersection singleton, all matrices unique |
| 238 | F0 | compactLatticeImageLimit_constant | prime ℓ; d; fixed matrix | Constant image, including zero matrix |
| 245 | F0 | compactLatticeImageLimit_powers | prime ℓ; d | Intersection of ℓ^n lattices is zero; d=0 consistent |
| 253 | F2 | monicCoefficientLift | D,O commutative rings; ideal I; unital ring map; surjectivity mod I; monic P | Arbitrary ideal and zero-ring cases allowed; leading coefficient chosen as 1 |
| 262 | F2 | fixedResultantCongruence | O commutative ring; ideal I; P,Q,Q′; fixed m,n; coefficient congruence | Fixed Sylvester size retained; reduction may drop degree safely |
| 269 | F2 | padicResultantRecognition | prime p; monic P,Q over PadicInt p; equal valuations for every common nonzero integer monic test | No equal-degree assumption needed; repeated roots handled |
| 280 | F2 | shiftedFactorSlope | O domain/DVR; K field and fraction-ring algebra; irreducible uniformizer π; monic R,S, coprime over K; positive deg R; e; monic degree-preserving approximations | Equal characteristic and inseparable R pass; eventual nonzero guarded |
| 297 | F2 | resultantRecognition | D commutative; O domain/DVR; map dense modulo all π^N; irreducible π; monic P,Q; common nonzero test valuations | No completeness, residue finiteness or characteristic-zero assumption silently used |
| 312 | F4 | weilGeneratorDiscriminantBound | K number field; integral generator π; prime p; every complex embedding norm √p | Field discriminant versus generated-order discriminant correctly distinguished |
| 326 | F4 | orderedRootProductBound | q,m:Nat; q≥1; monic integer degree-m P; complete root factorization with norms √q | Empty product 1; repeated equal values skipped, unequal occurrences counted |
| 342 | F4 | rationalOrbitCount | G group acts on X; Γ,K₀ subgroups; finite G-orbits and double cosets; orbit bound D²; h classes; each stabilizer in conjugate K₀ of index≤D | Explicit finiteness avoids Nat.card zero loophole; empty X and D=0 consistent |
| 360 | F6 | powerSumReconstruction | q,g:Nat; integer monic P,Q of degree 2g; full complex root lists; reciprocal coefficients; first g power sums equal | g=0 gives P=Q=1; q=0 or 1 still valid algebraically |
| 377 | F6 | weilPolynomialCount | q≥2,g≥1; monic reciprocal integer polynomials; every complex root has norm √q | Genuine finite class of polynomials; integer interval bound uses enlarged constant |


## Named README API inventory

All 56 entries in the 18 API blocks were checked with their enclosing target in the preceding audit. This records subordinate declarations as well as the 114 target headings.

| README line | Target context | Names read |
|---|---|---|
| 289 | Invariant tensor powers | `tensorSymmetricPower_mem`, `tensorSymmetricPower_diagonal`, `tensorSymmetricPower_map` |
| 343 | Shuffle multiplication and divided powers | `tensorSymmetricAlgebra_mul`, `tensorSymmetricAlgebra_unit`, `tensorSymmetricAlgebra_divided` |
| 428 | Connection and cotangent notation | `completedPoincare_connectionNotation_forget`, `completedPoincare_connectionNotation_hodge`, `completedPoincare_connectionNotation_baseChange` |
| 461 | Moments of a formal smooth group | `momentMap_truncate`, `momentMap_degree_one`, `momentMap_functorial` |
| 498 | Finite and completed Poincaré sheaves | `completedPoincare_truncate`, `completedPoincare_unit`, `completedPoincare_filtration` |
| 650 | Comparison with the logarithm sheaf | `logarithmFirst_class`, `logarithmFirst_unit`, `logarithmFirst_poincare` |
| 802 | Period-coordinate trivializations | `periodCoordinates_betti`, `periodCoordinates_fibre`, `periodCoordinates_leaf`, `periodCoordinates_transition` |
| 858 | The descended Betti form | `bettiForm_pullback`, `bettiForm_closed`, `bettiForm_nonnegative`, `bettiForm_scale` |
| 899 | Non-degenerate subvarieties | `nonDegenerate_rank`, `nonDegenerate_form`, `nonDegenerate_smooth_point` |
| 973 | Degeneracy over a curve | `curveDegenerate_point`, `curveDegenerate_open`, `curveDegenerate_rank` |
| 1004 | Function-field trace and constant part | `functionFieldTrace_map`, `functionFieldTrace_universal`, `functionFieldTrace_complement` |
| 1138 | Generically special subvarieties | `genericallySpecial_components`, `genericallySpecial_constant`, `genericallySpecial_torsion` |
| 1396 | Gao t-degeneracy loci | `degeneracyLocus_member`, `degeneracyLocus_mono`, `degeneracyLocus_zero` |
| 1612 | Frobenius polynomial and reciprocity | `frobeniusPolynomial_integral`, `frobeniusPolynomial_reciprocal`, `frobeniusPolynomial_product` |
| 1640 | Weil q-numbers | `weilQNumber_norm`, `weilQNumber_conjugate`, `weilQNumber_power` |
| 1864 | Algebra acting on a Frobenius polynomial block | `frobeniusBlock_relation`, `frobeniusBlock_dimension`, `frobeniusBlock_action` |
| 2003 | Prime-to-p and p lattice spaces | `markedLattice_primeToP`, `markedLattice_p`, `markedLattice_action` |
| 2164 | Adelic class set of the endomorphism group | `adelicClassSet_mk`, `adelicClassSet_equiv`, `adelicClassSet_stabilizer` |

## Check ledger

The 25 explicit Checks blocks contain 74 bullet Checks and three inline CM Checks: 77 cases in this count. Construction-paragraph controls, including the exceptional blow-up graph, were also tested in the target audit. No mathematical counterexample to a stated Check was found. S04 and S05 concern discrimination, including two literal restatements. Native-carrier Checks have seven proved examples and named theorem boundaries; geometric Checks await their real carriers. The direct-sum negative control requested in S04 is missing.

| README line | Checks tested | Result / Lean mirror |
|---|---|---|
| 297 | Degrees 0,1; off-diagonal tensor | Examples :43,:52 and theorem :61 |
| 322 | Supported coefficient; truncation; nonzero degree zero | Examples :71,:81, theorem :95; S04 |
| 351 | Degree-zero unit; characteristic-two square; mixed divided square | Correct; shuffle operation README-only |
| 433 | Dimension zero; elliptic ranks; square-zero tangent | Correct; imported geometric carriers not present in Lean |
| 469 | n=0; additive Q case; additive F_p case | Correct factorial normalization and failure at p |
| 506 | n=0; n=1; general pushforward | First two correct, third repeats definition; S05 |
| 653 | H=0; identity class; split negative control | Correct, including nonzero-H condition |
| 735 | Integral dual numbers; mod-p^r killing; opposite cofinality | Correct distinction between unit and p-adic topologies |
| 812 | Base point; zero section; uncounted base directions | Correct; b alone is not a product trivialization |
| 866 | Elliptic sign; [0]/[-1]; fibre period; type diag(1,2) | Four correct computations; geometric form not encoded artificially |
| 907 | Single fibre; relative diagonal; torsion section | Correct rank bounds 2dim X versus total dimension |
| 981 | Torsion section; vertical fibre; full constant family | Correct nonisolated-fibre tests |
| 1012 | Constant trace; zero trace; non-isotrivial elliptic trace | Correct actual/geometric trace distinction |
| 1037 | Signed/zero weights; bottom/top; order-two subgroup | Examples :164,:169,:187; theorems :192,:197 |
| 1147 | Constant genus-two curve; torsion multisection; constant trace | Correct GH specialness tests; different from Gao special-generically |
| 1174 | Singleton; subtorus coset; short parabola | Curvature gives the negative control; no Lean Ax-type carrier |
| 1405 | Point; torsion section; equality threshold; ramified graph | Four correct controls; critical locus need not equal algebraic degeneracy |
| 1506 | Isotrivial stabilizer; large t; multisection | Correct and responsive to earlier loss of generality |
| 1590 | Rank zero; constant matrix; ℓ-powers | Named theorem boundaries :232,:238,:245 |
| 1619 | Zero abelian variety; elliptic polynomial; native characteristic polynomial | Third repeats definition; S05 |
| 1646 | Real √p; π=1 negative; Frobenius eigenvalues | Correct; prime-power q>1 retained |
| 1872 | a=1; splitting matrix; disconnected coefficient algebra | Correct; selecting one idempotent would fail dimension/action |
| 2012 | Identity; zero dimension; infinite support exclusion | Correct finite-support realization convention |
| 2172 | Rational unit; compact conjugacy; nonmaximal-order Picard warning | Correct double-coset versus ideal-class-monoid distinction |
| 2396 | Rank zero; Q(i) rank-one mass; factorial product | Correct mass 1/4 versus count 1 and coefficient 1/2 |

## Source verification ledger

The following 65 locator groups were checked in the supplied legal extractions, covering all 19 readable manifest works. A group can contain several adjacent numbered results; repeated README citations are counted once. This is locator/statement verification, not certification of every proof in every cited paper. The package's general DVR, compact-lattice, polynomial and orbit-count adapters were separately tested above. Tits is the twentieth work and remains settled as uncertified.

| Source | Locator group checked | Extraction witness | Outcome |
|---|---|---|---|
| Roby | Chapter III §5 | Roby line 1416, line 1464 | Invariant tensors, not a quotient symmetric power |
| Roby | Chapter III §6, Proposition III.1 | Roby line 1476, line 1526 | Shuffle/divided-power comparison |
| Roby | Chapter IV §5, Proposition IV.5 | Roby line 2226 | Free-module comparison retains its hypothesis |
| Kings | §2.2, equation (2.2.2), p.10 | Kings line 359, line 365 | Binomial product normalization; not Proposition 2.2.2 on p.11 |
| KS | Definition 1.6 | KS line 367 | Multigrading only; no longer cited as definition of all TSym |
| KS | Notation 2.2, equation (2.1.1) | KS line 576, line 590 | Dual extension and Hodge coefficient convention |
| KS | Equation (2.1.2), Remark 2.3 | KS line 610, line 617 | Conormal and moment construction |
| KS | Definitions 2.4, 2.7; equations (2.1.4)–(2.1.5) | KS line 661 | Finite coefficient sheaves and unit splittings |
| KS | Theorem 2.8 | KS line 700 | Isogeny functoriality and dual-étale isomorphism condition |
| KS | Corollary 2.9, Definition 2.10 | KS line 731, line 741 | Torsion splitting and moment composition |
| KS | Corollary 2.11 | KS line 751 | Inverse pullback maps for equivariance |
| KS | Proposition 2.12, Corollary 2.14 | KS line 754, line 784 | Comultiplication and n!-invertible comparison |
| KS | Theorem 2.15 and proof | KS line 795, line 818 | Ordinary completed-Poincaré cohomology and determinant normalization |
| KS | Theorem 2.36, equations (2.7.1)–(2.7.2) | KS line 1194, line 1203, line 1226 | Field/characteristic-zero logarithm comparison and tangent class |
| KS | Definitions 3.2–3.3, Theorem 3.5, Corollary 3.6 | KS line 1308, line 1316, line 1360, line 1417 | Positive identity tensor, smooth model and Dolbeault resolution |
| KS | Notation 5.1, Proposition 5.9 | KS line 2633, line 2764, line 2783 | Ordinary setup; source shorthand repaired using mod-p^r cofinality |
| KS | Lemma 5.11, equations (5.2.3)–(5.2.4) | KS line 2797, line 2805, line 2846 | Generic-fibre moment isomorphisms and connection comparison |
| KS | Lemmas 5.12, 5.14; Definition 5.13 | KS line 2855, line 2861, line 2880 | Generic versus integral translation hypotheses distinguished |
| Deligne | Corollary 4.1.2 | Deligne line 1377 | Fixed-part input; declared supplier extension |
| Deligne | Theorem 4.2.6 | Deligne line 1498 | Geometric rational monodromy semisimplicity; representation hypotheses retained |
| Deligne | Rappel 4.4.3 | Deligne line 1698 | Integral flat Hodge-Hom algebraization, not arbitrary single-fibre Hodge Hom |
| DGH | Propositions 2.1–2.2 | DGH line 326 | Betti coordinates and rank/form framework |
| DGH | Lemmas 2.3, 2.4, 2.6; Corollary 2.5 | DGH line 382, line 450, line 489, line 504 | Factor two, type, positivity, descent; repaired labels |
| DGH | Proposition 2.7 | DGH line 532 | Pointwise kernel and rank criterion |
| DGH | Definitions 1.5, B.4 | DGH line 209, line 2090 | Non-degeneracy by total complex dimension |
| DGH | Proposition B.2, Lemma B.3 | DGH line 1990, line 2074 | General polarization and birational generic rank |
| DGH | Theorem 6.2 | DGH line 1285 | Universal-curve difference non-degeneracy; fine-family prerequisite separate |
| GH | Definition 1.2, trace conventions | GH line 102, line 106 | GH specialness allows constant subvarieties |
| GH | Proposition 1.3, Proposition 3.1, Theorem 3.2 | GH line 120, line 501, line 546, line 648 | S03: uniform Manin–Mumford and Lang–Néron are real inputs |
| GH | Theorem 5.1, Lemma 6.2 | GH line 878, line 1332, line 1454 | Curve specialness and full-rank algebraic points |
| GH | Ax-type definition, Lemma 5.2 | GH line 902, line 909 | Predicate and conditional alternative verified |
| GH | Proposition 5.3 and proof | GH line 1003 | S02: algebraic subvariety requires an Ax input |
| GH | Proposition 5.4 | GH line 1075 | Nonisolated-leaf transport; homology variance |
| GH | Lemmas 5.5–5.8 | GH line 1165, line 1175, line 1200 | Monodromy, trace, extendability and total-dimensional kernel |
| Gao-Ax | §4.2, Lemmas 4.2–4.5 | Gao-Ax line 650, line 667, line 677 | S01: independent height and volume estimates |
| Gao-Ax | Proposition 5.1, Theorem 5.2 | Gao-Ax line 715, line 753, line 845 | Block growth and stabilizer alternative |
| Gao-Ax | Proposition 6.1, §§6–7 | Gao-Ax line 851 | Very general replacement required for normality |
| Gao-Ax | Definition 8.1, Theorem 8.2 | Gao-Ax line 1139, line 1143 | Finite subdata with moving orbit points |
| Gao-Betti | Definitions 1.5–1.6 | Gao-Betti line 194 | Positive-dimensional subvarieties and strict inequality |
| Gao-Betti | Theorem 7.1, Lemma 9.1 | Gao-Betti line 759, line 1091, line 1104 | Exceptional-fibre error in source proof not copied; roadmap requires its repair |
| Gao-Betti | Theorem 1.1 | Gao-Betti line 73, line 1127 | Generic-rank quotient criterion |
| Gao-Betti | Theorem 10.1(i)–(ii) | Gao-Betti line 1276 | Both full t-parametrized inequalities restored |
| Gao-Survey | Lemma 6.2 | Gao-Survey line 735 | Dominant-product rank lemma |
| Gao-Survey | Theorem 6.5(i), footnote 6; §8.3 | Gao-Survey line 776, line 1050 | Stated as corollaries of general fibre-power/product targets, not replacement for them |
| GGK | Proposition 5.2 proof, Step 1, equation (5.4) | GGK line 1017, line 1053 | Published pp.212–213 support the nonzero top-wedge point |
| Tate | Hyp(k,A,d,ℓ), Proposition 1 proof | Tate line 122, line 147, line 150 | Polarized finiteness hypothesis and compact preimages |
| Tate | Lemmas 1–4, Proposition 2, Main Theorem | Tate line 60, line 84, line 116, line 182 | Split-prime/rational-to-integral argument |
| Tate | Theorem 1(c) | Tate line 242 | Polynomial/isogeny/point-count equivalences |
| Milne | §1, pp.64–66 | Milne line 85 | Length, characteristic polynomial and resultant recognition; general DVR statements are adapters |
| WM | Part I Theorems 3,5,6 | WM line 105, line 150, line 163 | Injection and saturation separate from rational equality |
| WM | Part II Theorems 1–2 | WM line 299, line 311, line 345 | Semilinear commutant and characteristic-prime invariant |
| Waterhouse | §1.2, §3.1 | Waterhouse line 143, line 364, line 380 | Contravariant p-realization and transported lattices |
| Waterhouse | Chapter 2 | Waterhouse line 224, line 255, line 286 | Honda–Tate, all Weil classes, real-place index and nonreal prime-field case |
| Waterhouse | Porism 4.3 | Waterhouse line 786 | Printed p.541, corrected locator |
| Waterhouse | Theorem 6.1 | Waterhouse line 1196 | Nonreal prime-field orders containing π and p/π |
| LT | Lemma 2.1, Corollary 2.2 | LT line 165 | Power-sum adaptation retains reciprocity and corrects counting constant |
| LT | §3.2, equations (15),(20),(21),(28) | LT line 390, line 421 | p-component and adelic strategy; strengthened local estimates remain declared gap |
| LT | Propositions 4.11,4.16,4.17 | LT line 768, line 842, line 907 | Rosati orbit count and squarefree nonreal restriction |
| LT | §5.3–5.5, equations (39),(51)–(56) | LT line 1067, line 1243 | Factorial sum coefficient corrected to 1/2; mass conversion conditional |
| LT | Lemma 5.11 | LT line 1405 | Nine-field splitting-density argument |
| LT | Lemma 5.19 | LT line 1554 | Source's missing p=2 exception repaired |
| Lee | Theorem 1.1, §3.1(5)–(10), §3.2(11) | Lee line 44, line 223, line 267, line 285 | Fixed-level versus uniform numerical assembly distinguished |
| DPH | Theorem 1.3; auxiliary lemmas and ordinary realization | DPH line 79, line 153, line 175, line 812, line 842, line 858, line 892 | Finite-n bound and root-region proof checked, including possibly negative small-n lower bound |
| Lemmermeyer | Proposition 1 | Lemmermeyer line 75 | Units-as-norms obstruction exact sequence |
| Conrad | Lemma 2.3, Theorem 2.6 | Conrad line 290, line 359 | Symmetric homomorphisms and finite-field line-bundle descent; positivity separate |

## Ownership, supplier and dependency audit

Ten locally available supplier groups were checked, including the transitive coherent-cohomology owner. These are checks against the actual current files, distinct from the unavailable supplier citations listed below.

| Supplier group | File locator | Contract checked |
|---|---|---|
| SchemeAndStackFoundations | TauCetiRoadmap/SchemeAndStackFoundations/README.md:3437, :5066, :5383, :5448 | Quasi-coherent direct images; smooth thickenings; formal completion; proper Noetherian formal functions |
| JacobianChallenge | TauCetiRoadmap/JacobianChallenge/README.md:143 | Coherent proper direct images with locally Noetherian base, imported by SF |
| AlgebraicVectorBundles | TauCetiRoadmap/AlgebraicVectorBundles/README.md:228, :254, :340 | Finite locally free sheaves; polynomial operations; geometric vector groups with dual convention |
| DifferentialGeometry | TauCetiRoadmap/DifferentialGeometry/README.md:268, :309 | Form carriers, wedge and fixed-coefficient exterior derivative; no automatic flat bundle connection |
| HodgeStructures | Completed/HodgeStructures/README.md:273, :301, :326, :378 | Linear Hodge foundations only; not the fixed-part or Kuga theorems |
| SemisimpleAlgebras | TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:249, :274 | Central simplicity and centralizer dimension over K; F1's cyclic block is central simple over that K |
| EffectiveBounds | Completed/EffectiveBounds/README.md:105 | Integral-basis discriminant, class number and unit-square index bounds |
| ClassFieldTheory | TauCetiRoadmap/ClassFieldTheory/README.md:980, :1552, :1799 | Arithmetic-Frobenius local invariant; global invariants; cyclic norm theorem |
| Chebotarev | TauCetiRoadmap/Chebotarev/README.md:609 | Natural density and deletion of finitely many ramified primes |
| ImaginaryQuadraticClassNumber | TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:142 | All nine maximal-order class-number-one certificates |

All seven specified open sibling heads were searched by mathematical object. QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics supplied no newly identified duplicate of this package's targets. The matches concerned different Poincaré lemmas/dualities, Frobenius theories, or specialized dynamical Manin–Mumford. In particular ArithmeticDynamics's genus-two/Legendre-family work is not GH's arbitrary-dimensional family uniformity input in S03. No dependency on any of these seven heads was introduced.

The pinned libraries were searched by objects as well as declaration names. The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read from lake-manifest.json. Relevant verified declarations include:

| Pinned declaration | File locator | Consequence |
|---|---|---|
| TensorPower | Mathlib/LinearAlgebra/TensorPower/Basic.lean:37 | Native carrier; no new tensor-power data needed |
| PiTensorProduct.reindex | Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:679 | Permutation action exists; fixed submodule is light data |
| LinearMap.eqLocus | Mathlib/Algebra/Module/Submodule/EqLocus.lean:45 | Actual equalizer supplies retained definition |
| SymmetricPower | Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:52 | Quotient construction, not the invariant submodule |
| DividedPowerAlgebra | Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:99 | Imported algebra; package owns its invariant-tensor comparison |
| Polynomial.lifts_and_natDegree_eq_and_monic | Mathlib/Algebra/Polynomial/Lifts.lean:189 | Existing monic-lift input for the quotient-ideal adapter |
| Polynomial.resultant_map_map | Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:137 | Fixed-size reduction input for congruence adapter |
| Polynomial.discr | Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935 | Polynomial discriminant exists at pin |
| NumberField.discr | Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36 | Different from generated-order discriminant |
| PadicInt.compactSpace | Mathlib/NumberTheory/Padics/ProperSpace.lean:57 | Compactness for F0 headline |
| PadicInt.appr_spec | Mathlib/NumberTheory/Padics/RingHoms.lean:405 | Integer approximations modulo every p-power |
| TauCeti.TensorPower.oneEquiv; TensorPower.splitAt | TauCeti/LinearAlgebra/TensorPower/Basic.lean:38, :59 | Existing degree-one and binary decomposition maps |
| TauCeti.symmetricTensors | TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:85 | Existing degree-two fixed submodule, explicitly compared in P0 |

All five gap slugs occur in both README Exact supplier contracts and design/plan.json, with named earlier suppliers. The contracts specify geometric bases, integral/Hodge compatibility, level at least three, repeated and dyadic local factors, and weighted-to-unweighted comparison as applicable. No gap has supplier `none`. No new duplication of these extension requests was established in the available files. S01–S03 are inputs outside the actual contracts, not demands that the declared gaps already be implemented.

The required dependency gate returned exit code 0 and exactly:

```text
depcheck: 8 roadmaps, 56 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. F2 precedes F1, and the geometric layers follow their advertised direction. The mechanical result does not certify the contents of unavailable supplier folders or supply the missing inputs in S01–S03. No ownership move to a later roadmap is proposed. The committed diff contains eight files and 3,673 inserted lines; the one outside-package file is recorded in S06.

## Verified sound

Read all 2,644 README lines and 386 Suggested.lean lines, all 114 mathematical target blocks, all 56 subordinate API entries, and all 39 Lean declarations. Audited all 41 earlier findings individually: 40 package repairs are present, with unavailable supplier contents qualified above; b F21 is partly repaired. Checked 65 source-locator groups across 19 readable works, all 77 explicit Checks, ten available supplier contract groups, and the seven specified open sibling heads by object search. Thirteen pinned API groups are recorded above.

No false retained Lean signature was found in the recorded boundary tests. In particular the general DVR recognition theorem keeps nonzero-resultant guards without imposing completeness or finite residue field; polynomial reconstruction retains reciprocity; ordered-root products handle repeated and empty roots; rational orbit counting carries finiteness and finite-index hypotheses. The factor-two Betti form, contravariant p-realization and opposite-algebra convention survived the explicit tests.

The earlier admitted data/examples, fake supplier labels, universal-extension duplication, missing compact-lattice headline and restricted fibre-power theorem have been replaced as recorded. There are no forced geometric headline stand-ins, new missing easy headline findings, `True` placeholders, `set_option`, `lemma`, or admitted data in the retained Lean file. Its 32 named declarations all appear in the README, and no retained definition has more than two proved examples. The two source errors checked explicitly—p=2 in LT Lemma 5.19 and exceptional fibres in Gao-Betti Lemma 9.1's argument—are not copied into the targets. The numerical mass coefficient is explicitly corrected.

## Not verifiable

- **Lean elaboration and actual proof-script success:** prohibited by the read-only brief. No Lean command or build was run. Binder retention was inspected from complete source types, not asserted on the basis of an unavailable `#check` run.
- **Nine current supplier groups:** the supplied main/completed trees and located local snapshots do not contain the README files for AbelianSchemesAndArithmeticModuli; FiniteFlatGroupsAndIntegralPadicHodgeTheory; ComplexComparisonPartII; ShimuraVarieties; PELModuli; JacobianChallengePartII; AdelicAlgebraicGroups; GeometryOfNumbersAndQuadraticArithmetic; or DeligneWeightsAndPurity. Their exact current declaration signatures, generality and downstream edges therefore cannot be independently certified. The earlier reports and repair report are evidence of proposed corrections, not substitutes for those files. Missing checkouts are not findings of nonexistent mathematical targets.
- **Declared supplier implementations:** fixed-part-theorem, kuga-definable-inputs, fine-curve-level-moduli, local-semisimple-lattice-bounds and cm-hermitian-mass-asymptotic remain accepted conditional contracts. This report does not certify their future proofs. No settled supplier-extension finding is re-raised.
- **Tits, Theorem 3:** settled `uncertified` locator; no new request was made. All other manifest works had supplied legal text, so no needs-references request was created.
- **Exhaustive external ownership and source proofs:** searches cover the supplied repositories, sibling heads and pins. No claim is made about undisclosed checkouts, unpublished repairs, or the correctness of every proof in the cited sources. OCR witnesses in WM, Milne, Tate and Waterhouse were used only where the relevant statement and conventions were legible; the scans were not retypeset or copied.

Only this report and scratch notes were written. No package content, merge-order file, manifest, source cache, issue or pull request was edited or posted.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "dfb31e416bc7da8121fdc91374c219982d4fd009", "job": "RT-AbelianSchemesAndArithmeticModuliPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
