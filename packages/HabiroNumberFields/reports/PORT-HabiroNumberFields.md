# Port report: HabiroNumberFields

Branch: `roadmap/habiro-number-fields`.
Head: `a75a9d866d0d6796de16cd9c5c9cbc1b345f98d7`.
Commit: `HabiroNumberFields: roadmap (README, Suggested.lean, metadata)`.
Baseline: clean worktree at `edbb842`. The committed diff contains exactly `TauCetiRoadmap/HabiroNumberFields/README.md`, `TauCetiRoadmap/HabiroNumberFields/Suggested.lean` and `TauCetiRoadmap/HabiroNumberFields/metadata.toml`. The final worktree is clean. Nothing was pushed and no external write was made.

## Validation

`lake build TauCetiRoadmap.HabiroNumberFields.Suggested` exited 0. Exact outcome line:

```text
Build completed successfully (8976 jobs).
```

Exactly four warnings, all `declaration uses 'sorry'`, at Suggested.lean lines 43, 50, 62 and 71. No other warnings or errors. The build progress line was:

```text
⚠ [8976/8976] Built TauCetiRoadmap.HabiroNumberFields.Suggested (5.9s)
```

Exact push-gate summary, exit 0:

```text
gate HabiroNumberFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Exact output of the prescribed dependency-direction command with `--movable`, exit 0:

```text
depcheck: 30 roadmaps, 275 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. A preliminary full gate failed only because the new folder was uncommitted (`dirty=1`); the final full gate above was run on the clean committed worktree. No tooling or merge-order file was edited. The candidate check also exited 0. `git diff --check` passed. All 54 numbered subsection titles are retained, and every numbered subsection has at least three Checks.

## Draft pull request body

Build number-field Habiro rings and K₃-indexed invertible modules from finite Chern classes, cyclic dilogarithms and integral local regulators. The roadmap develops finite-regulator comparison, Frobenius-twisted Taylor gluing, corrected local sections and effective global descent, then tensor equivalences, a Picard character, field pullback and multiplicative transfer. Full cyclotomic coefficient algebras and all positive orders are retained, with explicit normalization and small-residue-field comparisons.

Prepared with Codex (GPT-6). The acceptance file states four finite identities against the pinned APIs; the README specifies the arithmetic constructions and their proof obligations.

## Suppliers and ownership

The direct suppliers that are new roadmap pull requests in the supplied content index are: StableHomotopyKTheory, GeneralAlgebraicKTheory, KTheoryFiniteLocalFields, HabiroCyclotomicCompletions, PolylogarithmFunctions, ColemanIntegration, QWittVectors, QSeriesPartitionsAndMockModularForms, ArithmeticKTheory, K3BlochGroups and K2SymbolsBrauerPartII. PadicHodgeRegulators is also an earlier supplier in the supplied merge order; its available board package was read at head `5eff35d`. It has no content-roadmap entry in that index. LocalFieldsRamification, LocalGaloisGroups and Chebotarev are read as on main, together with the pinned library, rather than through revisions of their existing roadmaps.

The roadmap resolver reports one lead: `PadicHodgeRegulators §§5.6: no roadmap PadicHodgeRegulators on main or in an open pull request`. This is an index limitation, not an absent contract: the supplied board index identifies its package and head, and its actual §§5.6–5.9 and completed-K₃ supplier block contain the consumed statements. The resolver reports no missing Lean names, but says external names were not checked on its host. Those were inspected directly in the local pinned packages.

Read the main models `TauCetiRoadmap/GlobalQuadraticForms/README.md`, `Completed/NumberFieldArithmetic/README.md` and `TauCetiRoadmap/LocalFieldsRamification/README.md`, plus the normative root README and CONTRIBUTING. Read the accepted package and its repair/review decisions. No helper agents were used.

Used the roadmap list, object grep, show and resolve tools. Searched every active/completed roadmap on main, board-package texts, and all 29 explicitly supplied sibling heads, both README and Suggested.lean. The supplied heads include the unrelated geometry and number-theory folders, not just Habiro work. Broad object searches were followed by narrow searches to avoid the grep tool's result cap. No additional unspecified open head was sought, and no declaration duplicates another readable roadmap's fully qualified name. Search hits in revisions of existing roadmaps were not adopted as suppliers. Web searches of Mathlib and Zulip did not identify a competing Habiro or cyclic-dilogarithm API; the mathematical contracts use the actual pins rather than search-result assertions.

Ownership retained here: finite Chern untwisting and ordinary-unit lifting; cyclic regulator and KMS proof; arithmetic full-algebra chart and assembly; first-jet correction; coherent indexed-line transitions, descent and arithmetic functoriality. HabiroNahmSeries is downstream for the unconditional eta calibration, and HabiroRings is downstream for relative rings and transported modules. The generic completion, Bloch, K-theory, completed Frobenius and local-regulator constructions retain their earlier owners. The new residue-two target compares supplied carriers; it reconstructs neither a Bloch presentation nor a finite-field K-group.

### Supplier replacements and duplication removals

- KTheoryFiniteLocalFields §1.8 already states the signed mixed unit–Bott product formula. Section 1.10 now consumes it and retains only its eta evaluation and the CGZ–GSWZ normalization diagram. The removal is recorded in Scope and ownership.
- The all-order Chern assembly reference to KTheoryFiniteLocalFields §0.3 was wrong: that section is Eilenberg–Moore comparison. The contract now uses the primary constructions and finite-product coefficient assembly of §1.8.
- Kept the accepted replacements by ArithmeticKTheory §6.13 for Picard invariant vanishing, KTheoryFiniteLocalFields §1.2 for Bott classes, QWittVectors §6.1 for completed Frobenius, and HabiroCyclotomicCompletions for generic completion, re-expansion, integral Taylor detection and CRT. No duplicate versions were added.
- Added exact native Artin, cyclotomic irreducibility, Fourier and Chebotarev declarations to the supplier contracts. Their hypotheses are retained. Native Selmer membership is distinguished from the ordinary-unit image theorem.
- The accepted exceptional-characteristic-two concern is retained with its all-prime scope. At the readable K3BlochGroups head, §3.13 computes B_old(𝔽₂), while §§5.4–5.5 restrict the generic comparison to q≥4. Consequently §1.11 now owns the precise arithmetic extension B_old(𝔽₂)/3≃K₃(𝔽₂)/3, positive cyclic normalization and number-field reduction square. The group calculations remain supplied. This closes the package's unsupplied comparison contract without deleting ℓ=2 or replanning the generic Bloch theory.
- No supplier later in the merge order was introduced. No target was moved down from a later roadmap. The only ownership localization above is an arithmetic comparison missing from the actual earlier head, rather than a reconstruction of its objects.

## Lean acceptance test and elaborated binders

Nothing moved from Lean to README in this port. The accepted file already has the required form and is byte-for-byte unchanged: one `import Mathlib`, two real definitions, four admitted headline theorems, no examples, no data admitted with sorry and no options. Existing README-only auxiliary targets and Checks remain there. The carrier search at the pins confirms the heavy K-theory, Bloch, Habiro-completion and indexed-module interfaces are not available; the module docstring identifies those unstatable headlines. No stand-in was added.

A scratch file imported the built module and put `#check @name` on every one of its six declarations. It elaborated once with exit 0 and no diagnostics other than the printed types. Each type was compared with README §§1.1–1.3:

| Declaration | Elaborated hypotheses | Comparison and change |
|---|---|---|
| cyclicDilog | Arbitrary universe; CommRing R; n, ζ, x | Matches the total integral product. No change. |
| cyclicDilog_quasiPeriodicity | Field K; n>0; primitive ζ of order n; s≤n | Matches the cleared identity, including zero factors. No change. |
| cyclicDilog_one_pow_twentyFour | Field K; n>0; primitive ζ; (n:K)≠0 | Matches positive invertible orders, including even n. No change. |
| cyclicHypergeom | Arbitrary universe; Field K; n, ζ, x, y, z | Matches total field division, including singular inputs. No change. |
| cyclicHypergeom_shift | Field K; n>0; primitive ζ; xⁿ,yⁿ≠1; displayed hypersurface | Matches its exact nonsingular domain. No change. |
| kms | Field K; n>0; nonzero n in K; primitive ζ; x,y,z≠0; xⁿ,yⁿ≠1; xⁿ≠yⁿ; hypersurface | All denominator guards and even-order scope match. No change. |

No section binder was lost. The explicit nonzero-n hypotheses are redundant over a field containing a primitive n-th root with n>0, but were retained to match the accepted invertible-order formulation; this is a harmless P3 observation, not a weakening or a new finding.

## Upstream mathematics read and fixes

Read the whole ported README again, including every API bullet and Check. In addition to the supplier repairs above:

1. Corrected the order-15 Check: ζ₃=ζ₁₅⁵ and ζ₅=ζ₁₅³. The package had those two powers in the opposite order.
2. Corrected the source and target labels of the local chart proof. Taylor sends q to ζ_m+x; the inverse lifts the cyclotomic root into the completed polynomial ring and sends x to q minus that lift.
3. Gave the Gaussian and product-limit milestones actual functions, coefficient domains, compact-uniform tail quantifiers and a complete product-limit formula. The computed center has S=4/9, C=169/36 and order-one product constant 2/3. This preserves the accepted scale and phase conventions rather than relying on the abbreviated appendix.
4. Added the algebraic-density target required by analytic-to-integral KMS descent. Monic freeness gives torsion-freeness, but does not make a neighborhood on one irreducible component determine every component. The roadmap now proves the complex hypersurface is a domain using a simple-zero Eisenstein argument, then applies the identity principle at every primitive cyclotomic embedding. Added a reducible negative control.
5. Made the exponential corollary's power-series carrier, constants, coefficient integrality and p>2 domain explicit. Its hypotheses remain those used by the accepted unramified local construction.
6. Made §3.15's global freeness criterion precise: a section trivializes the line exactly when its multiplication map is an isomorphism after every named conservative chart base change; freeness is existence of such a section. This retains the distinction between invertibility and freeness, including for abelian fields.
7. Expanded every construction's mathematical API into prose bullets, keeping the original targets, hypotheses, examples and source locators. Added separate Kummer-sign, root-torsor, zero-ring, empty-chain and analytic-scale controls. Added universe and tensor-base conventions, explicit reference IDs and exact supplier headings. No API padding was put into Lean.

The source/version distinctions and accepted corrections were preserved: old versus published Bloch conventions; the negative unshifted Pochhammer half power; the negative Dwork residue; positive Bott Bockstein; completed rather than rational local K₃; full coefficient factors; the local integral first jet; linear rather than nonlinear global membership; conditional calibration independent of Nahm construction; and effective descent before tensor/Picard conclusions.

## Source and pin evidence

Pins verified from the manifest and both checked-out packages: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Bibliographic sources were read as data. All downloaded texts were PDFs, never executable code. Seven primary PDFs plus the published CGZ PDF matched the source package's SHA-256 values. Direct BG PDF retrieval timed out; its author-hosted indexed text exposes the §7.1 table, including d=4 among the trivial tame kernels. The accepted BG printed-page locator is retained; no fresh BG hash verification is claimed.

Extraction lines below identify the text read in this port; the README also carries printed theorem, equation and page locators, so extraction renumbering does not determine the citation.

| Source locator | Verified use |
|---|---|
| CGZ line 107 (published) | Remark 1.4: the exceptional integers and the 9∤n refinement. |
| CGZ line 147 (published) | Theorem 1.5, with the unit-image and prime-coefficient statement; squarefree assembly is the explicit CRT target. |
| CGZ line 160 (published) | Theorem 1.6 and its scalar comparison. |
| CGZ line 497 | Proposition 2.5 and the powered-lift issue; uniqueness is retained only in the appropriate eigenclass setting. |
| CGZ line 610 | Root, order and field compatibilities; extension of power classes is not asserted injective. |
| CGZ line 667 | Five-term factorization in Theorem 2.11. |
| CGZ line 792, line 826, line 842 and line 859 | Restriction injectivity, repeated-prime condition, S-unit representatives and ordinary-unit lifting. |
| CGZ line 1078 | Local Chern comparison; its residue-characteristic restriction does not supply ℓ=2. |
| CGZ line 1143 and line 1180 | Exact-valuation eta reduction and higher-order divisibility. |
| CGZ line 1666 | Eta evaluation used only as the conditional refinement's downstream input. |
| GZ line 121 and line 317 | Lemma 2.1 and its proof; the leading unshifted product has negative half power after inversion. |
| GZ line 816, line 833 and line 836 | Finite KMS formula, printed half-power issue and analytic-locus reduction. |
| GZ line 844 and line 881 | Ramanujan product and Gaussian comparison; the port specifies tails, scale, phases and algebraic density separately. |
| H2024 line 175 and line 182 | Negative degree-three Soulé product, consumed from its actual earlier owner. |
| H2024 line 282 and line 293 | The printed tensor-identification sign requires an explicit normalization comparison. |
| H2024 line 337 | Eta restriction as root times Bott. |
| H2013 §§6.2–6.4, pp.31–33 | Positive cyclic/configuration route; generic foundations remain supplied. |
| GSWZ line 360 and line 393 | Local and global section definitions; linear global membership and the first-jet correction are specified separately. |
| GSWZ line 771 and line 776 | The coefficient p/(1−q)=−p/x fixes the residue sign. |
| GSWZ line 1932 and line 1951 | Completed local K₃ theorem and Dwork integrality with a separate first coefficient. |
| GSWZ line 1995 and line 2093 | Exponential corollary and half-shifted sections. |
| Q line 615, line 698 and line 743 | Completed Frobenius, compatible roots, and the false irreducibility step replaced by a full-algebra separability argument. |
| W-thesis §2.2, items 2.7, 2.11–2.12, pp.29–32 | Same Frobenius and Taylor descriptions; the complete PDF was hash-verified. |
| BG line 1268, §7.1, p.24 | Accepted extraction locator; the author-hosted indexed table includes discriminant magnitude 4 among trivial tame kernels. |

The cited supplier sections were read, not inferred from their titles. StableHomotopyKTheory §§7.2–7.4 and 7.33 retain coefficient-product restrictions. GeneralAlgebraicKTheory §§2.1–2.4, 3.2, 7.4–7.8 and 13.8c supply ring models, products, transfer and finite-field groups. KTheoryFiniteLocalFields §§1.2,1.5,1.8,2.1,3.0a,6.5a–6.6,7.1–7.4 supply the named Bott/Chern/rigidity/completion contracts. ArithmeticKTheory §§3.4,4.1–4.4,5.2–5.3,6.1,6.13 and K2SymbolsBrauerPartII §5.2 supply the global diagrams. HabiroCyclotomicCompletions §§1.1–1.5,3.1–3.3,4.5–4.8,5.2–5.4 supplies generic ordinary completion, including arbitrary component products. QWittVectors §§2.4,6.1 supplies the completed Frobenius, including zero completion. PolylogarithmFunctions §§1.1–1.7,3.2,3.4 supplies the stated branches; its wider inversion-domain wording is not used on the positive real cut. QSeriesPartitionsAndMockModularForms §§1.2–1.6,2.3,2.5,5.2 supplies regular integer quotients, bilateral convergence, summation and eta. ColemanIntegration L2.16–L2.18 and L3.Fa.2–L3.Fa.4 supplies its branch-aware functions and de Jeu complexes. PadicHodgeRegulators §§3.2–3.3,3.6,5.4–5.9 and its completed-K₃ block supplies the actual completed root classes, finite integral presentations, p² lattice, naturality and transfer-to-trace.

| Native declaration or object | File at the pin; retained condition |
|---|---|
| IsPrimitiveRoot.autToPow, autToPow_spec | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:784`, line 821; NeZero n and primitive root. |
| NumberField.discr | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36`; full ring-of-integers discriminant. |
| NumberField.Units.rank, torsionOrder | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:358`; `Mathlib/NumberTheory/NumberField/Units/Basic.lean:174`. Rank is the number of infinite places minus one. |
| NumberField.InfinitePlace.nrComplexPlaces | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:441`; cardinality of complex places. |
| Ordinary Selmer and unit injection | `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161`, line 231; positive n for unit injection. |
| S-unit injection and obstruction | `TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/Basic.lean:186`, line 269, line 296; last range theorem needs NeZero n. |
| Kummer class, injectivity, isomorphism, transport | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:341`, line 360, line 384, line 537; invertible n and equivariant coefficient equivalence for transport. |
| Inner compatible pairs | `TauCeti/RepresentationTheory/Homological/ContCohomology/InnerConjugation.lean:297`; locally compact group, smooth discrete coefficient representation, actual compatible inner pair. |
| Joint eigenvectors and Fourier projectors | `TauCeti/LinearAlgebra/Eigenspace/JointEigenvector/Basic.lean:368`, line 384; finite commutative group, enough roots, invertible group order. |
| Local Frobenius and order | `TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:164`, line 178, line 237; unramified local extension and its integral congruence. |
| Local cyclotomic irreducibility | `TauCeti/NumberTheory/Cyclotomic/Irreducible.lean:115`; p prime, all natural prime-power exponents. |
| Root character and ordinary S-units | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:212`; `Mathlib/RingTheory/DedekindDomain/SInteger.lean:108`; nonzero order and the stated root-count hypothesis for the character. |
| Power-class quotient and map | `TauCeti/Algebra/Group/PowerClassGroup.lean:48`, line 52; commutative multiplicative groups. |
| Cyclic homology and bar differential | `Mathlib/RepresentationTheory/Homological/FiniteCyclic.lean:242`; `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:122`; `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean:191`; positive generator comparison remains a target. |
| Inflation–restriction | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:402`; actual quotient/invariant coefficient representation, not unrelated maps. |
| Arithmetic Artin symbol | `TauCeti/NumberTheory/NumberField/ArtinSymbol.lean:57`, line 113; unramifiedness is an explicit argument, target is conjugacy classes. |
| Chebotarev and finite deletion | `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:74`, line 83; finite Galois number-field extension. |
| Adic completeness | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`; native class extends both IsHausdorff and IsPrecomplete. |
| Standard étale and lifting | `Mathlib/RingTheory/Etale/StandardEtale.lean:48`; `Mathlib/RingTheory/Smooth/AdicCompletion.lean:94`; `Mathlib/RingTheory/Unramified/Basic.lean:161`. Formal smoothness gives existence, unramifiedness and separatedness give uniqueness. |
| Discriminant and étale criterion | `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:191`; `Mathlib/RingTheory/Smooth/Fiber.lean:245`. Finite presentation and flatness accompany formal unramifiedness. |
| Cyclotomic separability | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:652`; positive order invertible in the residue field, rather than irreducibility. |
| Power-series rescaling/substitution | `Mathlib/RingTheory/PowerSeries/Basic.lean:559`; `Mathlib/RingTheory/PowerSeries/Substitution.lean:157`. Total substitution notation alone supplies no convergence for a nonnilpotent constant. |
| Picard group | `Mathlib/RingTheory/PicardGroup.lean:155`, line 484, line 494, line 502; actual invertible modules and actual linear equivalences. |

In particular, the native Selmer carrier is defined by `∀ v, v ∉ S → valuationOfNeZeroMod n x = 1`. It does not include an ordinary-unit representative or a chosen representative. The native adic-completeness class includes separation, whereas a bare inverse limit or a formal substitution symbol does not establish the convergent re-expansion needed here. The pin search for Habiro, Bloch groups, cyclic dilogarithms, bilateral q-series and q-Pochhammer constructions found no competing headline carrier; the q-Pochhammer occurrence in `Mathlib/RingTheory/Polynomial/Pochhammer.lean` is a TODO, not an implementation.

## Adversarial mathematics pass

This is a consistency audit of the stated mathematics, not a proof of the admitted identities or the heavy construction targets. Finite identities were computed independently with exact finite fields and integral cyclotomic quotients. Rational, bar-chain, determinant and jet computations used exact integer/rational arithmetic. Analytic constants were checked numerically as specified below. Rows for heavy theorems explicitly identify the tested specialization; they do not claim a completed formal proof.

The table records every definition/convention and each theorem/API assertion, separating distinct mathematical assertions even where they share a subsection. Repeated uses of the same operation were tested again against its convention: Frobenius in gluing, untwisting, extension and pullback; Kummer sign in Chern and eta; the first jet in Dwork and sections; whole-series norm in local defects and global transfer.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Convention: coefficient completion | R=ℤ[1/6], p=3 | R/3ᵃR=0 for every a≥1; completion=0; tensor R⊗ℤ₃=ℚ₃≠0 | Distinction holds | Retained |
| Convention: full cyclotomic algebra | K=ℚ(i), m=4 | Degree over K=φ(4)=2; K×K has dimension 2, selected field has dimension 1 | All factors necessary | Retained |
| Convention: coefficient universe/empty products | CommRing zero ring; n=0,1 | D=1=0 in zero ring; f₀=0 over fields | Native total meanings agree | Added zero-ring Check |
| Convention: compatible complex roots | Orders 2,3,6 | ζ₂ζ₃=exp(5πi/3); independent exp(2πi/6) differs | Compatibility separates models | Retained |
| Convention: inverse character | n=5, χ(σ)=2 | χ⁻¹=3; 2·3=1 modulo 5; 2·2=4 | Weight direction fixed | Retained |
| Convention: positive Kummer | α³=2 over 𝔽₇ | α⁷/α=4; inverse convention gives 2; cubes={1,6} | Signs differ | Added explicit witness |
| Convention: old Bloch degeneracies | n=3 | [∞]+2[0]=−[0]+2[0]=[0]≠0 in C₃ | Retaining [0] necessary | Retained |
| Convention: raw/positive Chern | Cubic power classes | Raw eta exponent −1=2; positive exponent 1; squares give 1 and 2 respectively | Squaring does not erase sign | Retained |
| Convention: additive/multiplicative coordinate | m=1,2,3 | x=−u, u, −ζ₃u; inverse product (−ζ₃⁻¹)(−ζ₃)=1 | Root factor necessary | Retained |
| Convention: formal half power | m=2, q=−exp(h) | exp(h)=1+… has constant 1; ordinary q has constant −1 | Branches differ | Retained |
| §0.1 character equations in quotient | G=1; invariant class with representative ratio vⁿ | Equation u=u; quotient ratio [vⁿ]=1 although vⁿ need not be 1 | Representative condition would be stronger | Retained |
| §0.1 integral eigen-exactness obstruction | n=9, six-element cyclotomic G | Weighted augmentation on eigenvectors has values 6a={0,3,6}; target has 9 values, including 1 | Surjectivity fails as intended | Retained |
| §0.1 supplied averaging boundary | n=9, G of order 6 | gcd(6,9)=3, so 6 is nonunit; at n=5, G of order 4, 4⁻¹=4 | Actual projector hypotheses discriminate | Exact supplier hypotheses added |
| §0.2 excluded integers | F=ℚ and ℚ(i) | (M,M′)=(12,4) and (24,8) | Positive prescribed integers | Retained |
| §0.2 good-order implications | n=1,3,9,35 | gcd(1,12)=1; gcd(3,4)=1 and 9∤3; 9∣9; gcd(35,12)=1 | Exceptional 3-power distinguished | Retained |
| §0.2 repeated-prime condition | F=ℚ, n=9 versus 25 | w₂(ℚ)=24; 3 divides 24, 5 does not | Correct obstruction | Retained |
| §0.3 finite Chern definition | n=1, r=1,2; F containing μ₃ | Mod-one groups=0; trivial relative G does not remove the map at n=3 | Definition includes required boundaries | Retained |
| §0.3 coefficient untwisting | n=5, k=2, r=1,2 | Root-change factors 1 and 3; t_(ζ²)=2t_ζ at weight 2 | Inverse exponent agrees | Retained |
| §0.3 additivity/scalars | ξ=0; 2ξ | c(0)=1; c(ξ+ξ)=c(ξ)² | Multiplicative quotient convention | API made explicit |
| §0.3 field naturality | Cubic class ζ₃; extension to ℚ(ζ₉) | ζ₃=(ζ₉)³, so restriction of its class is 1 | Naturality allows a kernel | Retained |
| §0.3 order compatibility | n=15 to 3,5 | Root orders of ζ⁵ and ζ³ are 3 and 5; opposite powers have orders 5 and 3 | Correct arrows | Corrected reversed Check |
| §0.4 scalar Sah | C₂ acting by −1 on 𝔽₃ | Cocycles={0,1,2}=coboundaries; H¹ has 1 element | Scalar consequence consistent | Retained |
| §0.4 Sah nonvanishing control | C₃ on trivial 𝔽₃; G=1 | a−1=0; H¹(C₃,𝔽₃) has 3 elements; H¹(1,𝔽₃)=0 | No spurious invertible scalar | Retained |
| §0.4 nonabelian inner action | S₃ and Q₈ abelianizations | Inner conjugation fixes both C₂ classes for S₃ and all four C₂×C₂ classes for Q₈ | Compatible inner action, not arbitrary endomorphism | Native contract retained |
| §0.4 finite Chern injectivity | ℚ, n=3 and n=9 | n=3 has no repeated prime; at n=9, 3∣w₂=24 | Squarefree scope preserved | Retained |
| §0.5 finite-endomorphism theorem | Every cyclic A of orders 1…20, f=a, n=0…20 satisfying premise | 3628 premises; each ker f∩A[n]={0}; zero counterexamples | Exact finite check | Retained |
| §0.5 omitted-finiteness control | A=ℚ/ℤ, f=3, n=3 | f(A)=A; intersection={0,1/3,2/3} | Infinite countermodel excluded | Retained |
| §0.5 zero/n=0 controls | A=0; finite A and n=0 | A[0]=A; surjective f has kernel 0; zero group gives 0=0 | Total n included | Retained |
| §0.5 Picard quotient convention | p=5, χ=2 | Relation 2σb−b=0 gives σb=3b; diagonal twist 2·3=1 | Inverse twist matches supplier | Imported corollary retained |
| §0.6 exact eigenclass lifting | Injective identity U→U; zero class | Unique lifts are the input and 0; two lifts differ by kernel 0 | No averaging needed | API made explicit |
| §0.6 valuation-image lattice | D=3ℤ, n=3 | D/3D={0,3,6} modulo 9; ambient images in ℤ/3 are all 0 | Saturation shortcut fails | Retained |
| §0.6 cyclotomic prime description | F=ℚ, p=3, a=2 | Degree=e=φ(9)=6; residue degree 1; one prime | Exact local arithmetic values | Native irreducibility cited |
| §0.6 ordinary-unit lift | Trivial character on D=ℤ; nontrivial tame χ at p=3 | Trivial weight gives D/3=C₃; χ=−1 gives (χ−1)=1 modulo 3 and zero eigenpart | Tame unit is required | Retained |
| §0.7 S-unit theorem | n=1; unit 1 and S-unit 2 over ℤ[1/2] | Mod-one class=1; valuations v₂(1)=0, v₂(2)=1 | Ordinary units and S-units separated | Retained |
| §0.7 composite-order assembly | n=35 | CRT moduli 5,7 are coprime; roots ζ₃₅⁷ and ζ₃₅⁵ have orders 5,7 | Coefficient fields remain explicit | Retained |
| §0.8 free character multiplicity | F=ℚ; F=ℚ(∛2) | r₂=0 and 1; nontrivial odd free multiplicities 0 and 1 | Galois-closure shortcut unnecessary | Retained |
| §0.8 torsion dimension | F=ℚ, p=3,5,7 | Dimensions 1,0,0; at p=3 μ₆/(μ₆)³=C₃ | Free rank alone insufficient | Retained |
| §0.8 trivial character | F=ℚ and imaginary quadratic F | r₁+r₂−1=0 in both cases | Trivial case differs from nontrivial odd formula | Retained |
| §0.9 Chern unit theorem | ℚ, n=5 and reduced n=3 | Both mod-five groups=0; cubic unit target=C₃ | Boundary/cardinality consistency | Retained |
| §0.9 prime-power/squarefree distinction | n=25 and n=35 over ℚ | gcd(25,12)=gcd(35,12)=1; 35 squarefree, 25 not | No unpromised prime-power surjectivity | Retained |
| §1.1 cyclic product definition | n=0,1,2,3 | 1,1,1+x,(1−ζx)(1−ζ²x)² | Orientation and exponents fixed | Retained |
| §1.1 coefficient maps/polynomial evaluation | n=2; reduction ℤ→𝔽₅ | Polynomial 1+x maps to 1+x; at x=2 both give 3 | API agrees with finite product | API made explicit |
| §1.1 nonvanishing | x=0 and x=ζ⁻¹, n>1 | D(0)=1; D(ζ⁻¹)=0 | Vanishing input excluded | Retained |
| §1.1 quasi-periodicity | (n,ℓ)=(1,7),(2,11),(3,19),(4,17),(9,73), all x,s≤n | 14,33,76,85,730 instances; both-side differences all 0 | Includes zero factors and endpoint shifts | Retained |
| §1.1 exact phase at one | n=3 | D(1)=ζ(1−ζ)³; D(1)²=−27ζ² | Positive phase agrees | Retained |
| §1.1 phase-free theorem | Exact ℤ[t]/Φ_n, n=1…16 | D(1)²⁴−n^(12n)=0 for every n | Exact arithmetic | Retained |
| §1.1 ambient power class | ℚ(ζ₃)⊂ℚ(ζ₉) | [D(1)]=[ζ₃]≠1 below; D(1)=(ζ₉(1−ζ₃))³ above | Ambient field matters | Retained |
| §1.2 total finite sum | n=0,1; rational n=2 triple (2,3,5) | 0,1,23/3 | Definition agrees with rational evaluation | Retained |
| §1.2 diagonal formula | n=3, x=y=0, z=ζ₃ | 1+ζ₃+ζ₃²=0 on both sides | Nonsingular diagonal works | Retained |
| §1.2 singular diagonal control | n=2, x=y=−1, z=1 | Total sum=1 from 0/0=0; geometric sum=2 | Missing denominator guard would be false | Retained |
| §1.2 period and shift | Same finite fields as KMS, plus n=3 over 𝔽₇ | Shift counts 36,82,282,324,1230,2094,3290,9486,30; all differences 0 | Nonzero and zero x,y included where admissible | Retained |
| §1.3 KMS | n=1,2,3,4,5,6,7,9 over respective prime fields 7,11,19,17,31,37,43,73 | Admissible triples 20,32,108,128,500,864,1372,4374; all differences 0 | Even and odd orders pass | Retained |
| §1.3 exact even-order KMS | n=2, x=1/2,y=1/3,z=3√6/8 | Both sides −2/9−4√6/27; relation 3/4=3/4 | Exact sign control | Retained |
| §1.3 denominator guards | X=Y; X=1; z=0 | X=Y forces Z=1 and D(ζ/z)=0; other inputs violate explicit guards | No divided junk value | Retained |
| §1.3 analytic center/annulus | X=1/5,Y=2 versus X=9/10,Y=2 | 1/10<4/5<1; negative control 9/20>1/10 | Valid and invalid neighborhoods separated | Retained |
| §1.3 Gaussian limit | n=1,2,3; ε=.05,.025,.0125 | Errors respectively (.01457,.00727,.00363), (.03103,.01546,.00772), (.05635,.02806,.01400) | Converges toward stated scale | Functions and tails specified |
| §1.3 product-limit constant | Center, n=1 | C=169/36; (4/13)√C=2/3; Gaussian constant √S=2/3 | Both constants agree | Added complete formula/Check |
| §1.3 phase comparison | Center, n=2…5 | Product versus Gaussian constant differences <4e−16,7e−16,3e−15,8e−15 | Finite constants match phases | Explicit target |
| §1.3 root Pochhammer asymptotic | n=1,x=−1; ε=.1,.05,.025 | .7041666325,.7056351755,.7063705951 → 1/√2=.7071067812 | Negative half power required | Accepted correction retained |
| §1.3 eight-term dilogarithm | Center | Residual 1.992e−57 at 60-digit arithmetic; asserted RHS=0 | Numerical consistency | Retained |
| §1.3 missing-log negative control | Center | Five-term remainder=.110451705752…=½log²(8/5), versus 0 | Dropping phase/log terms fails | Retained |
| §1.3 Landen identity | w=0 and center w=−4/5 | Both sides 0 at 0; derivative on each side Log(1−w)/(1−w) | Normalization fixed | Owned target retained |
| §1.3 algebraic density | n=1,2; reducible control | n=1 quotient=ℂ[y,z]; n=2 generic z-zero has derivative −2(1−y²)z≠0; x−1 at x=1 is 0 but at x=−1 is −2 | Torsion-free reducible model fails inference | Added density/irreducibility target |
| §1.3 integral descent | n=1; monic degree n over free cyclotomic base | Basis in x has n entries; n=1 has one; no integer torsion | Distinguishes freeness from density | Every primitive embedding specified |
| §1.4 Kummer value/degeneracies | X=0,1,∞ at n=3 | D(1)⁻¹,1,D(1); product at 0,∞=1 | Degenerate normalization retained | Retained |
| §1.4 root-lift independence | Orders 5,7,9,15,25 over quadratic fields at ℓ=19,13,17,29,149 | 85,77,135,405,3675 lift changes; quotient class residual 1 in every test | Needed radicals matter | Retained |
| §1.4 inversion | Same fields, all base X≠0,1 | 17,11,15,27,147 values; P(X)P(X⁻¹) has trivial power class | Exact finite-field check | Retained |
| §1.4 obstruction/descent | Formal [32] versus ordinary zero class | Boundary 5(2∧−31), versus 0; finite K₂ boundary has tame value 2, versus 1 | Not every symbol descends ordinarily | Retained |
| §1.4 universal-extension requirement | Trivial finite witness over ℚ, n=2 | H¹(1,μ₂)=0; ℚˣ/(ℚˣ)² contains [2]≠1 | Finite-witness isomorphism rejected | Retained |
| §1.5 regulator/additivity | ξ=0 and an n-th-power representative | R(0)=1; power-class representative vⁿ has class 1 | Correct neutral element | API explicit |
| §1.5 root law | k=−1 and k=2 modulo 5 | Inverse exponent −1 and 3; exponent 2 would have 2·2=4≠1 | Orientation retained | Retained |
| §1.5 order distribution/CRT | n=15 to 3,5 | Root exponents 5,3; coefficient reductions have those orders | Exact order arrows | Fixed Check |
| §1.5 powered lift set | n=1 and n=5, ξ=0 over ℚ | Singleton {1} in both root-free cases | Unique domain tested | Added explicit Check |
| §1.5 powered ambiguity | F=ℚ(ζ₃), n=3, ξ=0 | 1 and [2] both restrict to 1; v_(2)(2)=1 not divisible by 3 | Unrestricted uniqueness false | Retained |
| §1.5 five-term factorization | n=1; cyclic identity in tested finite fields | Five values all 1 at n=1; KMS residual 0 on every tested admissible triple | Boundary and nonsingular route agree | Retained |
| §1.6 étale Bloch exactness | Ordinary zero class; ℚ,n=5,[32] | Boundary 0 for ordinary class; tame {2,−31}=2 mod31 of order 5 | Larger group distinguished | Retained |
| §1.6 unit-image limitation | [32], primes over31 | Valuation residues 1,2,3,4 versus all 0 for ordinary units | Ordinary-unit theorem not overextended | Retained |
| §1.6 coefficient comparison | n=1; F containing μ₃ at n=3 | Mod-one sequence 0→0→0; latter field violates root-free premise | No silently enlarged domain | Retained |
| §1.7 eta definition | n=3 and n=5 | [0]; at n=5 the nondegenerate arguments −1.61803398875 and .61803398875 for ζ,ζ² | Root choice matters | Retained |
| §1.7 eta root scaling | k=−1 and k=2 modulo5 | (−1)²=1; 2²=4 | Eta degree is quadratic | Retained |
| §1.8 positive bar chains | N=1 and N=3 | Boundaries 0,0 at N=1; dα₂=3[t], dα₃=0 at N=3 | Positive Bockstein fixed | Retained |
| §1.8 supplied Bott comparison | ζ₃ over ℚ(ζ₃) and ζ₃I over M₃ | K₁ class ζ₃≠1 in field; determinant ζ₃³=1 in matrix ring | Noncommutative nonunit inference excluded | Retained |
| §1.8 root/invertibility laws | ζ→ζ⁻¹; ℤ[ζ₃] before inverting3 | Bockstein changes +[ζ] to −[ζ]; 3 nonunit but coefficient class defined | Bott and étale domains differ | Retained |
| §1.9 diagonalizer | A=[[ζ,ζ⁻¹],[1,1]] | det A=ζ−ζ⁻¹; corrected determinant=(ζ−ζ⁻¹)/(ζ−ζ⁻¹)=1 | Actual SL conjugation | Retained |
| §1.9 eta restriction | k=2 modulo5; extension degree 2 | Product of two root-scaled degree-one factors scales by4; 2⁻¹=3 modulo5 | Sign/degree convention consistent | Retained |
| §1.10 raw product/eta sign | n=3; a=1 | Raw eta exponent2; positive exponent1; a=1 gives class1 | Maps fixed before evaluation | Product formula supplied |
| §1.10 normalization control | 𝔽₇, cubic classes | Cubes={1,6}; [2]≠[4]; inverse squares still differ | Diagram is substantive | Retained |
| §1.11 local regulator definition | n=3, ℓ=5 | Cube map on C₄ has inverse exponent3; ζ₃ lies in 𝔽₂₅, not 𝔽₅ | Correct residue algebra | Retained |
| §1.11 exceptional comparison | n=3, ℓ=2 | In 𝔽₄: D(1)=ζ, R([0])=ζ²; cubes={1}; both source/target order3 | Positive comparison nontrivial | Explicit arithmetic target |
| §1.11 reduction requirement | Global representative with valuation1 at 𝔮 | Residue=0, not a unit; valuation-zero representative gives nonzero residue | S-unit avoidance required | Retained |
| §1.12 exact-valuation generator | n=3, ℓ=5 and 17 | v₃(6)=1; v₃(18)=2; order-three root has nonzero versus zero cubic power class | Eta alone not detecting at larger valuation | Retained |
| §1.12 local-isomorphism calibration check | Every odd n=3…27; first four exact-valuation eligible primes | 52 computations; R(eta)/ζ² is an n-th power in every case, including separate 𝔽₄ computation | All listed Checks consistent | Retained all-prime scope |
| §1.12 valuation witness | Unique nonzero-weight factor at weight1 versus weight0 | Valuations 1 versus 0 modulo p | Weight-zero factor proves nothing | Retained |
| §1.13 Chebotarev detection | Nontrivial cyclic C₃ class; C₂ inversion | Detecting class density 1/3; zero sets for a and 2a agree | Detects subgroup, not chosen generator | Native supplier exact |
| §1.13 eta scalar comparison | n=5 at ℓ=19 versus149 | v₅(20)=1 and ζ class order5; v₅(150)=2 and ζ class trivial | One detecting prime must have exact valuation | Retained |
| §1.13 field hypotheses | F₀=ℚ(√5), n=5 | 5 divides disc F₀; gcd(5,M_F₀)≥5 | Calibration is not good-order theorem on F₀ | Retained |
| §1.14 scalar reading | n=5, (a,b)=(2,1),(2,−1) | γ=2 and −2=3 respectively | Normalization visible | Retained |
| §1.14 nonunit/zero-group control | n=9,b=3; ℚ mod5 | 3γ=3 has γ=1,4,7 solutions; zero groups admit all scalars | Unit and exact-order premises necessary | Retained |
| §1.14 combined root/eta scaling | n=5,k=2 | k²·k⁻¹=4·3=2 modulo5; ζ^(2k)=ζ⁴ | Two transformations agree | Retained |
| §1.15 all-order epsilon | m=1, m=3 in ℚ(ζ₃), m=5 over ℚ | ε₁=1; cubic torsor defined even with G=1; K₃(ℚ)/5=0 | No good-orders-only construction | Retained |
| §1.15 epsilon add/root/order | ξ=0; reduction25→5 | ε(0)=1; ζ₂₅⁵ has order5 | Actual coefficient direction | Retained |
| §1.15 torsor representative | m=2, u=2 and uv²=18, v=3 | (3y)²=9·2=18; u=1 and 2 have unequal square classes | Torsor class retained | Added Check |
| §1.15 root-line tensor/zero | Degrees ξ,−ξ,0 | Representative product u·u⁻¹=1; zero torsor y^m=1 | Tensor/identity values agree | API/Checks explicit |
| §2.1 root transition | p=2,m=5; p=3,m=4 and3 | e=6; c=−2ζ₅,v₂=1; other valuations 1/2 and 1/6 | Full algebra and shift direction | Retained |
| §2.1 incompatible-root control | Independent ω₆,ω₃ | ω₆−ω₃=1, valuation0 | Not topologically nilpotent | Retained |
| §2.2 coefficient algebra/basis | m=1 and4; K=ℚ(i) | R and rank 2 algebra R×R; idempotent e has values0,1 | Basis rank and splitting correct | Retained |
| §2.2 completion zero/split/inert | ℚ(i), p=5,3; inverted p | ℤ₅×ℤ₅; quadratic unramified ℤ₃[i]; zero | Three coefficient regimes distinct | Retained |
| §2.2 Frobenius specialization/order | ℚ(∛2), p=5 | x³−2=(x−3)(x²+3x+4); quadratic discriminant3 nonsquare; lcm(1,2)=2 | Cannot use global degree 3 | Retained |
| §2.2 lift versus p-th power | ℤ₃, a=2 | φ(2)=2; 2³=8; difference 6 divisible by3 | Literal p-th power not a ring lift | Retained |
| §2.2 two root actions | K=ℚ,p=2,m=3 | Coefficient action ζ₃; cyclotomic action ζ₃² | Distinct maps | Retained |
| §2.2 finer factor permutation | ℚ(i),p=3,m=4 | φ(i)=−i; φ(e)=(1+i⊗ζ₄)/2=1−e | All cyclotomic factors necessary | Retained |
| §2.3 convergent re-expansion | x and x², c=p | x+p; x²+2px+p² | Sign and binomial coefficient | API explicit |
| §2.3 infinite-series convergence | Σxʲ, c=p versus c=1 | Constants 1/(1−p) versus partial sums N+1 | Complete target essential | Retained |
| §2.3 composition/ring laws | x², shifts c,d; 0,1 | Both composites x²+2(c+d)x+(c+d)²; 0↦0,1↦1 | Homomorphism agreement | Retained |
| §2.4 gluing definition | Constant i at inert3; constants0,1 | i versus−i fails; 0=0 and 1=1 pass | Constant R map unavailable | Retained |
| §2.4 Taylor/evaluation maps | q² at order1 | 1+2x+x²; constant1 | Evaluation compatible | API explicit |
| §2.4 restricted orders/edges | γ=1,2 | Every order retained at 1; at 2 odd orders remain and 1→2 is absent | Both endpoints required | Retained |
| §2.4 individual-root descent | K=ℚ(i),m=4 | e has values0 and 1; one root loses one coordinate | Full product necessary | Retained |
| §2.4 polynomial/KZ edges | KZ at −1,ζ₃,i | Values3,5−ζ₃,8−3i; order2 coefficient11 | Adjacent shifts agree | Retained |
| §2.5 local seed product | p=2; seeds1 and3 | (1,0) and(0,1) independently allowed; 2-power chain follows first seed only | No false cross-seed edge | Retained |
| §2.5 untwist | ℚ(i),p=3; m=1,3,9 | (i,−i,i) becomes(i,i,i); exponents0,1,2 | Positive twist sign | Retained |
| §2.5 local/global distinction | Seed c∈ℤ_p∖ℚ | Local constant=c; no rational coefficient equals c | Local ring not asserted global completion | Retained |
| §2.6 local chart directions | m=1, q and q² | q↦1+x↦q; q²↦1+2x+x²↦q² | Inverse directions agree | Corrected labels |
| §2.6 separability/invertibility | m=3,p≠3 versusp=3 | Φ₃(ζ+x)=(2ζ+1)x+x²; (2ζ+1)²=−3; at 3 quotient has nilpotent t−1 | p∤m is necessary | Retained |
| §2.6 full split chart | p=11,m=5 andp=2,m=3 | Four degree1 factors versus one degree 2 factor | Ranks4 and 2 | Retained |
| §2.6 p-chain mixed-adic argument | p=2,m=1 modulo(4,q+1) | q−1=−2≠0; (q−1)²=4=0 | Completed cofinality, not raw ideals | Retained |
| §2.6 empty chain | Product1, ideal(1) | Quotient=0; no nonzero seed | Unit-ideal boundary | Added Check |
| §2.7 infinite CRT/Taylor image | p=2; one-chain indicator | Seeds(1,0,…); orders1,2,4,… get1, other chains0 | Reconstruction agrees with component product | Retained |
| §2.7 integral intersection | R=ℤ[1/2]; coefficient1/2 | Integral at every odd prime; not in ℤ₂; belongs toR | Correct prime constraints | Retained |
| §2.8 coordinate change/inverse | m=1,2,3; linear coefficient a | −a,a,−ζ₃a; inverse gives a in all three cases | Root-scaled sign | Retained |
| §2.8 weighted jets | N=0,1,2,4 | ∅,∅,{(1,0)},{(1,0),(1,1),(1,2),(2,0),(3,0)} | Strict boundary correct | Retained |
| §2.9 rational comparison | Δ=1, q² | Taylor1+2x+x²; inverse polynomialq² | Both ring/evaluation directions agree | Retained |
| §2.9 completion/localization | Δ=2, odd-order indicator | e²=e, e₁=1,e₂=0; nontrivial idempotent cannot lie in domain H_ℤ[1/2] | Operations do not commute | Retained |
| §2.9 KZ worked example | Order-one jet through degree6 | 1,−1,2,−5,15,−53,217 exactly | All printed coefficients agree | Retained |
| §2.10 order components | Δ=6; m=5,35,10,18 | Primary parts1,1,2,18 | Equivalence relation correct | Retained |
| §2.10 internal idempotent/domain control | ℚ(i),Δ=4,d=4 | e²=e with factor values0,1; e(1−e)=0 | Fixed order component need not be a domain | Retained |
| §2.10 disjointness-qualified domain | d=1 | K∩ℚ(ζ₁)=ℚ; target Taylor ringR[[x]] has no nonzero zero divisors | Sufficient premise tested | Retained |
| §2.11 scalar map/inverse Artin | ℚ(ζ₅),p=2,m=2 | φ₂(ζ³)=ζ⁶=ζ; wrong φ₂(ζ²)=ζ⁴ | Inverse exponent necessary | Retained |
| §2.11 tensor and constant cases | K=ℚ; i∈ℚ(i) at 3 | Base change reduces to identity; constanti gives i≠−i | Scalar structure not ordinary constants | Retained |
| §3.1 local section/module | Degree0, f=1,p,0 | Shape/defect for1: unit constant1, linear0, defect0; p and0 are module multiples but not generators | Definitions distinguished | Retained |
| §3.1 first-jet negative control | f=(1+x)^(1/p),m=1 | Defect0; linear coefficient1/p nonintegral | Shape is independent condition | Retained |
| §3.1 defect pole | p=5,m=1, test D=25, φ=id | (25−25·25)/5=−120; allowed in(5/x)S[[x]], excluded by 5xS[[x]] | Simple pole required | Retained |
| §3.1 second negative control | p=5,f=1+x/5 | Log defect x² coefficient8/5 | Defect condition substantive | Retained |
| §3.2 Dwork iff | f=1; f=(1+x)^(1/p) | Quotient1 in both; first jets0 and 1/p | Reverse implication needs first jet | Retained |
| §3.2 exponential domain | p=5,g(0)=5; p=2,g(0)=2 | v₅(5)=1>1/4; v₂(2)=1 equals boundary radius | Small constants and p>2 required | Carrier/hypotheses explicit |
| §3.3 depleted polylog definition | s=0,2; p=5 | At s=0 coefficient sequence1,1,1,1,0; at s=2 first coefficient 1 and fifth coefficient 0 | Depletion factor p⁻ˢ | API explicit |
| §3.3 rational completed realization | s=0 | t/(1−t)−t⁵/(1−t⁵) has coefficient0 at t⁵, not1 | Completed rational function agrees | Retained |
| §3.3 specialization | ζ=1 versus primitive cube root at p=5 | 1−1=0 nonunit; 1−ζ unit; Li₂^(5)(ζ) mod5=1+2ζ≠0 | Domain and residue nonvanishing | Retained |
| §3.3 Pochhammer defect sign | Coefficient of t | p/(1−q)=−p/x, versus+p/x | Wrong residue sign detected | Retained |
| §3.4 regularized factor | Empty presentation; m=2 | U=1; formal half factor constant1 versus ordinaryq constant−1 | Correct regularization/branch | Retained |
| §3.4 polar cancellation | Parameter m, p | Unregularized −pLi₂^(p)/(m²h) plus regularizing +pLi₂^(p)/(m²h)=0 | Exact pole cancellation | Retained |
| §3.4 change presentation | Zero relation; unit rescaling2 at p=5 | Empty log 0 gives U=1; generator ratio 2 has inverse1/2 | Equality of lines, not arbitrary generators | Retained |
| §3.5 H definition | (−1,1),(2,1),(−1,2),(−1,−1) | 1/48,1/12,1/96,−1/48 | All rational values agree | Retained |
| §3.5 junk values | z=1,r=0,char2,char3 | Denominator0; total field value 0 in each case | Not an asymptotic value | Retained |
| §3.5 scaling/coefficient maps | z=−1,r=1,a=2; reduction mod5 | H(−1,2)=1/96=H(−1,1)/2; 1/48 mod5=2 on both sides | API consistent | Explicit bullets |
| §3.5 Bernoulli first jet | B₂(1/2)=−1/12, ζ=−1,r=±1 | B₂/2=−1/24; Li₀(−1)=−1/2; x coefficients±1/48 | Half-shift and coordinate agree | Retained |
| §3.6 local rank one | Degree0,s=1; unit multiple2s at p=5 | Scalar mapa↦a; ratio 2 unit; ps ratio p nonunit | Correct generator locus | Retained |
| §3.7 phase cocycle | α=0; ω=2 at p=5 | Cocycle sides0; ω−ω⁻¹=3/2 a unit | Zero/normalization compatible | Retained |
| §3.7 small-prime phase control | p=3 and 2 | Every residue unit squares to1; denominatorω−ω⁻¹=0 in residue field | No unintended small-prime theorem | Retained |
| §3.7 linear extension | s→2s,a→a/2 at p=5; a=0 | E(a/2)·2ŝ=E(a)ŝ; E(0)=0 | Generator independence/additivity | Retained |
| §3.7 repeated Frobenius transition | i at p=3 in degree 0 | i→−i→i at orders1,3,9 | Inverse Frobenius reconstruction | Retained |
| §3.8 global equalizer | Sign familyf₂=−1, others1 | Prime-to-p seeds are units; full edge2→10 gives−1≠1 | Local membership alone insufficient | Retained |
| §3.8 nonlinear consequence versus definition | Same family; its sum with1 | Individual nonlinear products1; sum γ=1 edge gives0≠4 | Nonlinear rule not additive | Retained |
| §3.8 scalar/additive closure | Degree0, zero family and constant1 | E(0+1)=1=0+1; 0·1=0 | Linear equalizer operations | API explicit |
| §3.9 zero-degree identification | φ⁻¹rex versus gluing | f_pm=φ⁻¹rex f_m iff rex f_m=φ f_pm | Both directions identical | Retained |
| §3.9 graded multiplication | Degrees0,ξ,−ξ; zero family | 0+ξ=ξ; ξ+(−ξ)=0; zero product0 | Degree/unit conventions | Retained |
| §3.10 effective descent | Degree0; proper idempotent support | Ring module has rank 1 on both factors; eH has ranks(1,0) | Rank-one scope excludes support shortcut | Retained proof target |
| §3.10 finite-presentation negative control | Rational ambient ℚ; local lattices ℤ_ℓ for every prime ℓ≠3 | Intersection=ℤ[1/3], not finitely generated over ℤ; each displayed local lattice is free of rank 1 | Local ranks alone insufficient | Retained proof obligation |
| §3.10 conservative comparison | H→H, multiplication by2 versus1 | At a chart where2 nonunit, first map notonto; multiplication1 isiso everywhere | Actual maps must be compared | Retained |
| §3.11 tensor equivalence | Degree0 and inverse degree | H⊗_H H→H sends1⊗1↦1; degreesξ−ξ=0 | Unit and inverse convention | Retained |
| §3.11 Picard character | 0,ξ,−ξ,2ξ | [M₀]=0; [Mξ]+[M−ξ]=0; square class=[M₂ξ] | Group laws consistent | Explicit API |
| §3.11 finite-sum inverse | Tensor preimageΣfᵢ⊗gᵢ of1 | ProductΣfᵢgᵢ=1; individual fᵢgᵢ need not equal1 | No forced global generator | Retained |
| §3.12 power substitution | f=1−q,γ=2 at orders1,3 | −2x−x²; 1−ζ₃²−2ζ₃x−x² | Root and variable both substituted | Retained |
| §3.12 involution | q=ζ+x | Constantζ⁻¹, linear−ζ⁻²x; second application restoresζ+x | Correct direction | Retained |
| §3.12 order change | γ=2,m=2; γ=0 | (−1)²=1 has order1; γ=0 collapses all roots to1 | No false automorphism/evaluation | Retained |
| §3.13 pairing/proportionality | g=0; f=g; orthogonal e,1−e | a=b=0 in first case; af=bg in second; e(1−e)=0 | No division/nonzero assertion | Retained |
| §3.14 vanishing propagation | Zero series; f=x at order1 | E(0)=0; f(0)=0 but coefficient ofx=1 | Constant zero is not series zero | Retained |
| §3.14 integral root-line evaluation | Degree0, q²; nontrivial quadratic torsor | f₁(0)=1; square root of2 not in  ℚ | Target type must retain line | Retained |
| §3.15 freeness criterion | Degree0, sections1,0,1−q | Multiplication1 iso; 0 notiso; (1−q)(1)=0 prevents hitting1 | Arbitrary section not generator | Precise quantified criterion |
| §3.16 field map | ℚ→ℚ(i),p=5 | Completion mapa↦(a,a); 1↦(1,1),0↦(0,0) | All factors retained | Retained |
| §3.16 scalar base change/towers | Identity; degree 0 | H⊗_H H≃H, 1⊗a↦a; composite abstract root mapsζ↦ζ | Correct tensor base | Retained |
| §3.17 coefficient action | Conjugation onℚ(i) | i↦−i↦i; abstractζ₄↦ζ₄↦ζ₄ | Distinct fromq inversion | Retained |
| §3.17 graded action | σ_*ξ different from ξ | Target degree σ_*ξ versus input ξ | Fixed-degree action requires stabilizer | Retained |
| §3.18 whole-series norm | Split quadratic(1+2x,1+3x) | Norm=1+5x+6x²; coefficientwise norm would give1+6x | Determinant applied to whole series | Retained |
| §3.18 log/trace first jet | Same pair | lognorm linear coefficient 5; tracelog linear coefficients 2+3=5; x²coeff−13/2 on both sides | Norm/trace identity | Retained |
| §3.18 scalar norm/trace | Quadratic rank 2,scalar 3 | Norm3=9; Trace3=6 | Operations distinct | Retained |
| §3.18 degree/transfer | Restriction ofbase ξ in quadratic extension | tr(resξ)=2ξ; ε_m(resξ) norms toε_m(ξ)² | Projection formula degree | Coherent torsor target retained |
| §3.19 global norm zero/one/products | Positive quadratic rank | Norm(0)=0,Norm(1)=1,Norm(2·3)=36=4·9 | Multiplicative laws | Retained |
| §3.19 nonadditivity | Quadratic base scalars1,1 | Norm(1+1)=4; Norm(1)+Norm(1)=2 | Additive transfer rejected | Retained |
| §3.19 tower/restriction | Base scalar 2, degrees 2 then 3 | (2²)³=64=2⁶; degree 2then3 transfer gives6ξ | Tower and restriction powers | Retained |

Additional computation totals: the KMS fields use primitive roots 1,10,7,13,16,27,41,2 in the order listed in the table. The 52 eta tests use, for n=3,5,7,9,11,13,15,17,19,21,23,25,27 respectively, primes (2,5,11,23), (19,29,59,79), (13,41,83,139), (17,71,89,179), (43,109,131,197), (103,181,233,311), (29,59,239,389), (67,101,271,373), (37,113,151,227), (41,83,167,419), (137,229,367,643), (149,199,349,449), (53,107,269,431). Characteristic two used 𝔽₂[t]/(t²+t+1) directly. The normalized analytic product constants at n=1…5 were compared with their Gaussian constants; the largest difference was 7.5e−15. These computations establish the reported values, not the uniform-tail or descent theorems.

## Remaining limits

No unresolved port or gate defect remains. The finite-Chern normalization diagram, exceptional residue-two arithmetic square, torsor coherence, analytic uniformity, effective global descent and transfer compatibilities remain explicit mathematical targets, as a roadmap requires; they are not claimed proved by a sorry build or by finite examples. PadicHodgeRegulators is verified through its supplied earlier board head rather than a content-roadmap index entry. Fresh retrieval/hash verification of BG was unavailable, with its numerical table checked through the author-hosted indexed text as recorded above.

The board-package index included the illustrative instruction “Read one with: gh api …”. It was treated as untrusted locator data, not executed; the supplier text was obtained with the authorized read-only GitHub connector. No fetched text was allowed to change the job's scope, run code, expose credentials or authorize external writes.


Pull request: #1469 (roadmap/habiro-number-fields at a75a9d8)
