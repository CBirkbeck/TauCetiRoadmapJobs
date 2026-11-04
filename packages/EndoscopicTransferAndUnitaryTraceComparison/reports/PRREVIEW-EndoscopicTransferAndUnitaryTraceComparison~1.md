# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #999 at 40d60b6)

**Verdict:** needs changes

## R01 (P1) — Classification and weighted stabilization have no owner

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:128`, especially lines 132–146 and 4173. Claim: the classification branches assume the two classification input records, while expressly excluding construction of their contents.

Witness: `kmsw` line 3420 identifies the quasi-split case with Mok's classification; README line 146 explicitly declines to construct the input classification or weighted stabilization. Neither record names an owning supplier or a declared gap.

These are entire prerequisite theories, not ordinary hypotheses on the group or representation: quasi-split local/global classification, weighted fundamental lemmas, weighted twisted stabilization, and the separate symplectic classification and functorial transfers. Making their truth a hypothesis is logically honest, but leaves the promised general library without a construction of these inputs. The simple trace formula does not fill this gap: it omits precisely the proper-Levi weighted terms required here.

Repair: assign each prerequisite to explicit targets before its consumers, here or in a named earlier supplier with an exact declared gap. Keep separate ownership for the unitary and symplectic branches. Test the repaired dependency chain on the quasi-split inner twist and a proper Levi: the first must reach the underlying quasi-split classification, and the second must reach a weighted identity, rather than ending at the input record. No declared gap was supplied with this package.

## R02 (P1) — The defect formula uses the dimension of an unrigidified stack

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1375`. Claim: `δ_a := dim P_a − dim P_a^{ab} = Σ_v δ_v(a)` on the stated generically regular locus.

Witness: take `G=G_m`, `X=ℙ¹/𝔽₅`, and `D=O(2)=O(1)²`. Here `P_a=ℤ×BG_m`, so its stack dimension is −1; the abelian variety has dimension 0, while the empty local defect sum is 0.

Thus the displayed equality reads −1=0. The same section explicitly retains scalar automorphisms for this example, so one cannot silently read `P_a` as its rigidification. The all-regular Check at line 1385 also requires defect zero. Ngô's proper Deligne–Mumford assertion is restricted to the anisotropic setting; it does not remove this problem on the broader locus (`ngo-fl` line 3540).

Repair: define the defect using the affine part of the neutral Picard group after the appropriate rigidification; distinguish that group from the full Picard stack. Restrict the stack-dimension expression to the finite-stabilizer setting, or include the stabilizer correction. Retain the broad gluing statement. The repaired definition gives 0 on `Pic(ℙ¹)` and 1 on the generalized Jacobian of a one-node spectral curve. Add both as explicit dimension Checks and propagate this definition to §§3.13–3.19.

## R03 (P1) — A nonzero smooth test cannot be supported on this single orbit

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:790`. Claim: a test supported on the other rational conjugacy class has a nonzero orbital integral.

Witness: in `SL₂(ℚ₃)`, take `γ=[[0,−1],[1,0]]` and `γ′=[[0,−3],[1/3,0]]`. Their regular conjugacy orbits have dimension 2 inside the dimension-3 group, hence empty interior.

A locally constant function supported on either orbit is identically zero: any nonzero value would give an open subset of that orbit. Consequently the asserted test has `O_γ=O_γ′=SO_γ=0`, contradicting the claimed nonzero value. These are distinct rational classes in one stable class: the determinant 3 of the conjugating matrix is not a norm from the unramified quadratic extension.

Repair: use a sufficiently small compact open neighborhood of `γ′` disjoint from the closed orbit of `γ`, not the orbit itself. Its characteristic function has `O_γ=0` and positive `O_γ′`; rescale by that positive integral to obtain `O_γ′=SO_γ=1`. This tests the intended distinction without an impossible support condition.

## R04 (P2) — Small residue characteristics are bypassed by changing the level

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:47`, propagated at lines 2253–2265, 4917 and 5216. Claim: hyperspecial unit transfer is supplied only outside `S_FL`; inside it the exported theorems use sufficiently small levels.

Witness: at an unramified nonsplit unitary group over `ℚ₂`, let `K` be hyperspecial and `K(2^m)` a proper principal congruence subgroup. At an element with nonidentity reduction, `1_K=1` and `1_K(2^m)=0`.

The small-level transfer theorem therefore does not provide the omitted hyperspecial identity. This changes the allowed level and resulting oldform dimensions, even when the extension and group are unramified. It is the good-prime-only shortcut prohibited by the review contract, rather than a consequence of a necessary ramification hypothesis.

Repair: own or import the general mixed-characteristic unramified unit-transfer results, including the small residue characteristics, before exporting the level-dependent comparisons. The large-characteristic geometric statements may remain intermediate inputs. Recheck the original hyperspecial test at the dyadic example, without replacing its level; do the same at residue characteristic 3. Do not repair this by narrowing the exported level class further.

## R05 (P2) — The central quotient does not kill Frobenius's height translation

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4684`. Claim: passing to the central uniformizer quotient kills the translation in the descent cocycle.

Witness: `cdn23` lines 167–180 gives the component action through determinant, reduced norm and reciprocity. The central scalar `ϖ I₂` translates height by 2; a Frobenius generator translates by ±1.

After the quotient, the height classes are `ℤ/2`; Frobenius exchanges 0 and 1. The endpoint descent statement is indeed in `cdn23` lines 182–184, but the proposed intermediate trivialization is false.

Repair: retain the nontrivial finite permutation in the descent datum and prove effective continuous Galois descent, using the finite-level models and the cited construction. Add the explicit Check `0↦1↦0` on the two height classes. This preserves the true endpoint and fixes the proof route without replacing its Weil action by the identity.

## R06 (P3) — Prospective API and Check names claim absent Lean declarations

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:391` and `:3816`, with further instances throughout. Examples are `TauCeti.EndoscopicDatum.ZPair` and `ClassicalWeilParameter.ofIrreducible`.

Witness: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean:43` opens an empty namespace; it declares zero definitions or theorems. The corresponding arithmetic carriers are not supplied by the pins.

Repair: express the future API and Checks as prose, retaining backticked declaration names only for actual pinned declarations or permitted declarations in Suggested.lean. Remove the invented Lean labels from Checks. Do not add an API catalogue or stand-ins to the empty Lean file to satisfy the labels. Also replace its lines 6–9 description of “particular milestones” with the prescribed headline acceptance-test description. After repair the same mathematical API remains in the README, but searching the Lean file is no longer promised to find these names.

## R07 (P3) — Two gate failures remain

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4157` and `:5217`.

Witness: the worker's gate at this exact head reports `residue=2` and `FAIL`, flagging “packet/multiplicity” and “packet/oldform”. All other counters, including `build`, are zero.

These occurrences use mathematical vocabulary, so the scanner's process-residue diagnosis is a false positive. Nevertheless, the brief requires reporting every failing gate check and forbids acceptance while it fails. Repair the two phrases to “classification and multiplicity” and “classification and oldform”, preserving their hypotheses, then rerun the gate. No mathematical change is needed.

## Verified sound

The review inspected 15 layers and 221 numbered targets, the 15 seeded source targets below, the empty Lean module, the worker gate, the ownership searches and supplier contracts. The computations below are adversarial tests, not proofs of the general theorems. Inaccessible texts and limits of verification are recorded separately; a successful boundary calculation does not certify the whole target.

The head is the requested commit. The outside-folder diff is empty and the worktree was left unchanged. The targeted build in the worker gate passed. A separate `lake env lean` elaboration of `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean` passed with no output or warnings. There are zero named declarations: the signature-binder audit and one-tactic padding probe therefore have zero candidates; no substitute theorem was tested. There is one `import Mathlib`, no `set_option`, no sorry'd data, and no duplicate fully qualified declaration name.

The required dependency check returned:

```text
depcheck: 209 roadmaps, 1482 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Reading the Needs lines and extracting their numbered internal edges found no internal target cycle. This does not discharge the unowned theories in R01. The gate summary is `residue=2`, all other counters zero, `FAIL`; R07 records both occurrences.

### Seeded source checks

Source identifiers below refer to the legal source-service extractions. Page numbers are the text's printed numbers unless explicitly called preprint pages. No source passage was copied. No README locator was explicitly labelled unverified; all 15 requested targets were checked against readable texts, with the pagination limitation stated for LTXZZ.

| Target | Text and locator opened | What the text supports or limits |
|---|---|---|
| 1.7 z-pairs | `waldspurger-twisted` line 452, §1.4 p.11; `kottwitz-shelstad` line 814, Lemma 2.2.A p.21, and line 906 p.23 | Chosen auxiliary extension/embedding and its central character, not every arbitrary central extension. The identity pair requires the extra identification used in the README. |
| 2.6 germs | `kottwitz-harmonic` line 25679, §17.8, and line 25820, (17.11.2)/Corollary 17.8 p.465; `everling-fourier` line 238, §3 p.21 | Square homogeneity and rational-orbit dependence. Degree-zero homogeneity does not make the rational germ constant throughout a Cartan. |
| 2.16 characters/Weyl integration | `clozel-characters` line 201, §3.3 Theorems 1–3 pp.153–154; `kottwitz-harmonic` line 23573, §7 pp.421–423 | Character regularity matches. Kottwitz gives the Lie-algebra formula; README line 1065 explicitly distinguishes it and supplies the group Jacobian/fibre argument. |
| 3.11 Hitchin product | `ngo-fl` line 3540, Proposition 4.13.1 pp.86–87; line 7496, Propositions 8.4.2–8.4.3 pp.175–176; `ngo-hitchin` line 1204, Theorem 4.6 p.21 | Geometric gluing and anisotropic properness are distinct. The earlier theorem assumes a global object exists; the chosen square-root/Kostant datum supplies one. R02 concerns the additional defect formula. |
| 4.9a nonstandard transfer | `waldspurger-stabI` line 3525, §4.10(5) pp.78–79 | Stable orbital-integral quotient isomorphism and Fourier compatibility with the specified normalization; this is separate from the good-prime lattice identity. |
| 6.1 unitary induction | `tadic-unitary` line 425, §2.5 p.346; `moeglin-waldspurger-residual` line 114, I.1.1 pp.607–608 | Unitary factors and unitary-axis intertwiners; unitary central character alone is insufficient. The general irreducibility theorem is imported, not newly owned. |
| 6.3 CM character | `shin-stablegal` line 638, §3.1 p.12 | Choice of extension and finite ramification. Odd angular exponent and zero norm exponent follow by restricting to negative and positive reals. |
| 6.10 infinity tests | `clozel-labesse-orbital` line 5455, Theorem 4.1 p.113, and Theorem 5.1 p.114; `cs17` line 3582, pp.737–738 | Centralizer sign and arbitrary-signature correction. The pure-unitary factor is not an unchanged GU formula. |
| 10.18 semisimple parameter | `scholze-local-langlands` line 102, Theorem 1.2 p.3; line 441, Lemma 3.2 p.10; line 1289, Corollary 10.3 pp.26–27; line 1444, Corollary 11.5 p.30 | Positivity plus integrality produces an actual semisimple Weil representation. Traces alone do not determine monodromy. |
| 11.2 unitary packets | `kmsw` line 3363, Theorem 1.6.1 p.80; line 3403, Proposition 1.6.2 p.81; line 3465, Theorem 1.6.4 | Pure/extended inner-twist data and the restrictions on real-place pairings are retained. The source's conditional inputs do not assign library ownership; see R01. |
| 12.19 rank-two descent | `cdn23` line 161, §0.2.1 p.4 | The descent endpoint is explicitly stated. Its component actions refute the claimed killing of translation; see R05. |
| 13.1 standard pairs | `ltxzz` line 1194, Definition 3.2.3; line 1234, Definition 3.2.7 and Proposition 3.2.8 | Numbering agrees in arXiv 1912.11942v3, pp.26–27. Weak base change and standard-pair restrictions agree; the cited published pagination was not certified. |
| 14.1 CSnc tests | `csnc` line 2920, Definition 5.3.1 p.68; line 3246, §5.6 pp.74–75 | Split distinguished prime, acceptable initial test and transferred infinity coefficients. The added small-prime restriction is R04. |
| 14.2 reduction | `cs17` line 3636, §5.4 pp.739–740; `shin-stablegal` line 2073, §5.5 pp.36–37 | The README uses normalized Jacquet/transfer/JL followed by the additional half-modulus twist. Shin distinguishes n-Red and Red explicitly; CS17's abbreviated definition omits this twist. |
| 14.7 rational export | `csnc` line 3278, Lemma 5.6.2 pp.75–76; `ltxzz` line 5255, Lemma 6.1.11, preprint pp.108–109 | CSnc supplies virtual spectral factorization. LTXZZ's lemma is the localized compact-support comparison under its own assumptions, not a standalone proof of concentration or of this whole export. The README correctly excludes those inferences. |

### Headline and pinned-library audit

The headline families are: stable-conjugacy/abelianization duality (§§1.9–1.17); transfer and Fourier compatibility (§§2.13–2.16, 4.7–4.10); Hitchin support/geometric stabilization/fundamental lemmas (§§3.17–4.6); stable–twisted comparison and weak base change (§§6.25–6.29); Igusa classification/counting/stabilized trace (§§8.3–8.22); classical local Langlands and inner-form comparison (§§10.18–10.31); conditional local/global classification (§§11.1–11.4); tower comparison and actual supercuspidal cohomology (§§12.11–12.22); pure transfer/oldform dimensions (§§13.1–13.9); signed rational Igusa factorization (§§14.4–15.6).

The module docstring identifies the missing carrier families for these main endpoints. Empty Suggested.lean is preferable to scalar identities or free predicates replacing them. Native matrices, abstract representations or a topological quotient alone do not state these endpoints. I found no padding declaration and no demonstrated missing statable headline. The auxiliary native algebra in the README remains subject to reuse; the empty module does not certify its mathematical claims.

Opened at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

| Pinned file and line | Declaration/object checked and boundary |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132`; `Charpoly/Coeff.lean:119` | `Matrix.charpoly`, `charpoly_monic`; characteristic polynomial is determinant of `tI−M`. |
| `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935` | `Polynomial.discr`; constant-polynomial discriminant is 1, including the zero polynomial. |
| `Mathlib/MeasureTheory/Group/Measure.lean:785` | `MeasureTheory.Measure.IsHaarMeasure` includes left invariance, finite mass on compacts and positive mass on opens; regularity is not an extra field of this class. |
| `Mathlib/RingTheory/LaurentSeries.lean:100`; `Mathlib/RingTheory/PowerSeries/Basic.lean:56` | Native series carriers, not a loop ind-scheme or Hitchin stack. |
| `Mathlib/AlgebraicGeometry/Scheme.lean:40`; `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean:151` | Scheme carrier; `IsFinite.of_comp` requires separatedness of the complementary map. |
| `Mathlib/LinearAlgebra/Vandermonde.lean:84`, `:219`, `:259` | Vandermonde matrix, determinant and power-sum separation; eventual separation additionally cancels nonzero powers. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:94` | Proper geometrically integral group-scheme carrier; smoothness and commutativity are derived, not finite-field Tate full faithfulness. |
| `TauCeti/Algebra/Module/Torsion/TateModule.lean:115` | A generic Tate-module construction exists; this is not itself the Galois-equivariant abelian-variety comparison. |
| `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:163`, `:180`, `:324`, `:468` | `ExactK0`, conflation relation, lift and map; essential smallness and exact structure remain required. |
| `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:56`, `:67`, `:72`, `:107` | `spaX` and quotient topology/API; no relative structure sheaf or marked untilt divisor in this construction. |
| `TauCeti/Algebra/CrossedProduct/Comparison.lean:267` | `brauerCohomologyEquiv`; the algebraic field Brauer group is not to be rebuilt here. |
| `TauCeti/LinearAlgebra/Matrix/RationalCanonicalFormFinTwo.lean:69`, `:75`, `:79` | Companion matrix, determinant and trace. |
| `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ConjugacyClasses.lean:206`, `:238`, `:345` | Nonscalar GL₂ conjugacy; finite-field nonsplit torus conjugacy; class parametrization. The nonscalar theorem also includes nonsemisimple matrices. |

### Ownership and supplier resolution

Object searches used the roadmap tool across main and the supplied open heads, and searches of board packages and pinned libraries. Text locations were resolved for 37 named supplier roadmaps; this is a citation-location count, not a claim to have certified every theorem in those suppliers. Existing-main suppliers were compared with main, rather than using unrelated revisions as new dependencies. The following ownership boundaries were substantively checked:

- `TauCetiRoadmap/AutomorphicSpectralTheory/README.md`, §4.14a (line 2507), owns the number-field residual classification. §7.0b (line 3689) owns finite-place unitary products and imports the real/complex classification from AutomorphicFormsOnReductiveGroups §2.6. The adapter in §6.1 is distinct from rebuilding that classification.
- `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, §SR.5.2 (lines 4349–4380), owns segment labels and raw Weil–Deligne data; §SR.5.3 (line 4751) owns the endpoint/derivative conventions. Layer 10's trace-to-monodromy identification is additional work.
- `TauCetiRoadmap/PadicHodgeTheory/README.md`, §5.5 (line 1077, local torsor statement line 1105), supplies the B(G)/Kottwitz input; §7.5 (line 1324) supplies the relative period-sheaf specialization. The ramified-coefficient marked tower adapters remain here.
- `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md`, §5.6 (lines 5524–5657), §5.8 (line 5833) and §§6.1–6.5 (lines 6218–7096), supplies the scheme decomposition, hard-Lefschetz and trace formalism. Hitchin-specific support remains here.
- `TauCetiRoadmap/GeometricSatakeAndFusion/README.md`, Layer 0, equal-characteristic Schubert models (lines 784–798), concerns perfect test algebras. The all-algebra, including nonreduced, loop quotient in §3.2 is a genuine enlargement. `TauCetiRoadmap/FormalConnectionsOpers/README.md`, F3/F3A (lines 388, 448–462), uses complex test algebras and does not own that finite-field enlargement.
- `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:551` imports this roadmap's §3.2. Its package design does the same. The direction is consumerward; it is not a supplier for §3.2. The SheafTheoreticSmithTheory open head similarly uses reduced Schubert models, not the new full quotient.
- `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md`, Layers 2–6 (lines 212–293), already owns the basic central-simple/Brauer theory. §8.3's centre-sensitive embedding criterion must use it; it is not a new owner of the Brauer group.

No second Lean declaration owner was introduced by this empty Suggested.lean. The searches did not identify an existing main roadmap with the whole scope of this folder, so the verdict is repairable “needs changes”, not rejection as a replanning. They also did not supply the missing ownership in R01.

### Adversarial computations

The 221 rows give one computed test per numbered target. “Pass” and “Boundary” certify only the displayed instance, not the general theorem. R-numbers identify repairs; existing source corrections are listed below.

| Statement | Instance | Values on the two sides / rejected model | Result; change |
|---|---|---|---|
| 1.1 | Trivial crossed module; nonabelian S₃ | Trivial cocycle class is one point; inversion sends (12)(23) to (132), whereas inverse factors multiply to (123). | Pass; inversion is not a group homomorphism. |
| 1.2 | Split G_m over a local field | H¹=0; the corresponding degree-one obstruction is 0. A quadratic norm-one torus instead has quotient of order 2. | Boundary. |
| 1.2a | Unramified character χ(ϖ)=2 | Geometric reciprocity evaluates to 2; using arithmetic reciprocity without inversion gives 1/2. | Pass. |
| 1.3 | Nonscalar GL₂ companion, trace 5, determinant 6 | Characteristic polynomial X²−5X+6; scalar 2I has trace 4 and determinant 4. | Pass; native conjugacy reused. |
| 1.3a | Trivial Hecke character | Local and global Weil pullbacks both have value 1; localization of their product is 1. | Boundary. |
| 1.4 | Identity endoscopic datum | Dual embedding and root datum maps are identities; missing-root set is empty and its product is 1. | Boundary. |
| 1.5 | G=G_m | Crossed module is [1→G_m]; abelianized H¹ equals H¹(G_m)=0. | Boundary. |
| 1.6 | Identity inner twist | Cocycle z=1 and twist class 0; composing with its inverse again gives 0. | Boundary. |
| 1.7 | Identity z-pair, H_der simply connected and ℋ=LH | Kernel 1, obstruction H¹=0, λ=1; a nontrivial central character instead gives f(zh)=λ(z)⁻¹f(h). | Pass sample. |
| 1.8 | G₄, balanced H=G₂,₂ | Outer group order 2; τ(G)=2, τ(H)=4, so ι=1/4, not 1/2. | Pass. |
| 1.9 | Split SL₂ torsor at a finite place | H¹ is a singleton, abelianized class 0; the split torsor supplies that class. | Boundary; full Hasse proof not certified. |
| 1.10 | G_m and GL₂ over ℚ | For G_m the positive subgroup is all ℚ×, including −1; for GL₂ its determinant image is ℚ>0. | Pass; not the identity component of G_m(ℝ). |
| 1.11 | Split rank-one torus | Dual lattice ℤ; uniformizer valuation and Kottwitz value both 1, unit values both 0. | Boundary. |
| 1.12 | Identity extension of a split torus | Integral points map identically; kernel 1 and special-fibre kernel 1. | Boundary. |
| 1.13 | Quaternionic inner form of GL₂; compact U₃ | Signs −1 and +1 respectively; rank-only real parity would give −1 in the latter case. | Pass. |
| 1.13a | G=SL₂, Borel Levi G_m | Split unipotent radical has H¹=0; H¹(B)=H¹(G_m)=0. | Boundary. |
| 1.14 | Elliptic SL₂ torus from unramified quadratic E/ℚ₃ | Norm valuations 2ℤ; rational classes represented by valuations 0 and 1, two classes. | Pass. |
| 1.15 | Obstruction group ℤ/2 | Character average at 0 is (1+1)/2=1; at 1 it is (1−1)/2=0. | Pass finite obstruction test. |
| 1.16 | Identity matching and identity norm | Matching element γ maps to γ; norm over degree-one extension is γ. | Boundary. |
| 1.17 | Separable GL₂ spectrum 2,3 | Centralizer is G_m², dimension 2; repeated scalar spectrum has centralizer GL₂, dimension 4. | Pass regularity control. |
| 1.18 | Orbital values 3,1 on two rational classes | Stable sum 4; nontrivial κ sum 2; change of base gives −2. | Pass. |
| 2.1 | Torus and Haar volume 3 | Centralizer quotient is a point, O_t(f)=f(t); integrated character of 1_K is 3. | Pass. |
| 2.2 | Root pair α,−α | Choose a_α=2, a_−α=−2; equal choices 2,2 violate the sign law in characteristic 0. | Pass defining-law test. |
| 2.3 | Compact real torus, distinct characters 1 and z | Normalized integrals of 1 and z are 1 and 0. | Pass character control. |
| 2.4 | The two SL₂(ℚ₃) classes in R03 | Orbit-supported smooth f is 0; claimed nonzero SO is actually 0. Neighborhood repair gives O_γ=0, SO_γ=1. | Fail; R03. |
| 2.5 | Identity datum with compatible normalizations | Root products are empty, cohomology pairings trivial: transfer factor 1. | Boundary. |
| 2.6 | ℚ₃, regular nilpotent orbit dimension 2 | Γ(9X)/Γ(X)=9; normalized ratio 1. On the nonsplit SL₂ Cartan, even valuations give nonzero germ, odd ones 0. | Pass sample. |
| 2.7 | Two inverse local rescalings | Factors 2 and 1/2 multiply to 1; rescaling just one changes the global product to 2. | Pass normalization test. |
| 2.8 | Trivial twist | Twisted conjugacy is ordinary conjugacy; transferred unit factor is 1. | Boundary. |
| 2.9 | Rank-one torus Lie algebra | Empty root/discriminant products are 1; matching is identity. | Boundary; primary Lie-transfer text unavailable. |
| 2.10 | Compact quotient, trivial coefficient | Normalized constant function has trace 1 on the trivial representation, 0 on a nontrivial irreducible. | Pass. |
| 2.11 | Zero test and identity endoscopy | Transfer class 0 has every orbital integral 0; identity transfer of f has the same orbital integrals as f. | Boundary. |
| 2.12 | Identity unitary Lie datum | Transfer factor 1; equal matching diagonal elements give identical characteristic polynomials. | Boundary. |
| 2.13 | ℚ₃, self-dual measure, f=1_(3ℤ₃) | Fourier transform is (1/3)1_(3⁻¹ℤ₃); double transform returns f(−x)=f(x). | Pass. |
| 2.14 | Compact rank-one real factor | Trivial character integral 1; nontrivial character integral 0. | Boundary; full Shelstad text unavailable. |
| 2.15 | Identity endoscopy at infinity | Endoscopic sum has one datum; transfer of its EP trace is the same trace 1 on the chosen coefficient. | Boundary. |
| 2.16 | GL₁, vol(K)=3, trivial π | tr π(1_K)=3; Weyl side has Weyl-group order 1, D=1, integral 3. Nontrivial character on K gives 0 on both sides. | Pass sample. |
| 3.1 | G_m-bundles on ℙ¹ | Isomorphism classes ℤ; automorphisms of each line bundle G_m. Degree-zero class is one class, not one object without automorphisms. | Pass. |
| 3.2 | G_m loops and dual numbers k[ε]/ε² | Loop 1+εt⁻¹ is invertible with inverse 1−εt⁻¹; its nontrivial quotient class disappears after ε↦0. | Pass; reduced tests lose data. |
| 3.3 | GL₂ diagonal 2,3 | Quotient coordinates trace 5, determinant 6; polynomial X²−5X+6. | Pass. |
| 3.4 | Companion with (d,t)=(6,5) | [[0,−6],[1,5]] has trace 5 and determinant 6. An SL₄ naive slice in characteristic 5 has derivative 0 in the displayed t-direction. | Pass corrected-slice control. |
| 3.5 | G=G_m | Regular centralizer J_a=G_m at every a; dimension 1, not 0. | Boundary. |
| 3.6 | GL₂ on ℙ¹, deg D=2 | Base dimension h⁰(O(2))+h⁰(O(4))=3+5=8; spectral genus 1. | Pass. |
| 3.7 | Negative versus nonnegative line degrees on ℙ¹ | h⁰(O(−1))=0; h⁰(O(2))=3. Unqualified polynomial extrapolation can produce negative dimensions. | Boundary. |
| 3.8 | Local covers y²−ε² and y²−ε, odd characteristic | First has a node with δ=1; second is smooth with δ=0. | Pass. |
| 3.9 | Same two GL₂ local invariants | (discriminant valuation−rank defect)/2 is (2−0)/2=1 and (1−1)/2=0. | Pass. |
| 3.10 | SL₂ on ℙ¹, nilpotent and D=O(1) | Regularity would force 2deg L+1=0, no integer solution; D=O(2) permits deg L=−1. | Pass nonemptiness control. |
| 3.11 | Full Picard stack of ℙ¹ | dim P=−1, dim P^ab=0, local sum 0: −1≠0; rigidified defect is 0. | Fail; R02. |
| 3.11a | Everywhere regular G_m case | Singular-place set empty; local product one object; global fibre remains the Picard torsor with degree components ℤ. | Boundary. |
| 3.12 | G_m full stack versus finite stabilizer locus | Stabilizer dimension 1 excludes DM conclusion; a finite reduced stabilizer has dimension 0. | Pass hypothesis test. |
| 3.13 | Smooth spectral curve versus one node | Affine neutral Picard dimension 0 versus 1; full-stack subtraction in R02 instead loses 1. | Repair definition via R02. |
| 3.14 | Elliptic curve acting on itself over a point | Cohomology degrees 0,1,2 have dimensions 1,2,1; amplitude 2=2dim(E). | Pass; an individual H⁰ would not encode amplitude. |
| 3.14a | Smooth proper elliptic curve | H⁰ and H²(1) have dimension 1; cup product by an ample degree-one class is 1→1. | Boundary. |
| 3.15 | ℤ/2 action with eigenvalues +1,−1 | Projectors (1±s)/2 have ranks 1,1; their sum is identity, product 0. | Pass coefficient test. |
| 3.16 | E/𝔽₃: y²=x³−x | #E(𝔽₃)=4; simply transitive E-action gives quotient groupoid mass 1, not 4. | Pass mass control. |
| 3.16a | Spec 𝔽_(q²) versus two rational points | Extension counts are 0,2,0,2,… versus 2,2,2,2,…; agreement on even degrees is insufficient. | Pass cofinal-degree control. |
| 3.17 | Smooth abelian fibre over a point | Support codimension 0, δ=0, cohomological amplitude 2d; no smaller nonempty support exists. | Boundary. |
| 3.18 | Identity endoscopy | Codimension r=0, shift 0 and Tate factor q⁰=1; comparison is identity. | Boundary. |
| 3.19 | Smooth torus and one-node spectral curve | Rigidified defects 0 and 1 respectively; unrigidified Picard dimensions are lowered by 1. | R02 propagation. |
| 4.1 | One orbit with stabilizer volume 1/2 | Stack/orbital weight is 1/(1/2)=2, not 1. | Pass. |
| 4.2 | Identity nonstandard triple at an allowed prime | Root-scaling constants 1; the two unit orbital integrals coincide. | Boundary; not a small-prime proof. |
| 4.3 | G=H=G_m, integral regular element | Unit orbital integrals 1=1, factor 1; nonintegral element gives 0=0. | Boundary. |
| 4.3a | Identity anisotropic datum | Endoscopic summand equals original summand, shift 0, character 1. | Boundary. |
| 4.4 | Rank-one unitary Lie algebra | Identity transfer gives 1=1 on the integral lattice and 0=0 off it. | Boundary. |
| 4.5 | Matched residue ring O/ϖ^m of length m | Rank-one lattice quotient has q^m elements on either side; this tests truncated data, not arbitrary bad characteristic. | Boundary. |
| 4.6 | Hyperspecial K versus proper congruence K(2^m) | At k outside K(2^m), characteristic functions give 1 versus 0. | Coverage failure; R04. |
| 4.7 | Zero and identity transfer | Zero test transfers to zero; identity datum transfers f to f. | Boundary; existence for general f is substantial. |
| 4.7a | Quaternion algebra, trivial inner representation | Split transfer is St₂; elliptic characters satisfy −1=(−1)·1. | Pass sign. |
| 4.8 | Same quaternionic pair | Matching elliptic trace uses sign −1; omitting it changes −1 to +1. | Pass. |
| 4.9 | Rank-one unramified degree-two extension | Norm sends a uniformizer to one of valuation 2; unit character pulls back to value 1 on units. | Boundary. |
| 4.9a | Identity triple over ℚ₂, f=1_ℤ₂, conductor ℤ₂ | Transfer and Fourier commute: both transformed tests are 1_ℤ₂, value 1 at 0. | Pass sample; no integral nonstandard assertion inferred. |
| 4.10 | Identity twist | Twisted orbital integral equals ordinary one; unit values are 1 on integral regular elements. | Boundary; R04 covers omitted primes. |
| 4.11 | Fixed finite exceptional set | Adding one bad place increases its cardinality by 1; does not prove the omitted local identity there. | Correct almost-all statement; insufficient endpoint, R04. |
| 5.1 | Residual length b=1 and b=2 | Block dimensions n and 2n; b=1 recovers the cuspidal representation. | Pass supplied-index test. |
| 5.2 | Identity permutation; inverse permutations | Normalized intertwiner is 1; N(w⁻¹)N(w)=1 on the unitary axis. | Pass normalization. |
| 6.1 | GL₂ principal series | Unitary characters yield one irreducible; ν^(1/2)×ν^(−1/2) has constituents 1 and St₂, length 2. | Pass sample. |
| 6.2 | Split SL₂ versus quadratic norm-one torus | Tamagawa numbers 1 and 2; the torus is outside the semisimple simply connected hypothesis. | Boundary; general proof sources partly inaccessible. |
| 6.3 | Infinity angular exponent m | m=1 gives −1 at −1 and 1 at 2; m=2 gives +1 at −1. Positive-real restriction forces t=0. | Pass sample. |
| 6.4 | One-dimensional θ-stable representation | A=1 has twisted trace 1; replacing A by −1 changes it to −1. | Pass normalization control. |
| 6.5 | Split G_m | Dual centre connected and ker¹ trivial; quotient of cardinalities is 1. | Boundary. |
| 6.6 | Rank-one unramified parameter α=2 | Degree-two base change has Frobenius 4; forgetting the norm would leave 2. | Pass. |
| 6.7 | G₄,H₂,₂ | ι=2/(4·2)=1/4; multiplying by τ(H)=4 gives 1=τ(G)ε. | Pass. |
| 6.8 | Satake roots 2,3 and degree-two base change | Roots 4,9; sum 13, product 36, versus original sum 5, product 6. | Pass. |
| 6.9 | Split place | Product-group projection gives identity transfer on the selected factor; zero function has zero transfer class. | Boundary. |
| 6.10 | Compact coefficient; pure-unitary n=2 sign −1; proper block | EP trace 1; signed orbital value −4 versus unsigned +4. Block weights 3/2,−3/2 have gap 3, unlike trivial GL₂ coefficient gap 1. | Pass sample and coefficient control. |
| 6.11 | Restriction of scalars from a real quadratic field | Real split rank 2, rational split rank 1; difference 1, not 0. | Pass rank control. |
| 6.12 | Rank-one cyclic adapter | Character χ(ϖ)=2 becomes χ∘Norm with value 4 in unramified degree 2. | Pass. |
| 6.13 | Twisted torus with identity twist | Character evaluation of normalized unit is 1; a nontrivial character average is 0. | Boundary; full Paley–Wiener text inaccessible. |
| 6.14 | K(2^m) properly contained in hyperspecial K | Unit values at k∈K\K(2^m) are 0 and 1; small support changes the test. | R04. |
| 6.15 | Degree [F⁺:ℚ]=2 versus 1 | Split-rank difference 1 versus 0; the degree-one case fails the vanishing criterion. | Pass hypothesis control. |
| 6.16 | Trivial versus balanced endoscopy | Outer-factor contributions 1 and 1/2; central Tamagawa factors must still be multiplied. | Pass. |
| 6.17 | θ=id, one-dimensional representation | Invariant twisted trace reduces to ordinary trace 1; changing intertwiner sign gives −1. | Boundary. |
| 6.18 | Identity datum, torus | Only stable term, coefficient 1; trace of normalized compact unit 1 on both sides. | Boundary. |
| 6.19 | Twisted split torus | One-dimensional spectral term tr(fA)=1 for A=1, −1 for A=−1. | Pass convention control. |
| 6.20 | Determinant on a two-dimensional moving space | det(−1−1)=4; reciprocal spectral coefficient 1/4. | Pass; not the balanced ε=1/2. |
| 6.21 | Proper cuspidal-subset set empty | Proper geometric sum 0; this does not set nonempty proper spectral sums to 0. | Boundary. |
| 6.22 | Two spectral terms with coefficients 1,−1, traces 3,1 | Signed spectral total 2, unsigned total 4. | Pass sign bookkeeping. |
| 6.23 | Compact quotient, trivial representation, normalized unit | Spectral trace 1 and geometric integral 1; noncompact quotient would require boundary contributions. | Boundary. |
| 6.24 | Rank-one cyclic character with χ(ϖ)=2 | Norm-compatible value 4 in residue degree 2; inverse convention gives 1/4. | Pass. |
| 6.25 | Balanced endoscopic coefficient | Stable contribution (1/4)·4=1; twisted coefficient 2·(1/2)=1. | Pass normalization; R04 scope. |
| 6.26 | Induction from quadratic extension of trivial Weil character | Restriction back gives 1⊕1; induced representation is 1⊕quadratic character, dimension 2. | Pass noncuspidal boundary. |
| 6.27 | Split local place | Unitary group becomes GL_n; the local transfer is the specified GL representation, not a twofold multiplicity. | Boundary. |
| 6.28 | Haar rescaling by 2 | Raw unit trace 3→6; idempotent trace stays 1. | Pass. |
| 6.29 | Weak transfer at unramified rank-one place | χ(ϖ)=2 determines Satake value 2; it says nothing numerical about a ramified local monodromy operator. | Pass scope control. |
| 7.1 | Zero-dimensional neat definite Shimura set with two points | H⁰ dimension 2; higher cohomology 0. | Boundary; no ramified smoothness inferred. |
| 7.2 | Rank-two isocrystal F(e₁)=e₂, F(e₂)=pe₁ | F²=p, slopes (1/2,1/2), determinant valuation 1. | Pass. |
| 7.3 | Two equal representations in degrees 0,1 | Euler class [V]−[V]=0; both actual groups still have dimension dim V. | Pass. |
| 7.4 | Above isocrystal and its dual | Newton sums and Kottwitz values 1 and −1 respectively. | Pass dual/sign control. |
| 7.5 | Basic equal slopes versus ordinary slopes 1,0 | Newton Levi GL₂ versus GL₁×GL₁; Levi dimensions 4 versus 2. | Pass. |
| 7.6 | Height-one relative module | Relative height 1 and relative dimension 1; absolute height multiplies by [E:ℚ_p]. | Pass coefficient-field control. |
| 7.7 | Constant ordinary p-divisible group | Slopes 0,1 remain 0,1 under base change; no new slope appears on the central leaf. | Boundary. |
| 7.8 | Ordinary rank-two, p=3, first level | Deck size φ(3)²=4; level-zero deck size 1. | Pass. |
| 7.9 | Slope exponents initially 5,0 | A shift N>5 separates the appropriate slopes; N=0 does not reverse the original inequality. | Boundary. |
| 7.10 | Equal adjacent cohomology groups | Alternating trace of identity 1−1=0, despite two nonzero degree-wise groups. | Pass. |
| 7.10a | Identity finite correspondence on two points | Pullback and trace are identity, trace on H⁰ is 2; degree-two fibre summation sends 1 to 2. | Boundary. |
| 7.11 | Frobenius acting on two components cyclically | One-step trace 0, two-step trace 2; forgetting component permutation would give 2 already. | Pass descent control. |
| 8.1 | Zero-slope factor δ=p | δ⁻¹ has valuation −1, not integral; Frobenius shifts leave this slope-zero obstruction unchanged. | Pass geometric-acceptability control. |
| 8.2 | Finite étale map of degree 2 | Trace after pullback on a constant section is multiplication by 2, not 1. | Pass. |
| 8.3 | Field embedding in M₂(K) | Quadratic extension acts on its dimension-2 regular module; a cubic field would require 3 dividing 2, false. | Pass centre/dimension control. |
| 8.4 | Trivial adelic cohomology class | Every localization 0, obstruction sum 0; two local order-two obstructions have sum 0. | Boundary. |
| 8.5 | Zero-slope δ=p plus central scalar p⁻¹ | Frobenius alone leaves inverse valuation −1; scalar multiplication changes δ to 1, inverse valuation 0. | Pass two-shift correction. |
| 8.6 | Identity polarized isogeny | Degree 1, polarization scalar 1 and local orbit the base point. | Boundary. |
| 8.7 | Two identical presentations and common refinement | Their refined data agree termwise; identity refinement has degree 1, not a new type. | Boundary. |
| 8.8 | Full Levi/basic case | Effective datum count 1; relative-root set empty and half-modulus 1. | Boundary. |
| 8.9 | GL₂ torus Levi, δ_P(m)=4, trivial π | Half-modulus lift has orbital factor 1/2 and normalized opposite Jacquet character 2; full-modulus factor 1/4 gives trace 1 instead. | Pass corrected normalization. |
| 8.10 | Supersingular elliptic curve after quadratic field extension | Frobenius −3 is rational over 𝔽₉; division invariants at p and infinity are 1/2,1/2, sum 0 mod ℤ. | Pass. |
| 8.11 | Distinct nonzero eigenvalues 2,3 | Two shifted equations have determinant 1/3−1/2=−1/6 at initial shift; equal eigenvalues give determinant 0 and must be grouped. | Pass. |
| 8.12 | Scalar on a simple isogeny factor | Centralizer of a scalar is the entire endomorphism algebra, not just the scalar field. | Boundary; acceptability must supply extra information. |
| 8.13 | ℤ/2 obstruction | Trivial obstruction Fourier average 1; nontrivial obstruction average 0. | Pass. |
| 8.14 | CM field ℚ(ζ₈), p=3 | Type {1,3} gives p-slopes 1,0; {1,5} gives 1/2,1/2. The signatures differ as well. | Pass; slope data alone do not fix polarization/signature. |
| 8.15 | Identity fixed-point parameter | All marking and cocycle maps are identities, obstruction 0; its orbit has one class when the stabilizer acts transitively. | Boundary. |
| 8.16 | Orbit with stabilizer of order 2 | Groupoid weight 1/2, not the unweighted point count 1. | Pass mass test. |
| 8.17 | Two classes of weights 3,1, κ nontrivial | Fourier term 2, trivial-character term 4; averaging isolates the zero obstruction. | Pass. |
| 8.18 | Trivial inner twist cocycle | Pairing is 1 for every character; nontrivial order-two pairing is −1. | Pass normalization boundary. |
| 8.19 | Equal source/Levi modulus 4 | Source factor 2 and lifting factor 1/2 multiply to 1; an extra half-modulus inverse gives 1/2 instead. | Pass corrected construction. |
| 8.20 | Rescale two compatible local transfers | 2·(1/2)=1 globally; rescaling only one gives 2. | Pass choice-independence control. |
| 8.21 | Balanced unitary term | ιτ(H)=1=τ(G)ε; omitting outer automorphisms doubles it to 2. | Pass coefficient test. |
| 8.22 | Same balanced datum | ε=1/2, ι=1/4; these coefficients are distinct before the Tamagawa cancellation. | Pass. |
| 8.23 | Normalized unit and volume 1/48 | Raw trace for a four-dimensional fixed space 4/48=1/12; divided by volume gives 4. | Pass. |
| 9.1 | V₁⊕V₂, diagonal action 2,3, projector onto V₁ | Projected trace 2, total 5; swapping the summands fails to commute with the projector. | Pass. |
| 10.1 | Trivial GL₂, q=4 | rec_un eigenvalues 1,1/4, trace 5/4; normalized σ eigenvalues 2,1/2, trace 5/2. | Pass. |
| 10.2 | Height one, q=3, first Drinfeld level | Deformation variables 0; generic nonzero frames 2. Special connected divisor 3[0] allows zero sections; generic divisor has three distinct points. | Pass. |
| 10.3 | Quaternionic trivial representation | JL is St₂ and elliptic character relation −1=−1·1. | Pass. |
| 10.4 | n=1, β a unit, or h=0 | Valuation-zero β lies off the valuation-one support, so φ=0; h=0 also gives φ=0. | Pass support/linearity. |
| 10.5 | Rank one, extension degree r=2 | Norm uniformizer valuation 2; inverted descent has the positive valuation, not −2. | Pass direction. |
| 10.6 | Split principal series transferred to quaternion division group | LJ(St₂)=1, LJ(1)=−1; their virtual sum maps to 0. | Pass; no representation-valued transfer claimed. |
| 10.7 | Scale a rational test by 1/2 | A trace originally 1 becomes 1/2; rationality does not mean integral-valuedness. | Pass. |
| 10.8 | ℚ₃, diag(1,4), lattice generated by e₁,(e₁+e₂)/3 | Matrix becomes [[1,−1],[0,4]]; stabilizer index 2, volume 1/2, weight 2 versus standard-lattice weight 1. | Pass. |
| 10.9 | k=n versus n=2,k=1,q=3,m=1 | Étale factor trivial in the first case; rank-one étale regular representation has dimension 2 in the second. | Pass. |
| 10.10 | d=2, split partition (1,1) | Both degree-one factors vanish in the quotient; their tensor term is 0, while degree-zero unit stays 1. | Pass. |
| 10.11 | Residue cardinality 9, n=2,k=1,r=1 | Harmonic factor q^((n−k)r)=9; replacing q by residue characteristic 3 gives 3. | Pass corrected formula. |
| 10.12 | Rank-one quasi-EL factor, zero h | Nearby-cycle trace and transferred trace both 0; no nonzero auxiliary scalar is forced. | Boundary. |
| 10.13 | Proper zero-dimensional raw model with two rational points | Frobenius trace on H⁰ is 2, higher terms 0, point count 2. | Boundary. |
| 10.14 | Virtual class W=−2[V], scalar a=−1 | W/a=2[V] has multiplicity 2; W itself has negative multiplicity −2. | Pass positivity bookkeeping. |
| 10.15 | Order-three compact character ρ | Projection pairing ρ(d)ρ(d⁻¹) averages to 1; replacing it by ρ(d)² averages to 0. | Pass dual correction. |
| 10.16 | Newvector multiplicity 1 versus rational half class | Extracted integer multiplicity 1; coefficient 1/2 cannot be an integral multiplicity. | Pass integrality control. |
| 10.17 | Residual length t=1 | Requested vanishing and nonvanishing on the same representation would give 0≠0; this separator case is excluded. | Pass. |
| 10.18 | Rank-one unramified χ(ϖ)=2 | Parameter trace at Φ is 2, L-factor (1−2X)⁻¹; inverse convention would give 1/2. | Pass sample. |
| 10.19 | Two WD objects with same r, N=0 versus rank-one N | Weil traces agree, but monodromy ranks are 0 and 1. | Pass semisimple-only boundary. |
| 10.20 | Steinberg GL₂ | Iwahori fixed dimension 1, hyperspecial fixed dimension 0; Iwahori information does not assert sphericality. | Pass. |
| 10.21 | Tame regular character induced from unramified quadratic extension | Dimension 2, inertia invariants 0, conductor 2, L-factor 1. Invariant inducing character instead decomposes. | Pass. |
| 10.22 | Trivial character under restriction and induction of index 2 | Restriction remains 1; induction has dimension 2, not 1. | Boundary. |
| 10.23 | q=3, N e₀=e₁, N e₁=0 | N²=0, N≠0; diag(1,1/3) conjugates N to N/3. | Pass WD convention. |
| 10.24 | Degree-one automorphic induction | Dimension multiplier 1; original character and induced character coincide. | Boundary; general non-Galois construction not numerically certified. |
| 10.25 | St₂ versus trivial GL₂, q=4 | St L=(1−X/2)⁻¹, conductor 1; trivial L=((1−2X)(1−X/2))⁻¹, conductor 0. | Pass monodromy test. |
| 10.26 | Sp₂⊗Sp₂ | Decomposition Sp₃⊕ωSp₁ has dimensions 3+1=4; N has blocks 3 and 1. | Pass special-block control. |
| 10.27 | Rank-one highly ramified twist | Both sides use the same Tate epsilon and self-dual measure; an unramified character changes conductor by 0. | Boundary; primary stability text inaccessible. |
| 10.28 | Unramified rank-one pair with values 2,3 | Tensor Frobenius 6 and pair L-factor (1−6X)⁻¹. | Pass. |
| 10.29 | Two unramified segment endpoints, q=4 | Parameter roots 2,1/2 give product (1−2X)(1−X/2); monodromy restriction can retain just the latter. | Pass. |
| 10.30 | Rank one χ(ϖ)=2 | Trace parameter and reciprocity parameter both evaluate to 2. | Boundary. |
| 10.31 | Quaternionic d=2, total rank 2 | One special block of size 2 is relevant; two size-one blocks are not, despite total dimension 2. | Pass relevance test. |
| 10.32 | Same principal-series cancellation | Transfer of [St₂]+[1] is 1−1=0. | Pass. |
| 10.33 | Above normalized GL₂ parameters | Same semisimple eigenvalues 2,1/2; N ranks 1 versus 0 give conductors 1 versus 0. | Pass. |
| 11.1 | Four-dimensional symplectic parameter | ∧² has dimension 6=1+5 after multiplier untwist; tensor orthogonal alternative is a different branch. | Pass boundary; R01 ownership. |
| 11.2 | Split place with quaternionic inner form | Relevant special block size 2 gives singleton; two size-one blocks give empty packet for that form. | Pass sample; real pairing restrictions retained. |
| 11.3 | Positive GL₂ exponents 1/2,−1/2 | Standard quotient is trivial; reversing order produces the Steinberg quotient. | Pass ordering. |
| 11.4 | Order-two global component character | Product of local signs +1 is compatible with trivial ε; product −1 is not. | Pass; local membership alone insufficient. |
| 12.1 | Rank-one b=p⁻¹ | Newton slope −1, associated bundle degree +1 in this convention; replacing divisor generator ξ by 2ξ over a Q_p-algebra gives the same ideal. | Pass sign/marking. |
| 12.2 | Right action by order-three element | Pullback sends point-indicator 0 to indicator 2; the opposite convention sends it to indicator 1. | Pass action direction. |
| 12.3 | Relative height n=1 | Formal deformation dimension 0; first generic level has q−1 frames, not one point. | Pass. |
| 12.4 | Special O_D module, E=ℚ_p, n=2 | Absolute height 4, dimension 2, moduli dimension 1; identifying these three numbers would fail. | Pass. |
| 12.5 | Rank-one period map | Flag target has one point, while first-level fibre has q−1 points; period coordinates alone lose level data. | Pass. |
| 12.6 | Identity quasi-isogeny | Universal-cover map is identity and kernel 0; a zero map has full kernel and fails the modification conditions. | Boundary. |
| 12.7 | Height translation by Frobenius | Heights i map to i±1, so a chosen height-zero component is not stable by itself. | Pass. |
| 12.8 | Rank-one full level tower | Level sizes (q−1)q^(m−1); for q=3 they are 2,6,18, so the completed limit is not a fixed finite level. | Boundary. |
| 12.9 | Rank-one minuscule modification | Cokernel length 1 and degree change 1; identity modification has length 0 and is outside this stratum. | Pass. |
| 12.10 | Functions −z²,−1,−z | Vector-field bracket of first two is −2z=2(−z); opposite chart 1,z²,z gives 2z. | Pass sign. |
| 12.11 | Matrix [[1,1],[0,1]] | Inverse transpose [[1,0],[−1,1]]; transpose alone has +1 and is wrong. | Pass duality convention. |
| 12.12 | Increasing supports with ℓ-adic coefficients | Sequence (1,ℓ,ℓ²,…) tends to 0 ℓ-adically but has infinite support; inverse limit is not interchangeable with finite-support colimit. | Pass order-of-limits control. |
| 12.13 | Degree-two finite étale transition | Proper trace after pullback is 2·id on both compared sides. | Pass. |
| 12.14 | V⊗ρ with tensor-sector extraction | Pairing with ρ∨ extracts V; over characteristic ℓ, averaging a group of order ℓ would require undefined 1/ℓ. | Pass coefficient restriction. |
| 12.15 | Supercuspidal rank n=2 | Surviving degree n−1=1; an Euler class −[V] is consistent with actual H¹=V. | Pass degree/sign. |
| 12.16 | Locally analytic rank-one additive action | Derivative of translation z↦z+t is 1; derivative of the trivial action is 0. | Boundary; topology not certified by this computation. |
| 12.17 | n=1,q=3, first level | Hecke fibre with Tate lattice has 2 frames; zero-dimensional flag alone has 1 point. | Pass. |
| 12.18 | n=1, parameter value 2 | Contragredient parameter evaluates to 1/2, not 2; tensor convention retains the dual. | Pass scalar convention. |
| 12.19 | Quotient heights modulo central scalar ϖI₂ | Central translation 2 becomes 0; Frobenius translation ±1 remains 1 mod 2 and swaps 0,1. | Fail proof step; R05. |
| 12.20 | Supercuspidal n=2 | Cohomology degree 1 and half-twist exponent −1/2; a shifted complex places it in degree 0, not the raw group. | Pass. |
| 12.21 | Constant inverse system with identity maps | lim is the coefficient module and lim¹=0; vanishing of positive cohomology alone does not compute H⁰. | Boundary. |
| 12.22 | Rank-one modification and its dual orientation | Degree changes +1 and −1; the two Hecke orientations cannot have the same sign. | Pass. |
| 13.1 | Unramified standard rank-one pair | Satake value 2 matches 2; weak matching does not fix a ramified N. | Pass sample. |
| 13.2 | Symplectic dimension 4 | Exterior-square decomposition dimensions 1+5=6; unitary classification alone does not construct it. | Boundary; R01. |
| 13.3 | Quadratic induction of an invariant character | Induced representation has two characters and dimension 2; non-invariance is required for cuspidality. | Pass. |
| 13.4 | Definite two-point Shimura set | H⁰ dimension 2, higher groups 0; no middle-degree shift from an indefinite datum applies. | Boundary. |
| 13.5 | Exponents +1/2,−1/2 for GL₂ | Standard quotient trivial; reversed order has Steinberg quotient. | Pass. |
| 13.6 | Local component signs +1,−1 | Product −1 excludes a global multiplicity-one constituent when ε=+1. | Pass. |
| 13.7 | Raw versus normalized compact unit, vol=1/48 | Four fixed vectors give raw trace 1/12 and idempotent trace 4. | Pass normalization; R04 scope. |
| 13.8 | Definite versus rank-two indefinite switch | Definite contribution 2 predicts middle-degree dimension 2·2=4, not equal dimensions. | Boundary under the stated packet hypotheses. |
| 13.9 | N=2 and local normalized product 2 | Definite dimension 2, indefinite dimension 4; a local c_v=0 makes both 0. | Pass. |
| 14.1 | φ_p=0 and fixed other factors | Both Igusa trace and every transferred spectral term 0; this does not prove existence of transfer for nonzero tests. | Pass sample boundary. |
| 14.2 | Full-group GL₂, split torus Newton Levi, δ=4 | n-Red(1) evaluates to 2; extra half-modulus gives Red(1)=4. On −[1], result is −4. | Pass sample; twist and virtual signs retained. |
| 14.3 | Source/Levi modulus factors equal 4 | Source half factor 2, normalized lift 1/2; product 1. Extra inverse half factor would give 1/2. | Pass. |
| 14.4 | Balanced datum | ε=1/2; multiplying by τ(G)=2 gives 1. Replacing ε by 1 doubles the trace coefficient. | Pass. |
| 14.5 | Two equal spectral terms with coefficients 1,−1 | Total trace 0, although each constituent trace is 1. | Pass virtual support boundary. |
| 14.6 | Hecke eigenvalues 2,3 | Separation matrix [[1,1],[2,3]] has determinant 1; repeated 2,2 gives determinant 0 and requires grouping. | Pass. |
| 14.7 | Complex Λ→Λ, zero differential | Euler class 0 but H⁰=H¹=Λ; rationalization kills Λ₀/ℓ while integral torsion remains. | Pass sample; no concentration or integral export. |
| 15.1 | Diagonal eigenvalues 2,3 and empty sum | Trace 5; empty signed sum 0. Coefficients −2,1 on traces 1,2 also give 0. | Pass ledger test. |
| 15.2 | Torus, vol(K)=3, rescaling Haar by 2 | Raw trivial trace 3 then 6; normalized idempotent trace 1 in both measures. | Pass. |
| 15.3 | GL₂ Satake roots 2,3, quadratic base change | X²−5X+6 becomes X²−13X+36; reciprocal Frobenius convention inverts each root. | Pass. |
| 15.4 | Proper balanced unitary endoscopy | ι=1/4, ε=1/2, determinant factor at moving rank 2 is 1/4; these three roles are distinct. | Pass. |
| 15.5 | Quaternionic trivial representation | St₂ elliptic trace −1 equals −1 times inner trace 1; principal-series virtual transfer 0. | Pass. |
| 15.6 | Rational virtual export and bad-prime level | Equal adjacent classes cancel to 0; replacing hyperspecial by congruence unit changes value 1 to 0 at a nontrivial reduction. | Pass rational boundary; R01/R04 remain. |

## Not verifiable

The 221 rows are one representative computation per numbered target. They do not certify every API bullet, every proof sketch, or the full generality of the 37 suppliers. In particular the inaccessible inputs below prevent a complete source certification. LTXZZ theorem numbers were checked in the readable preprint; its cited published page numbers remain uncertified after the NSF copy timed out.

The source service was used for bibliography and additional body citations. Eighteen unresolved works are retained in `needs-references.toml`; searches did not bypass access restrictions:

- `other-ref-5240`, Langlands–Shelstad, transfer factors: GDZ PDF timed out.
- `other-ref-5241`, Kottwitz, elliptic singular terms: GDZ and the Pisa institutional copy timed out.
- `other-ref-5275`, Delorme–Mezo, twisted Paley–Wiener: author's Marseille host unreachable.
- `other-ref-5293`, Jacquet–Piatetski-Shapiro–Shalika, conductors: Columbia author copy timed out.
- `other-ref-5308`, Bernstein–Zelevinsky, GL(n,F): DOI/MathNet request timed out.
- `other-ref-5309`, Schneider–Zink, K-types: Münster author's PDF failed TLS verification.
- `other-ref-5312`, Tate, number-theoretic background: IAS copy timed out.
- `other-ref-5313`, Jacquet–Shalika, highly ramified factors: Columbia author copy timed out.
- `other-ref-5315`, Boyer, Monodromie: author's Paris host failed DNS resolution.
- `other-ref-5316`, Kottwitz, Tamagawa numbers: Annals returned the landing page, not the article.
- `other-ref-5318`, Kottwitz, Shimura points: institutional author-hosted copy timed out.
- `other-ref-5319`, Shelstad, tempered endoscopy I: Rutgers author copy timed out.
- `other-ref-5322`, Vignéras, orbital integrals: Tokyo institutional repository returned HTTP 503.
- `other-ref-5329`, Kim, exterior-square functoriality: AMS returned the journal landing page, not the article.
- `other-ref-5330`, Henniart, exterior-square functoriality: DOI resolution ended in HTTP 403; no legal text found.
- `kottwitz-lie-transfer`: the CiteSeer/archived copy was not found.
- `platonov-rapinchuk`: Cambridge resolved to a book landing page, with no accessible text.
- `waldspurger-fl-transfer`: publisher PDF timed out.

Serre's Galois Cohomology and Faltings–Chai resolved only to uncertified/paywalled material; no new access request is made for them. The source-access failures are not allegations that the cited theorems are false. Helpers only located texts; the findings and mathematical computations are this reviewer's.

## Source issues

These are distinct from defects introduced by this README; several are already corrected there.

- **Error** in other-ref-5281 (Clozel–Labesse appendix) at Theorem A.1.1, pp.120, 122–123: the source says the singular stable formula has no centralizer sign; it should be multiplied by the centralizer's Kottwitz sign; affects a stated result; corrected in print at Clozel–Labesse, Orbital integrals and distributions, §4, Theorem 4.1, pp.112–113.
- **Error** in shin-stableigusa at Lemma 3.9 and Corollary 3.10, p.12: the source says a full inverse-modulus orbital lift is dual to normalized opposite Jacquet restriction; it should be a half inverse-modulus lift; affects a stated result.
- **Error** in shin-stableigusa at the construction preceding (6.10), p.22: the source says to apply its full-modulus lift after another inverse half-modulus; it should be the half-modulus lift directly on the transferred Levi test; affects the proof.
- **Error** in cs17 at §5.4 and Remark 5.4.1, pp.739–740: the source says Red is the three normalized Jacquet/transfer/JL maps; it should be their composite followed by the half-modulus twist in Shin §5.5; affects a stated result.
- **Error** in csnc at Lemma 5.6.2, p.75: the source says all contributing infinity representations have trivial algebraic coefficient; it should be the transferred coefficients Ξ(φ), which need not be trivial for proper endoscopy; affects a stated result.
- **Gap** in csnc at the proof of Lemma 5.6.2, p.76: the source says Frobenius translation alone makes every test geometrically acceptable; it should first clear scalar denominators, including on slope-zero factors, and then shift Frobenius; affects the proof.
- **Error** in shin-counting-igusa at Lemma 6.3, p.19: the source says every test becomes acceptable after Frobenius translation alone; it should also allow a scalar shift when slope-zero support has nonintegral inverse; affects a stated result.
- **Misprint** in scholze-local-langlands at Lemma 6.1, p.15: the source says the descent factor is p^((n−k)r) for general F; it should be q^((n−k)r), with q the residue cardinality; affects a stated result.
- **Misprint** in scholze-local-langlands at Corollary 11.3, p.29: the source says the Hom-sector is indexed by ρ∨; it should be indexed by ρ under the preceding definition and displayed proof; affects a stated result.
