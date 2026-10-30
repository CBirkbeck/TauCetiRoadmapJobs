# Review of PolynomialGaloisGroups (pull request #986 at 634251b)

**Verdict:** needs changes

:robot: AI review. Incremental re-review of 18 changed lines since a099640. The source-link and locator changes are correct; they introduce no new mathematical finding. The roadmap identity remains the blocking issue. The gate, targeted build, direct elaboration and all seven elaborated signatures pass.

## R01 (P2) — Give the continuation a separate roadmap identity

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:3`, “This roadmap continues the completed Polynomial Galois Groups roadmap”; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:17`, `namespace TauCetiRoadmap.PolynomialGaloisGroups`.

**Claim:** this extension still uses the completed base's folder identity and namespace. Extensions require their own Part roadmap. Consequently, “PolynomialGaloisGroups, Layer 1” denotes both the base's permutation theory and this continuation's radical criterion. The source-link repair does not address this ambiguity.

**Witness:** `Completed/PolynomialGaloisGroups/README.md:532` names Layer 1 permutation groups; this README's line 122 names it radical solvability. `Completed/PolynomialGaloisGroups/Suggested.lean:60` opens the same namespace. `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:25` consumes the base's Layers 0–1.

**Exact repair:** give these three layers a separate Part folder and matching namespace, retaining the introduction's boundary with the completed base. Part II already owns ramified merging, so use an available subsequent Part identity. Preserve the base and its generated progress records. Retest the witness: the existing Part II citation must resolve uniquely to the base's permutation layers, while the radical criterion has its own qualified layer and declaration names. No mathematical statement needs changing. Carried from the previous report's R01.

## R02 (P3) — Record the sources in the required manifest

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:310`–321, the references with source ids `milne-fields`, `dummit-quintics`, and `chapman-quintics`.

**Claim:** the new direct links and the one-page Chapman locator fix reader access, but the required `sources.toml` is still absent. Links do not record version identity, provenance, hashes, licence class or the source-id mapping required by this review's source contract.

**Witness:** the folder contains `README.md`, `Suggested.lean`, `metadata.toml`, `STATUS.md`, and `PROGRESS.md`; no `sources.toml`. The sources service successfully fetched all three new links under the existing ids.

**Exact repair:** add `TauCetiRoadmap/PolynomialGaloisGroups/sources.toml` under schema `tauceti-roadmap-sources/v1`, with one entry per existing id, bibliographic data, locators, `cited_for`, and the service's provenance fields. Retest against these three links: Milne must resolve to v5.10, September 2022; Dummit to printed pp. 387–401; Chapman to the single page dated 22 January 1992. All three identities were verified this round. This is the remaining manifest portion of the previous report's R02; it is nonblocking.

## Previous findings

- R01 — not repaired: `README.md:3` still describes a continuation of the completed base, and `Suggested.lean:17` still opens the base namespace. The same Layer 1 ambiguity survives; carried as R01.
- R02 — partly repaired: `README.md:310`–321 now links all three legal texts, and line 241 uses the identifiable one-page Chapman argument. The folder still lacks `sources.toml`; the manifest requirement remains R02.

No supplied or available repair report marks either finding “not actionable in this package”; no settled disposition is overridden.

## Verified sound

**Extent and invariants.** The diff is exactly 11 insertions and 7 deletions, all in the README's §3.1 locator and References. `Suggested.lean` is byte-for-byte unchanged from a099640. No files outside the folder changed against `origin/main`; the PR worktree remains clean. The mathematical targets, hypotheses, proof routes and suppliers are unchanged. This report carries earlier computations forward rather than repeating a full review.

**Gate and dependency check.** The supplied gate includes `build=0 OK`. A fresh gate exited 0 with every scanner at zero, including `depcheck`, `stray-files`, `dirty`, `outside-folder` and `source-material`. That invocation did not print a build field, so the targeted build was separately run and passed: `lake build TauCetiRoadmap.PolynomialGaloisGroups.Suggested`, 9001 jobs. The explicit dependency command returned:

```text
depcheck: 208 roadmaps, 1460 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All six `Needs` paragraphs were read: §1.1 uses pinned libraries; §§2.1–2.2 use earlier local material and Mathlib; §2.3 uses Mathlib; §3.1 uses Tau Ceti and Mathlib; §3.2 uses §3.1 and the conditional Tau Ceti criterion, with Layer 2 only for the radical form. No new gap, supplier or reverse dependency is introduced.

**Elaboration and headline coverage.** Direct `lake env lean` on the requested file exited 0, with exactly seven `declaration uses sorry` warnings and the intentional library `#check`. A scratch copy containing `#check @name` for all seven declarations also exited 0. No binder disappeared and no signature changed. The seven headlines are the finite-Galois radical criterion (§1.1), all-root criterion (§2.1), irreducible some-root criterion (§2.2), prime-degree obstruction (§2.3), sextic separation (§3.1), group criterion (§3.2), and radical criterion (§3.2); all appear at `Suggested.lean:32`, :46, :55, :64, :76, :85 and :94. There are no local definitions or stand-ins.

The first signature includes both `FiniteDimensional F E` and `IsGalois F E`, with the actual embedding into `AlgebraicClosure F`. All radical criteria carry characteristic zero. The some-root form carries irreducibility. The obstruction carries irreducibility, prime degree, degree at least five and the exact complex/real root-count equation. The two general-field quintic statements carry monicity, irreducibility, degree five and nonzero 5. The radical quintic form instead carries characteristic zero. The previous report's 21 unsuccessful one-tactic padding trials (15 inherited, 6 new there) are retained for the unchanged seven statements; no new padding probe is needed for link-only changes.

**Sources: all three changed links and all six sampled targets.** Each URL was fetched through the sources service, with the existing source id, without editing the PR or a manifest. No source is missing or paywalled. The following locators were opened in the legally obtained line-numbered texts.

| Sample / changed reference | Evidence and scope |
|---|---|
| Milne version identity | `milne-fields line 19`–20 identifies v5.10, September 2022, matching the new link and the cited pagination. |
| §1.1, finite-Galois criterion | `milne-fields line 3400`–3408: Lemma 5.33, printed pp. 76–77, restricts a base-changed splitting-field Galois group injectively into the original group. `line 3409`–3420: characteristic-zero Theorem 5.34 and its roots-of-unity/cyclic-tower route. The README's finite-extension formulation is obtained using a primitive element; it is not presented as a separate numbered theorem in Milne. |
| §2.1, all roots | `milne-fields line 3409`–3410, Theorem 5.34, printed p. 77. The characteristic-zero condition agrees. Constants and zero use the pinned root-set convention and trivial splitting-field group. |
| §2.2, some root | Same theorem, with the explicitly identified irreducible deduction. `Mathlib/FieldTheory/AbelRuffini.lean:313` supplies radical-root ⇒ solvable group; all-roots plus existence of a root gives the converse. |
| §2.3, prime degree | `milne-fields line 2217`–2225, Proposition 4.16, printed p. 52: irreducible rational polynomial, prime degree, two nonreal roots. Nonsolvability additionally uses degree at least five, as the README states. |
| §3.1, revised Chapman locator | `chapman-quintics line 4`–7 gives one page, title and date 22 January 1992. `line 16`–30 gives the collision argument; `line 18` and `line 22` give the two difference identities. “The whole one-page argument” identifies the source unambiguously without dependence on a private extraction's line numbers. |
| §3.1, generality beyond Chapman's rational setting | Chapman concludes that five times a root is rational (`chapman-quintics line 30`). The README explicitly replaces this by membership in F and assumes `5 ≠ 0`. The positive-sign alternative is already contradictory in characteristic two; no division by two occurs. Fresh computations below test both the allowed characteristic-two case and excluded characteristic-five case. |
| §3.2 and Dummit reference | `dummit-quintics line 44`–52: §2, printed p. 388, the invariant stabilizer F₂₀. `line 82`–105: printed p. 389, formula (2), its trinomial specialization and Theorem 1. `line 31`–32 restricts Dummit's general-field remark to characteristic different from 2 and 5. The roadmap's characteristic-two group form is justified by §3.1 plus the pinned arbitrary-field conditional theorem, not attributed to that remark. |

**Pinned evidence reopened.** The checked pins are Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, and content main `9c6e95d9`. These 12 groups of declarations were opened with their relevant binders this round:

| Object | File and line at the pin | Verified contract |
|---|---|---|
| Radical closure and one-way criterion | `Mathlib/FieldTheory/AbelRuffini.lean:194`, :201, :301, :313 | Intersection of intermediate fields closed under nonzero powers; arbitrary ambient extensions are not assumed to contain every radical. The irreducible theorem requires the actual root equation. |
| Cyclic Kummer extension | `Mathlib/FieldTheory/KummerExtension.lean:563` | Finite-dimensional extension, primitive root of its degree; cyclic Galois iff a power generator spans the extension. |
| Prime-degree group | `Mathlib/Analysis/Complex/Polynomial/Basic.lean:128` | Rational irreducible polynomial, prime degree and root-count difference two. |
| Symmetric nonsolvability | `Mathlib/GroupTheory/Solvable.lean:297` | At least five elements. |
| Distinct roots | `Mathlib/Algebra/Polynomial/Roots.lean:576`, :586, :591, :595 | Distinct-root set; constants, including zero, have empty root set. |
| Transitive action | `Mathlib/FieldTheory/PolynomialGaloisGroup.lean:181` | Irreducibility plus the splitting instance in the ambient field. |
| Cauchy's theorem | `Mathlib/GroupTheory/Perm/Cycle/Type.lean:491` | Prime dividing the finite group order yields an element of that order. |
| Quintic invariant/specification | `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Basic.lean:70`, :202, :215 | The stated ten monomials, F₂₀ specification and six-element orbit. |
| Specialization | `TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.lean:151`, :190 | Total coefficient substitution; identification with the root orbit product requires monicity, correct degree and a root listing with multiplicity. |
| Conditional quintic theorem | `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Solvable.lean:89`, :104 | Arbitrary field; monic, separable, irreducible quintic; the reverse implication also requires separability of the sextic. Thus §3.1 supplies a genuine missing hypothesis, rather than restating the supplier. |
| Reducible collision | `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Collision.lean:83` | The sextic of X⁵−X is (X−2)⁴(X²+16). |
| Prime-index step | `TauCeti/GroupTheory/Solvable.lean:78` (also checked by elaboration) | Finite, nontrivial, solvable group has a normal subgroup of prime index. |

**Cross-roadmap citations and ownership.** The eight completed-base layer references resolve on main: Layers 0, 1, 2, 3, 4, 5, 6 and 9 at `Completed/PolynomialGaloisGroups/README.md:442`, :532, :653, :711, :777, :1054, :1172 and :1385. The ninth scope reference is the supplied open Part II: `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:15`–54 describes ramified merging and partition refinements; :25 consumes the base's Layers 0–1. Its scope remains disjoint from the radical converse and automatic sextic separation. The new mathematics has a continuation owner; R01 concerns giving that owner an unambiguous identity.

Object searches used `roadmaps grep` for radical closure, radical criteria and sextic separation, `roadmaps show PolynomialGaloisGroupsPartII --pr 1419`, and the available board packages. No new construction or declaration was added by this diff. The service also surfaces an open revision of the base for which the brief supplies no comparison checkout; its search hits are not treated as verified ownership or as a supplier. The unchanged pin audit and nonduplication conclusions of the previous report are carried forward. No claim is made to have reviewed that unprovided revision.

**Adversarial mathematics: carried evidence.** The next 37 rows reproduce the earlier computed values carried by [review 9](PRREVIEW-PolynomialGaloisGroups~9.md), which in turn cites [review 8](PRREVIEW-PolynomialGaloisGroups~8.md). They cover native definitions, proof steps, all six sampled targets and all seven headlines. Historical repair instructions in rows 19, 20 and 30 are replaced by their already-verified repaired status. These are inherited computations, not claims of fresh recomputation.

| Statement | Instances tried | Values on the two sides / computed witness | Result and change  Provenance |
|---|---|---|------|
| 1. Native `Polynomial.Gal`, constants | `q=0,1,7` over ℚ | Root-set sizes `0,0,0`; splitting-field degrees and group orders `1,1,1`. | Matches README:48, :182; retain.  Review 9, inherited review 8 row 1 |
| 2. Distinct-root convention, repeated factors | `q=(X²−2)²` | Polynomial degree 4; distinct-root size 2; splitting-field degree 2; group C₂. Both roots are radical, so §2.1 gives true ↔ true. | No separability assumption on `q` should be added.  Review 9, inherited review 8 row 2 |
| 3. Radical closure, nonzero exponents | `√2`, `ζ₃`, and exponent 0 | `(√2)²=2`, `ζ₃³=1`: both admitted. At exponent 0 every `x⁰=1`, including nonradical quintic roots; the native `n≠0` excludes this wrong closure. | Native definition has the necessary exclusion.  Review 9, inherited review 8 row 3 |
| 4. The ambient radical closure matters | `E=ℚ(ζ₇+ζ₇⁻¹)`, `u=ζ₇+ζ₇⁻¹` | `u³+u²−2u−1=0`, degree 3, Gal=C₃. Inside E, a nonrational radical over ℚ would have at most two real conjugates `±x`, contradicting degree 3; internally the closure is ℚ, externally u belongs. | Supports the negative control. Its power argument is read with `n≠0` from the radical convention.  Review 9, inherited review 8 row 4 |
| 5. Choice of embedding | `ℚ(√2)` embedded by `√2↦±√2` | Both images square to 2 and generate the same radical subfield; group order 2 in either case. | Both sides unchanged; no distinguished embedding needed.  Review 9, inherited review 8 row 5 |
| 6. Finite-Galois iff, trivial extension | `E=F` | Group order 1, derived group order 1; every image is a base element. `true↔true`. | Retain §1.1, including degree 1.  Review 9, inherited review 8 row 6 |
| 7. Finite-Galois iff, nonabelian solvable extension | Splitting field of `X³−2` | Group orders along the derived series `6→3→1`; generators satisfy `α³=2`, `ζ₃³=1`. `true↔true`. | Checks a nonabelian group, not just cyclic cases.  Review 9, inherited review 8 row 7 |
| 8. Finite-Galois iff, quintic radical extension | Splitting field of `X⁵−2` | Group order 20, derived orders `20→5→1`; generators satisfy `α⁵=2`, `ζ₅⁵=1`. `true↔true`. | Retain Layer 1 example.  Review 9, inherited review 8 row 8 |
| 9. Finite-Galois iff, nonsolvable extension | Splitting field of `f=X⁵−4X+2` | Eisenstein at 2; `f(-2),f(-1),f(0),f(1),f(2)=−22,5,2,−1,26`; exactly three real roots. Group derived orders `120→60→60`; radical containment false. `false↔false`. | Supports the negative side.  Review 9, inherited review 8 row 9 |
| 10. Normality is substantive | `E=ℚ(α)` for a real root of the preceding quintic | `[E:ℚ]=5`; automorphism group order divides 5 but cannot be 5, since E is real and the quintic has nonreal conjugates; hence order 1. α is not radical. Dropping Galois gives `true↔false`. | `IsGalois F E` is retained in Lean.  Review 9, inherited review 8 row 10 |
| 11. Root-of-unity enlargement | `E=F`; splitting field of `X⁵−2` | `N=1` gives ζ=1 and degree 1. `N=20` gives ζ₂₀ with `ζ₂₀²⁰=1`; the required fifth root is `ζ₂₀⁴`, of order 5. | No division by zero: `N≥1`, and `p∣N` at nontrivial steps.  Review 9, inherited review 8 row 11 |
| 12. Restriction on a compositum | `ℚ(√2,√3)/ℚ(√3)` restricting to ℚ(√2) | Source and target automorphism groups both have order 2; the nontrivial source sends `√2↦−√2`, so kernel order 1. | Checks source, target, direction and injectivity.  Review 9, inherited review 8 row 12 |
| 13. Prime-index induction | `S₃⊃A₃`; `C₃⊃1` | Indices 2 and 3; fixed-field degrees 2 and 3; remaining degrees `6/2=3`, `3/3=1`. | Strict descent uses the prime index. Trivial group has no such step.  Review 9, inherited review 8 row 13 |
| 14. Kummer generator | `ℚ(√2)/ℚ`; `ℚ(ζ₃,∛2)/ℚ(ζ₃)` | Degrees 2,3; generators have powers 2,2 in the base; primitive roots `−1`, `ζ₃` have orders 2,3. | Matches the native finite cyclic theorem.  Review 9, inherited review 8 row 14 |
| 15. Splitting-field image generated by roots | `X²−2`; constant 1 | Adjoining `{±√2}` gives image ℚ(√2), degree 2; adjoining ∅ gives the base, degree 1. | Supports the Layer 1→2 passage.  Review 9, inherited review 8 row 15 |
| 16. All-roots iff, degree 0 and 1 | `q=0,1,X−1` | Root-set sizes `0,0,1`; groups trivial; the lone nonempty root is 1. Both sides true in all three cases. | Zero-polynomial convention is intentional, not an omitted hypothesis.  Review 9, inherited review 8 row 16 |
| 17. All-roots iff, quadratic | `q=X²−2` | Group C₂; both roots square to 2. `true↔true`. | Retain §2.1.  Review 9, inherited review 8 row 17 |
| 18. All-roots versus some-root | `q=(X⁵−4X+2)(X−1)` | Six distinct roots; exactly the rational root 1 is radical, while the five quintic roots are not; group S₅. All-roots: `false↔false`; unrestricted some-root: `false↔true`. | Retain irreducibility in §2.2/R02.  Review 9, inherited review 8 row 18 |
| 19. Some-root iff, both directions | `X−1`, `X²−2`, `X⁵−4X+2` | `(solvable, exists radical root)=(true,true),(true,true),(false,false)`. | Signature added and verified in review 9; unchanged here.  Review 9, inherited review 8 row 19 |
| 20. Prime-degree obstruction, degree five | `X⁵−4X+2` | Complex-root count 5, real-root count 3, difference 2; prime degree 5; radical roots 0. | All hypotheses and conclusion hold; signature added in review 9, unchanged here.  Review 9, inherited review 8 row 20 |
| 21. Prime-degree obstruction, low-degree controls | `X²+1`; `X³−2` | Nonreal-root counts 2,2; solvable groups C₂,S₃; all roots radical. Bounds `5≤2`, `5≤3` are false. | The lower bound cannot be omitted.  Review 9, inherited review 8 row 21 |
| 22. Invariant and stabilizer convention | Formal variables, all permutations; numeric roots `0,1,2,3,4` | Ten monomials; six formal orbit elements, stabilizer size `120/6=20`. Evaluations `128,142,122,152,122,142`. | Correct invariant; distinct formal invariants alone do not imply distinct specialized values.  Review 9, inherited review 8 row 22 |
| 23. Universal difference factorization | All 15 unordered pairs of the six formal invariants | Every difference equals a relabeling of the stated product; subtracting the products gives 0 in all 15 cases. For the numeric roots above, first two values differ by `128−142=−14`. | Confirms the degree-four factorization used by §3.1.  Review 9, inherited review 8 row 23 |
| 24. Collision equations | `uz=vw`, `uw=vz` with all variables nonzero; negative control `u=1,v=2,w=z=0` | Eliminating w,z gives `u²−v²=0`. In the negative control both initial equations are `0=0`, but `1−4=−3`. | Divisions require distinct roots; the proof supplies this.  Review 9, inherited review 8 row 24 |
| 25. Characteristic-two collision argument | `u²=v²` in a field of characteristic 2 | `(u−v)²=u²+v²=0`, so u=v; distinct root differences would give `xₐ=x_b`. | No division by 2 is used; characteristic 2 is valid.  Review 9, inherited review 8 row 25 |
| 26. Collision equations and division by five | Roots `0,1,2,3,4` with middle root 2; same roots shifted by t in characteristic 5 | Pair sums are `0+4=1+3=4=2·2`; total `10=5·2`. In characteristic 5 total is 0 and `5(t+2)=0`, so division by five is impossible. | Correct boundary of the displayed proof.  Review 9, inherited review 8 row 26 |
| 27. Separation, characteristic 2 | `𝔽₂[t]/(t⁵+t²+1)` | Irreducible; root codes `2,4,16,13,27`; six invariant codes `1,14,10,30,8,19`, all distinct. | Separation true; supports the extended generality.  Review 9, inherited review 8 row 27 |
| 28. Separation, characteristic 3 | `𝔽₃[t]/(t⁵+2t⁴+1)` | Irreducible; root codes `3,27,80,178,85`; invariant codes `1,215,211,240,128,201`, all distinct. | Separation true for another positive characteristic.  Review 9, inherited review 8 row 28 |
| 29. Separation, characteristic-five control | `𝔽₅[t]/(t⁵−t−1)` | Irreducible; roots `t,t+1,…,t+4`; invariant values `3,2,2,2,2,2`; sextic `(X−3)(X−2)⁵`. README's displayed difference is `20=0`. | Separation false, but `5≠0` false too; valid excluded control.  Review 9, inherited review 8 row 29 |
| 30. Separation, reducible control | `X⁵−X` over ℚ | `disc(f)=−256≠0`; resolvent `(X−2)⁴(X²+16)`; gcd with derivative `X³−6X²+12X−8`. | Original polynomial separable, resolvent not; wording repaired in review 9, unchanged here.  Review 9, inherited review 8 row 30 |
| 31. Sextic formula and solvable quintic | `X⁵−2` | Coefficients give `X⁶−50000X`; `R(0)=0`; gcd(R,R′)=1; `disc(f)=50000`; group F₂₀. | Both the group and radical equivalences give `true↔true`.  Review 9, inherited review 8 row 31 |
| 32. Dihedral example and coefficient sign | `X⁵−5X−12` | Resolvent coefficients descending `1,−40,1000,−20000,250000,−66400000,976000000`; R(40)=0; gcd=1; discriminant `64000000=8000²`; f irreducible mod 7. | D₅: solvable subgroup of A₅, with nonidentity complex conjugation since f has one real root. Both criteria true.  Review 9, inherited review 8 row 32 |
| 33. Sextic without a rational root | `X⁵−X−1` | Constant 9631 is prime; R(1)=6267, R(−1)=13877, R(9631)=797384129311106923012437, R(−9631)=798709926184825312571867. gcd(R,R′)=1. | All rational-root candidates fail; group and radical sides false.  Review 9, inherited review 8 row 33 |
| 34. S₅ identification in the preceding example | `X⁵−X−1` modulo 3 and 2 | Irreducible mod 3; mod 2 factors as `(X²+X+1)(X³+X²+1)`, giving cycle type (2,3), whose cube is a transposition. Degree five transitivity gives a 5-cycle. | Group S₅; independently supports the nonradical example.  Review 9, inherited review 8 row 34 |
| 35. Unconditional group criterion in small characteristics | The characteristic-two and characteristic-three irreducible quintics above | Both groups are C₅; each sextic has exactly one base-field root, namely 1. `true↔true` in each field. | README and Lean match; the radical form correctly retains characteristic zero.  Review 9, inherited review 8 row 35 |
| 36. The conditional supplier's collision warning | `X⁵−X` over ℚ | Splitting field ℚ(i), group C₂ (solvable), and sextic root 2. Complex conjugation acts as one transposition; no conjugate of F₂₀ contains that permutation. | The failed converse in the cited collision theorem is the root-to-stabilizer-containment converse. It is not a counterexample to solvability of this particular group.  Review 9, inherited review 8 row 36 |
| 37. Inseparable input and field boundary | F=𝔽₅(t), q=X⁵−t; the zero ring | q is irreducible with one distinct root α; its Galois group has order 1. All five repeated root entries give Φ=10α⁴=0, so the sextic is X⁶ and is not separable. The zero ring has 0=1. | The inseparable case fails 5≠0 and characteristic zero; Field excludes the zero ring. No headline silently admits either as an intended positive case.  Review 9, inherited review 8 row 37 |

The following 13 rows carry forward the additional computations and citation checks actually recorded in review 9. Their statements are also unchanged.

| Statement | Instances tried | Values computed on each side | Result and change  Provenance |
|---|---|---|------|
| §2.2 some-root iff, degree 1 | `q = X − 1` over `ℚ` | `q.Gal` order 1 (solvable); root set `{1}`, `1 ∈ ℚ ⊆ solvableByRad`. `true ↔ true`. | Holds; no positivity hypothesis needed beyond irreducibility (constants are not irreducible).  Review 9, added row 1 |
| §2.2 some-root iff, quadratic | `q = X² − 2` | Group `C₂`, derived series `2 → 1`; `(√2)² = 2`, so `√2` radical. `true ↔ true`. | Retain.  Review 9, added row 2 |
| §2.2 some-root iff, nonsolvable | `q = X⁵ − 4X + 2` | Eisenstein at 2; values at `−2,−1,0,1,2` are `−22, 5, 2, −1, 26` (three sign changes); derivative `5X⁴ − 4` has two real zeros `±0.9457…`, so exactly three real roots; group `S₅`, derived series `120 → 60 → 60`. By `isSolvable_gal_of_irreducible` no root is radical. `false ↔ false`. | Retain.  Review 9, added row 3 |
| §2.2, irreducibility needed | `q = (X⁵ − 4X + 2)(X − 1)` | Some root radical (`1`); `q.Gal` surjects onto `S₅`, not solvable. Unrestricted some-root form: `false ↔ true`. | Hypothesis `Irreducible q` is in the Lean signature (`Suggested.lean:56`) and the README; the Example at line 222 is the negative control.  Review 9, added row 4 |
| §2.3 obstruction, the intended case | `q = X⁵ − 4X + 2` | `Fintype.card (rootSet ℂ) = 5`, `Fintype.card (rootSet ℝ) = 3`, `5 = 3 + 2`; `natDegree = 5` prime, `5 ≤ 5`; conclusion: all five roots nonradical (row above). | All hypotheses satisfied, conclusion true.  Review 9, added row 5 |
| §2.3, lower bound needed | `q = X³ − 2` | Complex roots 3, real roots 1, `3 = 1 + 2` holds; prime; but `5 ≤ 3` false. Group `S₃` solvable; roots `2^(1/3) ζ₃ᵏ` radical. | `5 ≤ q.natDegree` cannot be dropped; the README says so (line 211).  Review 9, added row 6 |
| §2.3, irreducibility needed (new Check) | `q = (X² + 1)(X − 1)(X − 2)(X − 3)` | Expanded `X⁵ − 6X⁴ + 12X³ − 12X² + 11X − 6`, degree 5 prime, `5 ≤ 5`; distinct complex roots `i, −i, 1, 2, 3` (5), real roots `1, 2, 3` (3), `5 = 3 + 2`; splitting field `ℚ(i)`, group `C₂`; `i² = −1 ∈ ℚ` so every root radical. | New Check at line 228 is correct and discriminating: every hypothesis but irreducibility holds and the conclusion fails.  Review 9, added row 7 |
| §2.3, non-monic input | `q = 2X⁵ − 8X + 4` | Same roots as `X⁵ − 4X + 2`; irreducible in `ℚ[X]` (units are the nonzero constants); same counts `5 = 3 + 2`. | No monicity hypothesis needed; none is stated.  Review 9, added row 8 |
| §2.3, root-count hypothesis form | `q = X⁵ − 4X + 2` versus `q = X⁵ − X − 1` | First: `5 = 3 + 2`. Second: `X⁵ − X − 1` has one real root (derivative `5X⁴ − 1` vanishes at `±0.6687…`, where the polynomial takes the values `−0.4650…` and `−1.5350…`, both negative, so the graph crosses the axis once), hence `5 ≠ 1 + 2`; the hypothesis fails although the group is still `S₅`. | The hypothesis is sufficient, not necessary; the README claims only sufficiency.  Review 9, added row 9 |
| Summary clause "for an irreducible polynomial" (line 8) | `isSolvable_gal_of_irreducible`, `isSolvable_gal_minpoly` | Both pinned theorems carry an irreducible polynomial (`Irreducible q` at `AbelRuffini.lean:314`; the minimal polynomial at `:301`). | Wording now matches the pin.  Review 9, added row 10 |
| Layer 1 negative control, "`n ≠ 0`" (line 165) | `x = ζ₇ + ζ₇⁻¹`, `n = 0` versus `n = 3` | `x⁰ = 1 ∈ ℚ` for every `x`, so without `n ≠ 0` the argument would wrongly conclude `ℚ(x) = E` normal for the trivial reason; with `n ≠ 0` the argument needs an actual power in `ℚ`, and `u³ + u² − 2u − 1 = 0` shows no such power exists for `u ∉ ℚ` (degree 3 is odd). | The added clause aligns the Check with the native `n ≠ 0` in `solvableByRad.rad_mem`.  Review 9, added row 11 |
| §3.1 Check wording (line 287) | `X⁵ − X` over `ℚ` | `disc = −256 ≠ 0` (separable), reducible; sextic `(X − 2)⁴ (X² + 16)`, gcd with its derivative `(X − 2)³ ≠ 1`. | "Irreducibility cannot be omitted" is the correct hypothesis name; R04 repaired.  Review 9, added row 12 |
| `rootSet` citation (lines 71–73) | file lookup | `def rootSet` at `Mathlib/Algebra/Polynomial/Roots.lean:576`; not in `PolynomialGaloisGroup.lean`. | Corrected citation is right.  Review 9, added row 13 |

**Fresh checks of the changed locators and the mathematical claims they support.** No theorem signature or mathematical assertion was changed. The five fresh rows below test the revised bibliographic statements and recompute affected quintic examples. Finite-field integer codes encode coefficients in base p, in the indicated degree-five quotient; orbit ordering has no mathematical meaning.

| Statement | Instances tried | Values computed on each side | Result and change |
|---|---|---|---|
| New source links and source identities | Three URLs in References | Successful fetches 3/3. Milne version 5.10 and year 2022 agree; Dummit first/last printed pages 387/401 agree; Chapman page count 1 and date 1992-01-22 agree. | All revised bibliographic claims match the linked texts. Manifest remains R02. |
| Revised Chapman locator, §3.1 in characteristic two | F₂[t]/(t⁵+t²+1), roots encoded 2,4,13,16,27 | Six formal invariant orbit elements, stabilizer 120/6=20. Specialized values 10,30,1,14,19,8: six distinct values for six factors, hence separable. | Recomputed; allowed characteristic two remains sound. |
| §3.1 excluded characteristic-five case | F₅[t]/(t⁵−t−1), roots encoded 5,6,7,8,9 | Six invariant values 3,2,2,2,2,2; only two distinct; resolvent (X−3)(X−2)⁵ inseparable. Nonzero-5 hypothesis evaluates false. | Recomputed; division by five is substantive. |
| Dummit trinomial formula and §§3.1–3.2 | a=0, b=−2 | Descending sextic coefficients 1,0,0,0,0,−50000,0; R(0)=0. R′(0)=−50000; at any other root, R′=250000. All roots simple; group F₂₀ has derived orders 20→5→1 and the quintic roots are radical. | Separation true; both equivalences true↔true. |
| Dummit formula sign and second solvable example | a=−5, b=−12 | Descending coefficients 1,−40,1000,−20000,250000,−66400000,976000000; R(40)=0. Replacing −20000 by the source's +20000 adds 40000·40³=2560000000 at 40. | README has the corrected coefficient. Source misprint retained below. |

**Finding witnesses as adversarial checks.** R01's namespace comparison gives equality of the two namespace strings, while the Layer 1 topics differ (permutation groups versus radical criterion); the Part II citation selects permutation groups. R02's count is three referenced source ids and zero manifest entries because no manifest exists. These are the concrete failures to retest after the proposed repairs.

## Not verifiable

- No sampled text is unavailable: all three legally fetched texts were read at the affected locators. No reference request is pending.
- Ownership against open revisions whose files were not supplied was not checked beyond service search leads. The supplied Part II head and completed base on main were resolved directly; no unavailable revision is adopted as a supplier.
- The seven theorems remain admitted. Elaboration verifies their signatures; finite examples and the cited proof routes do not constitute formal proofs of the universal statements. The prior mathematical rows and padding probes are explicitly inherited, as required for this incremental review.

## Source issues

- **Gap** in dummit-quintics at Theorem 1 proof, printed p. 389: the source says transitivity on five remaining invariant values yields an irreducible quintic without excluding collisions; it should be preceded by Chapman's distinctness argument, chapman-quintics lines 16–30; affects the proof.
- **Misprint** in dummit-quintics at second example, printed p. 399: the source says the sextic's cubic coefficient is +20000; it should be −20000, since 160(−5)³=−20000; affects a stated result.
- **Misprint** in milne-fields at Proposition 5.27 proof, printed p. 74: the source says automorphism powers are distinct homomorphisms from F× to F×; it should be from E× to E×, since the automorphisms fix F; affects the proof.
- **Misprint** in milne-fields at Theorem 5.34 proof, printed p. 77: the source says Theorem 5.27 supplies the cyclic-extension step; it should be Proposition 5.27; affects nothing.
