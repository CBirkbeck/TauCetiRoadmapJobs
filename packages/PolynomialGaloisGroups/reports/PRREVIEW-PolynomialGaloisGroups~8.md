# Review of PolynomialGaloisGroups (pull request #986 at 93a4832)

**Verdict:** needs changes

## R01 (P2) — Give the continuation a separate roadmap identity

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:3`, “This roadmap continues the completed Polynomial Galois Groups roadmap”; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:17`, `namespace TauCetiRoadmap.PolynomialGaloisGroups`.

**Claim:** the content now describes a continuation, but still occupies the completed base's folder and namespace. That leaves “PolynomialGaloisGroups, Layer 1” naming both the base's permutation theory and this extension's radical criterion. The continuation contract requires a distinct Part identity.

**Witness:** `Completed/PolynomialGaloisGroups/README.md:532` assigns Layer 1 to permutation groups; this README's line 121 assigns it to radicals. `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:25` consumes the base's Layers 0–1 for faithful root actions and blocks.

**Exact repair:** place these new targets in a separately named continuation and use its corresponding namespace; retain the introduction explaining the completed base's stopping point. Coordinate the continuation number with the existing Part II, whose ramified-merging scope is different. Retest the citation above: the Part II reference must still resolve to permutation theory, while the new radical criterion has an unambiguous different owner. This is the remaining portion of previous R01; the repeated base targets themselves have been deleted. The mathematical scope can be retained, so this verdict is needs changes rather than the previous scope rejection.

## R02 (P2) — Include the two promised polynomial end results in the acceptance file

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:20`, “its some-root form for irreducible polynomials, and the prime-degree non-solvability corollary”; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:13`, “Every headline theorem of the roadmap is statable at the pins”.

**Claim:** §§2.2 and 2.3 are explicitly owned mathematical outputs, but neither appears in the acceptance file. It contains only the all-roots criterion for Layer 2. Both missing results are statable on the existing carriers, without new definitions or stand-ins.

**Witness:** two scratch signatures elaborated using only `import Mathlib`: the irreducible some-root equivalence and the prime-degree obstruction with `q.natDegree.Prime`, `5 ≤ q.natDegree`, and complex-root cardinality equal to real-root cardinality plus two.

**Exact repair:** add sorried acceptance signatures for both results, matching §§2.2–2.3. The some-root result must retain irreducibility; the obstruction must retain irreducibility, primality, the lower bound five, and exactly two nonreal roots. Retested instances: `X²−2` satisfies both sides of the some-root equivalence; `(X⁵−4X+2)(X−1)` has a radical root but nonsolvable group and is excluded. `X⁵−4X+2` satisfies the obstruction, whereas `X³−2` fails the lower-bound hypothesis and has radical roots. These are general outcomes, not requests to add the example computations to Lean.

## R03 (P3) — Record the three sources and the some-root locator

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:303`, “Source id”; also §2.2 at line 193.

**Claim:** the README assigns three source identifiers, but the folder has no `sources.toml`. The previous source-inventory finding is consequently only partly repaired. Section 2.2 also has no explicit literature locator for its equivalence.

**Witness:** the repository has no `TauCetiRoadmap/PolynomialGaloisGroups/sources.toml`; all three works were nevertheless fetched legally. The relevant passages are `milne-fields line 3409`, `dummit-quintics line 102`, and `chapman-quintics line 16`.

**Exact repair:** add one manifest entry per work using the existing identifiers `milne-fields`, `dummit-quintics`, and `chapman-quintics`, with version, locator, cited targets, and service-recorded provenance. Give §2.2 Milne, Theorem 5.34, p. 77, as its radical-criterion source, explaining the irreducible some-root deduction. Retest: each of the six sampled sections then resolves to a recorded legal text, and §2.2's reducible negative control remains excluded. No source text needs to be copied into the repository.

## R04 (P3) — Correct the hypothesis named by the reducible negative control

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:280`, “Reducibility is necessary in 3.1”.

**Claim:** the sentence names the opposite of the intended hypothesis. The theorem assumes irreducibility; this example shows that separability alone is insufficient.

**Witness:** for `X⁵−X`, the resolvent is `(X−2)⁴(X²+16)` and its gcd with its derivative is `(X−2)³`. For irreducible `X⁵−2`, the resolvent's derivative gcd is 1.

**Exact repair:** replace “Reducibility is necessary” by “Irreducibility cannot be omitted”. Keep the example. Both computed derivative gcds then support the sentence and agree with §3.1 and its Lean signature. This is a wording error in the Check, not a counterexample to the stated separation theorem.

## Previous findings

All eleven findings in the supplied review of `82f088f` were compared before the full review. No supplied repair disposition marks a finding “not actionable in this package”.

| Previous finding | Passage at this head and disposition |
|---|---|
| R01, replanning the completed base | **Partly repaired.** “Everything of the completed Polynomial Galois Groups roadmap is imported, never restated” (README:28). The repeated targets are gone; the continuation still uses the base identity. Current R01 isolates that remaining defect. |
| R02, abstract group/stabilizer determines a field | **Repaired by deletion.** “It owns nothing else” (README:26), followed by deferral of the primitivity dictionary (README:30). There is no retained abstract-field determination claim. The finite-Galois theorem instead specifies the actual extension and embedding (README:125). |
| R03, erroneous negative control for every `X^n` | **Repaired by deletion.** The symmetric realization is imported (README:33); the offending universal negative control is absent. The new zero/constant controls instead say “both sides hold” (README:182). |
| R04, unbounded Vieta index | **Repaired by deletion.** “resolvent specifications” are imported (README:30). The unbounded coefficient identity no longer appears; native specialization is used. |
| R05, nonmonic polynomial equals its minimal polynomial | **Repaired by deletion.** The primitivity dictionary is imported (README:30), and the false equality has no counterpart in the new text. |
| R06, missing unconditional Dummit criterion | **Repaired.** “with its separability hypothesis discharged by 3.1” (README:259). Lean:58, :67 and :76 state separation and both unconditional criteria. The separation proof and characteristic-five control were checked anew. |
| R07, mismatch in characteristic range | **Repaired.** The supplied conditional theorem is explicitly “over an arbitrary field” (README:102); the new unconditional group theorem assumes only `5 ≠ 0` in both README:255 and Lean:68. The characteristic-two computation below is admitted by both. |
| R08, ten supplied-result wrappers | **Repaired.** “are not restated here” (Lean:11). All ten wrappers have disappeared. Five admitted new targets remain; none closed in the fifteen elementary tactic trials below. |
| R09, catalogue shape and missing definition Checks | **Repaired for the retained scope.** The opening is “Summary” (README:3), the required scope/conventions/supplier/build headings are present, and all three layers end in Examples and Dependencies. No new definition remains: the radical closure and resolvent are native objects. The removed Tschirnhaus construction no longer needs a local API block. |
| R10, wrong locators and absent inventory | **Partly repaired.** The invariant now cites “§2, p. 388” (README:61), and the major new statements have precise locators. The manifest is still absent; see current R03. |
| R11, certificate/checker milestone | **Repaired by deletion.** The base's labels “with their certificates” are listed only as imported scope (README:32). No certificate carrier, checker, or acceptance wrapper remains here. |

## Verified sound

This was a full review of all 310 README lines and all 82 Lean lines at `93a483220eb3821ae1fde35c7609126e8063ed9d`. The diff outside this folder is empty, and the worktree remained clean. Repository-root README and CONTRIBUTING were read; the requested parent-relative copies do not exist in this checkout. Main's completed PolynomialGaloisGroups and NewtonPolygons roadmaps were read for shape and ownership.

**Gate, elaboration, and padding.** The supplied gate reports every scanner, dependency check, metadata check, outside-folder check, and targeted build passing, ending `build=0 OK`. There is no gate failure to carry forward. The separate supplied signature failure was reproducible as a missing dependency object, not a bad theorem type: building the specifically imported `TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Basic` succeeded (1849 jobs). A fresh direct `lake env lean` on the requested Suggested file then exited successfully with exactly five `sorry` warnings.

A scratch copy with `#check @name` for **all five declarations** elaborated successfully. Characteristic zero, finite dimensionality, the Galois hypothesis, the actual embedding, monicity, irreducibility, degree five, and `5 ≠ 0` all remain in the corresponding types. No section hypothesis disappeared. Separate scratch signatures establish the statability of the two omissions in R02.

For each of the five admissions, `simp`, `rfl`, and `infer_instance` were tried with failure rollback and no other proof tactic: **15 trials, zero closures**; each target still generated its `sorry` warning. Object searches and the supplied theorem signatures do not provide a one-lemma proof of any of the five: Abel–Ruffini gives only the radical-to-group direction, and the native quintic equivalence requires a separate resolvent-separability premise. There is no padding finding against these five. There are no definitions, instances, opaque data, admitted examples, stand-in propositions, `set_option` commands, or foreign-roadmap imports in this file.

**Headline coverage.** The README promises seven outputs: finite-Galois radical equivalence (§1.1); all-roots equivalence (§2.1); irreducible some-root equivalence (§2.2); the prime-degree nonradical obstruction (§2.3); sextic separation (§3.1); the group criterion (§3.2); and the radical criterion (§3.2). Five appear in Lean, at lines 32, 46, 58, 67 and 76 respectively. The other two are the statable omissions in R02. No unavailable carrier excuses an omission.

**Source sample.** All **six sampled sections**, and the auxiliary locators used in their proofs, were checked against legal full texts fetched through the sources service. There are no README locators marked unverified. The three source keys below are the README's existing identifiers; no replacement keys were invented.

| Sample / auxiliary input | Exact source evidence and conclusion |
|---|---|
| §1.1, finite Galois criterion | `milne-fields line 3409`, Theorem 5.34, printed p. 77, is the characteristic-zero polynomial criterion. Lines 3411–3420 supply the roots-of-unity/cyclic-tower argument. The README expressly identifies its finite-Galois version as a reformulation; a primitive element and normality give that reformulation. |
| §2.1, all roots | The same theorem and `milne-fields line 3423` describe a radical tower containing a splitting field. Repeated factors do not change that field. The zero-polynomial root-set convention is a native-library extension, checked independently below. |
| §2.2, some root | The irreducible deduction agrees with that criterion and native `isSolvable_gal_of_irreducible`; irreducibility supplies a root and ensures that one radical root suffices in the reverse direction. Its missing explicit locator is included in R03. |
| §2.3, prime degree | `milne-fields line 2217`, Proposition 4.16, printed p. 52, identifies the group as the full symmetric group for an irreducible rational polynomial of prime degree with exactly two nonreal roots. The additional bound five is needed only for nonsolvability. |
| §3.1, separation | `chapman-quintics line 16` through line 30, dated 22 January 1992, contains the two difference identities and the collision contradiction. The note is written over the rationals. Independently checking its algebra shows that characteristic two gives a direct root collision, while other characteristics need division by five. Thus the roadmap's extension to all fields with `5 ≠ 0` is justified by the displayed argument. |
| §3.2, Dummit | `dummit-quintics line 102`, Theorem 1, printed p. 389, states the rational depressed-quintic criterion. Line 31, p. 387, gives the characteristic restriction in the original paper. The roadmap separates the group statement from the characteristic-zero radical statement, and uses Chapman for distinctness. Its characteristic-two group extension is independently justified, not attributed verbatim to Dummit. |
| Cyclic extension step | `milne-fields line 3267`, Proposition 5.27, printed p. 74, includes the converse cyclic-extension-to-radical-generator implication. The primitive-root hypothesis is retained. |
| Restriction after adjoining roots of unity | `milne-fields line 3400`, Lemma 5.33, printed p. 76, with proof on p. 77, embeds the base-changed Galois group by actual restriction. The README uses exactly this direction. |
| Invariant and trinomial formula | `dummit-quintics line 48`, §2, p. 388, and line 99, formula (2′), p. 389, agree with the invariant and coefficient formula. The polynomial calculations below independently check the coefficients and their signs. |

Legal locations: [Milne v5.10](https://www.jmilne.org/math/CourseNotes/FT.pdf), [Dummit's paper](https://site.uvm.edu/ddummit/files/2021/04/Solving_Solvable_Quintics__Math_Comp_57_no195_1991__pp_387_401.pdf), and [Chapman's note](https://site.uvm.edu/ddummit/files/2021/04/Solving_Solvable_Quintics_note_by_Robin_Chapman.pdf). The initial obsolete URL attempts returned 404; the linked author-page copies were then successfully fetched. There are **zero outstanding missing-text requests**.

**Adversarial mathematics.** The following **37 rows** cover the sampled statements, all seven promised outcomes, native definitions and conventions, proof steps, and every worked example. These finite computations support the tested instances; they are not substitutes for proofs of universal statements. For finite-field rows, a code `Σ cᵢpⁱ` denotes `Σ cᵢtⁱ` in the indicated degree-five field. Invariant orbit values use the six distinct monomial sets obtained from all 120 permutations; their order is immaterial. Polynomial gcds were calculated by exact rational Euclidean division; finite-field irreducibility was tested against every monic linear and quadratic divisor (sufficient in degree five).

| Statement | Instances tried | Values on the two sides / computed witness | Result and change |
|---|---|---|---|
| 1. Native `Polynomial.Gal`, constants | `q=0,1,7` over ℚ | Root-set sizes `0,0,0`; splitting-field degrees and group orders `1,1,1`. | Matches README:48, :182; retain. |
| 2. Distinct-root convention, repeated factors | `q=(X²−2)²` | Polynomial degree 4; distinct-root size 2; splitting-field degree 2; group C₂. Both roots are radical, so §2.1 gives true ↔ true. | No separability assumption on `q` should be added. |
| 3. Radical closure, nonzero exponents | `√2`, `ζ₃`, and exponent 0 | `(√2)²=2`, `ζ₃³=1`: both admitted. At exponent 0 every `x⁰=1`, including nonradical quintic roots; the native `n≠0` excludes this wrong closure. | Native definition has the necessary exclusion. |
| 4. The ambient radical closure matters | `E=ℚ(ζ₇+ζ₇⁻¹)`, `u=ζ₇+ζ₇⁻¹` | `u³+u²−2u−1=0`, degree 3, Gal=C₃. Inside E, a nonrational radical over ℚ would have at most two real conjugates `±x`, contradicting degree 3; internally the closure is ℚ, externally u belongs. | Supports the negative control. Its power argument is read with `n≠0` from the radical convention. |
| 5. Choice of embedding | `ℚ(√2)` embedded by `√2↦±√2` | Both images square to 2 and generate the same radical subfield; group order 2 in either case. | Both sides unchanged; no distinguished embedding needed. |
| 6. Finite-Galois iff, trivial extension | `E=F` | Group order 1, derived group order 1; every image is a base element. `true↔true`. | Retain §1.1, including degree 1. |
| 7. Finite-Galois iff, nonabelian solvable extension | Splitting field of `X³−2` | Group orders along the derived series `6→3→1`; generators satisfy `α³=2`, `ζ₃³=1`. `true↔true`. | Checks a nonabelian group, not just cyclic cases. |
| 8. Finite-Galois iff, quintic radical extension | Splitting field of `X⁵−2` | Group order 20, derived orders `20→5→1`; generators satisfy `α⁵=2`, `ζ₅⁵=1`. `true↔true`. | Retain Layer 1 example. |
| 9. Finite-Galois iff, nonsolvable extension | Splitting field of `f=X⁵−4X+2` | Eisenstein at 2; `f(-2),f(-1),f(0),f(1),f(2)=−22,5,2,−1,26`; exactly three real roots. Group derived orders `120→60→60`; radical containment false. `false↔false`. | Supports the negative side. |
| 10. Normality is substantive | `E=ℚ(α)` for a real root of the preceding quintic | `[E:ℚ]=5`; automorphism group order divides 5 but cannot be 5, since E is real and the quintic has nonreal conjugates; hence order 1. α is not radical. Dropping Galois gives `true↔false`. | `IsGalois F E` is retained in Lean. |
| 11. Root-of-unity enlargement | `E=F`; splitting field of `X⁵−2` | `N=1` gives ζ=1 and degree 1. `N=20` gives ζ₂₀ with `ζ₂₀²⁰=1`; the required fifth root is `ζ₂₀⁴`, of order 5. | No division by zero: `N≥1`, and `p∣N` at nontrivial steps. |
| 12. Restriction on a compositum | `ℚ(√2,√3)/ℚ(√3)` restricting to ℚ(√2) | Source and target automorphism groups both have order 2; the nontrivial source sends `√2↦−√2`, so kernel order 1. | Checks source, target, direction and injectivity. |
| 13. Prime-index induction | `S₃⊃A₃`; `C₃⊃1` | Indices 2 and 3; fixed-field degrees 2 and 3; remaining degrees `6/2=3`, `3/3=1`. | Strict descent uses the prime index. Trivial group has no such step. |
| 14. Kummer generator | `ℚ(√2)/ℚ`; `ℚ(ζ₃,∛2)/ℚ(ζ₃)` | Degrees 2,3; generators have powers 2,2 in the base; primitive roots `−1`, `ζ₃` have orders 2,3. | Matches the native finite cyclic theorem. |
| 15. Splitting-field image generated by roots | `X²−2`; constant 1 | Adjoining `{±√2}` gives image ℚ(√2), degree 2; adjoining ∅ gives the base, degree 1. | Supports the Layer 1→2 passage. |
| 16. All-roots iff, degree 0 and 1 | `q=0,1,X−1` | Root-set sizes `0,0,1`; groups trivial; the lone nonempty root is 1. Both sides true in all three cases. | Zero-polynomial convention is intentional, not an omitted hypothesis. |
| 17. All-roots iff, quadratic | `q=X²−2` | Group C₂; both roots square to 2. `true↔true`. | Retain §2.1. |
| 18. All-roots versus some-root | `q=(X⁵−4X+2)(X−1)` | Six distinct roots; exactly the rational root 1 is radical, while the five quintic roots are not; group S₅. All-roots: `false↔false`; unrestricted some-root: `false↔true`. | Retain irreducibility in §2.2/R02. |
| 19. Some-root iff, both directions | `X−1`, `X²−2`, `X⁵−4X+2` | `(solvable, exists radical root)=(true,true),(true,true),(false,false)`. | Mathematical statement sound on these cases; add the missing signature (R02). |
| 20. Prime-degree obstruction, degree five | `X⁵−4X+2` | Complex-root count 5, real-root count 3, difference 2; prime degree 5; radical roots 0. | All hypotheses and conclusion of §2.3 hold; add signature (R02). |
| 21. Prime-degree obstruction, low-degree controls | `X²+1`; `X³−2` | Nonreal-root counts 2,2; solvable groups C₂,S₃; all roots radical. Bounds `5≤2`, `5≤3` are false. | The lower bound cannot be omitted. |
| 22. Invariant and stabilizer convention | Formal variables, all permutations; numeric roots `0,1,2,3,4` | Ten monomials; six formal orbit elements, stabilizer size `120/6=20`. Evaluations `128,142,122,152,122,142`. | Correct invariant; distinct formal invariants alone do not imply distinct specialized values. |
| 23. Universal difference factorization | All 15 unordered pairs of the six formal invariants | Every difference equals a relabeling of the stated product; subtracting the products gives 0 in all 15 cases. For the numeric roots above, first two values differ by `128−142=−14`. | Confirms the degree-four factorization used by §3.1. |
| 24. Collision equations | `uz=vw`, `uw=vz` with all variables nonzero; negative control `u=1,v=2,w=z=0` | Eliminating w,z gives `u²−v²=0`. In the negative control both initial equations are `0=0`, but `1−4=−3`. | Divisions require distinct roots; the proof supplies this. |
| 25. Characteristic-two collision argument | `u²=v²` in a field of characteristic 2 | `(u−v)²=u²+v²=0`, so u=v; distinct root differences would give `xₐ=x_b`. | No division by 2 is used; characteristic 2 is valid. |
| 26. Collision equations and division by five | Roots `0,1,2,3,4` with middle root 2; same roots shifted by t in characteristic 5 | Pair sums are `0+4=1+3=4=2·2`; total `10=5·2`. In characteristic 5 total is 0 and `5(t+2)=0`, so division by five is impossible. | Correct boundary of the displayed proof. |
| 27. Separation, characteristic 2 | `𝔽₂[t]/(t⁵+t²+1)` | Irreducible; root codes `2,4,16,13,27`; six invariant codes `1,14,10,30,8,19`, all distinct. | Separation true; supports the extended generality. |
| 28. Separation, characteristic 3 | `𝔽₃[t]/(t⁵+2t⁴+1)` | Irreducible; root codes `3,27,80,178,85`; invariant codes `1,215,211,240,128,201`, all distinct. | Separation true for another positive characteristic. |
| 29. Separation, characteristic-five control | `𝔽₅[t]/(t⁵−t−1)` | Irreducible; roots `t,t+1,…,t+4`; invariant values `3,2,2,2,2,2`; sextic `(X−3)(X−2)⁵`. README's displayed difference is `20=0`. | Separation false, but `5≠0` false too; valid excluded control. |
| 30. Separation, reducible control | `X⁵−X` over ℚ | `disc(f)=−256≠0`; resolvent `(X−2)⁴(X²+16)`; gcd with derivative `X³−6X²+12X−8`. | Original polynomial separable, resolvent not; correct the word in R04. |
| 31. Sextic formula and solvable quintic | `X⁵−2` | Coefficients give `X⁶−50000X`; `R(0)=0`; gcd(R,R′)=1; `disc(f)=50000`; group F₂₀. | Both the group and radical equivalences give `true↔true`. |
| 32. Dihedral example and coefficient sign | `X⁵−5X−12` | Resolvent coefficients descending `1,−40,1000,−20000,250000,−66400000,976000000`; R(40)=0; gcd=1; discriminant `64000000=8000²`; f irreducible mod 7. | D₅: solvable subgroup of A₅, with nonidentity complex conjugation since f has one real root. Both criteria true. |
| 33. Sextic without a rational root | `X⁵−X−1` | Constant 9631 is prime; R(1)=6267, R(−1)=13877, R(9631)=797384129311106923012437, R(−9631)=798709926184825312571867. gcd(R,R′)=1. | All rational-root candidates fail; group and radical sides false. |
| 34. S₅ identification in the preceding example | `X⁵−X−1` modulo 3 and 2 | Irreducible mod 3; mod 2 factors as `(X²+X+1)(X³+X²+1)`, giving cycle type (2,3), whose cube is a transposition. Degree five transitivity gives a 5-cycle. | Group S₅; independently supports the nonradical example. |
| 35. Unconditional group criterion in small characteristics | The characteristic-two and characteristic-three irreducible quintics above | Both groups are C₅; each sextic has exactly one base-field root, namely 1. `true↔true` in each field. | README and Lean match; the radical form correctly retains characteristic zero. |
| 36. The conditional supplier's collision warning | `X⁵−X` over ℚ | Splitting field ℚ(i), group C₂ (solvable), and sextic root 2. Complex conjugation acts as one transposition; no conjugate of F₂₀ contains that permutation. | The failed converse in the cited collision theorem is the root-to-stabilizer-containment converse. It is not a counterexample to solvability of this particular group. |
| 37. Inseparable input and field boundary | F=𝔽₅(t), q=X⁵−t; the zero ring | q is irreducible with one distinct root α; its Galois group has order 1. All five repeated root entries give Φ=10α⁴=0, so the sextic is X⁶ and is not separable. The zero ring has 0=1. | The inseparable case fails 5≠0 and characteristic zero; Field excludes the zero ring. No headline silently admits either as an intended positive case. |

**Pinned API and ownership audit.** Mathlib was checked at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and content main at `9c6e95d911c8ef4a94a1d22116bd70e3fbcb4858`. The following **18 groups of file-and-line witnesses** were opened at those pins, including the surrounding binders. The native radical closure is an intersection of intermediate fields closed under nonzero powers; it does not assert that every element of an arbitrary ambient extension belongs. The native root set discards multiplicities and is empty for the zero polynomial.

| Input | Pinned file and declarations opened | Contract checked |
|---|---|---|
| Galois group and root action | `Mathlib/FieldTheory/PolynomialGaloisGroup.lean:56`, `Polynomial.Gal`; :181 `galAction_isPretransitive`; :212 `galActionHom_injective` | Actual splitting-field automorphisms; transitivity needs irreducibility; the action in an extension uses the splitting `Fact`. |
| Root set | `Mathlib/Algebra/Polynomial/Roots.lean:576`, `Polynomial.rootSet`; :586, :591, :595 constant/zero/one root sets | Finite set of distinct roots, not the full zero locus of the zero polynomial. |
| Radical closure and Abel–Ruffini | `Mathlib/FieldTheory/AbelRuffini.lean:194`, `solvableByRad`; :201 `rad_mem`; :223 induction; :301 `isSolvable_gal_minpoly`; :313 `isSolvable_gal_of_irreducible` | No native reverse implication is supplied here; the irreducible theorem carries the root equation. |
| Primitive element | `Mathlib/FieldTheory/PrimitiveElement.lean:209`, `Field.exists_primitive_element` | Finite-dimensional and separable extension; both follow from §1.1's assumptions. |
| Kummer input | `Mathlib/FieldTheory/KummerExtension.lean:563`, `isCyclic_tfae` | Finite extension, primitive root of the actual degree; includes Galois and cyclicity, and a generator with its power in the base. |
| Roots of unity | `Mathlib/RingTheory/RootsOfUnity/AlgebraicallyClosed.lean:29`, `IsSepClosed.hasEnoughRootsOfUnity`; `EnoughRootsOfUnity.lean:33`, `HasEnoughRootsOfUnity.exists_primitiveRoot` | Nonzero natural cast; no missing characteristic condition. |
| Galois tower/cardinality | `Mathlib/FieldTheory/Galois/Basic.lean:107`, `IsGalois.card_aut_eq_finrank`; :157 `tower_top_intermediateField`; :575 `sup_right` | Finite Galois input and a compositum equal to the ambient top for the last result. |
| Restriction on composita | `Mathlib/FieldTheory/Galois/Basic.lean:626`, `IntermediateField.restrictRestrictAlgEquivMapHom`; :641 its injectivity theorem | Source is Gal(E/L), target Gal(K/F), with K/F normal and K⊔L=⊤. The roadmap must instantiate the ambient field as the finite compositum, as its route says. |
| Fixed-field comparisons | `Mathlib/FieldTheory/Galois/Basic.lean:295`, `IntermediateField.subgroupEquivAlgEquiv`; :449 `IsGalois.normalAutEquivQuotient` | Subgroup identified with the upper relative group; normal quotient identified with the lower fixed-field group. |
| Prime-index subgroup | `TauCeti/GroupTheory/Solvable.lean:78`, `Group.IsSolvable.exists_normal_index_prime` | Finite, solvable and nontrivial group. |
| Splitting-field embedding and image | `Mathlib/FieldTheory/SplittingField/IsSplittingField.lean:111`, `Polynomial.IsSplittingField.lift`; `Mathlib/Algebra/Polynomial/Splits.lean:571`, `Polynomial.Splits.adjoin_rootSet_eq_range` | Algebraic closure splits q; the image is generated by its roots, including constants. |
| Normality and separability | `Mathlib/FieldTheory/Normal/Basic.lean:63`, `Normal.of_isSplittingField`; `Mathlib/FieldTheory/Separable.lean:663`, `Algebra.IsSeparable.of_integral` | The latter uses integrality, a domain, and characteristic zero. |
| Prime-degree symmetric action | `Mathlib/Analysis/Complex/Polynomial/Basic.lean:128`, `Polynomial.Gal.galActionHom_bijective_of_prime_degree` | Rational irreducible polynomial, prime degree, root-count difference two. |
| Nonsolvable symmetric group | `Mathlib/GroupTheory/Solvable.lean:297`, `Equiv.Perm.not_isSolvable` | Cardinality at least five. |
| Native invariant/specification | `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Basic.lean:70`, `TauCeti.quinticF20Invariant`; :202 `quinticF20Spec`; :215 orbit size | Exact ten monomials and six-element orbit. |
| Specialization/formula | `TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.lean:151`, `TauCeti.ResolventSpec.specialize`; :190 orbit-product comparison; `Resolvent/Quintic/Trinomial.lean:350` trinomial theorem | Definition is total; root interpretation needs monicity, correct degree and a root listing with multiplicity. The formula agrees over every commutative ring. |
| Conditional quintic criterion | `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Solvable.lean:89`, `TauCeti.exists_isRoot_specialize_quinticF20Spec_of_isSolvable`; :104 `TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec` | Arbitrary field; monic separable irreducible quintic. Reverse direction additionally needs a separable sextic. |
| Collision and Cauchy inputs | `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Collision.lean:83`, `TauCeti.resolventSextic_X_pow_five_sub_X`; :197 `not_forall_exists_le_map_conj_of_isRoot_specialize_quinticF20Spec`; `Mathlib/GroupTheory/Perm/Cycle/Type.lean:491`, `exists_prime_orderOf_dvd_card` | Collision theorem concerns subgroup containment, not a nonsolvable C₂; Cauchy uses primality and divisibility of the finite group order. |

Object searches used the roadmap service's `roadmaps grep` and `roadmaps show`, the pinned libraries, content main, and the available board packages. They covered radical closure, solvability equivalences, quintic invariants, and sextic separation, rather than just proposed declaration names. No retained theorem was found already proved in the pinned libraries. No retained fully qualified theorem name duplicates the completed base's acceptance file or the supplied Part II's file.

The **nine cross-roadmap scope references** resolve as follows: completed base Layers 0, 1, 2, 3, 4, 5, 6, 9 begin at `Completed/PolynomialGaloisGroups/README.md:442`, :532, :653, :711, :777, :1054, :1172 and :1385; Part II's distinct scope and base imports are at `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:15` and :25 in the supplied open head. The base supplies the existing permutation/resolvent theory; Part II owns ramified merging and random-partition refinements. Neither supplies the retained radical converse or automatic separation. This is why the new mathematics has a legitimate continuation scope, while R01 still requires a separate identity. Other roadmaps mentioned as downstream motivations are not inputs.

**Supplier direction.** Every `Needs` line was read. All active proof inputs are native Mathlib/Tau Ceti or earlier local sections. The group/separation part of Layer 3 does not depend on Layer 2; only its radical form does. No supplier gap is declared or needed for the native inputs checked. The requested mechanical dependency check printed exactly:

```text
depcheck: 208 roadmaps, 1456 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. R01 concerns the shared base/continuation identity despite this clean graph, not a mechanically reported cycle. No route-specific prime restriction, computational algorithm, certificate implementation, copied source passage, sorry-defined data, or unowned heavy prerequisite was found in the retained development.

## Not verifiable

- No sampled source is unreadable: all three cited works were fetched legally and read. The source-manifest deficiency is R03, not an unresolved request for a text.
- Ownership against open revisions whose comparison files were not supplied was not independently checked. The service index surfaced another revision of the base folder, but this report does not adopt its claims, inspect an unprovided checkout, or treat that revision as a supplier. The explicitly supplied Part II and the completed base were checked directly. The board package index contains no competing polynomial-radical package.
- The numerical and finite-group computations are instance checks. The five admitted Lean theorems remain unproved; successful elaboration establishes their signatures, not their truth.

## Source issues

- **Gap** in dummit-quintics at Theorem 1 proof, printed p. 389: the source says transitivity on the five remaining invariant values gives an irreducible quintic without excluding collisions; it should be preceded by the distinctness argument in chapman-quintics lines 16–30; affects the proof.
- **Misprint** in dummit-quintics at second example, printed p. 399: the source says the resolvent's cubic coefficient is +20000; it should be −20000, obtained from 160(−5)³; affects a stated result.
- **Misprint** in milne-fields at Proposition 5.27 proof, printed p. 74: the source says the automorphism powers are distinct homomorphisms F× → F×; it should be E× → E×, since all these automorphisms fix F; affects the proof.
- **Misprint** in milne-fields at Theorem 5.34 proof, printed p. 77: the source says “Theorem 5.27” supplies the cyclic-extension step; it should be Proposition 5.27; affects nothing.
