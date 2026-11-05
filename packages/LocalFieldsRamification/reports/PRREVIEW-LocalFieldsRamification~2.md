# Review of LocalFieldsRamification (pull request #617 at 14889ce)

**Verdict:** needs changes

## R01 (P1) — Restore ownership of cyclic detection at the actual pin

**Location:** `TauCetiRoadmap/LocalFieldsRamification/README.md:204`, `:205`, `:442`, `:448`: “an upper break `u` is detected in a cyclic subextension”.

**Claim:** The cyclic-detection theorem and elementary-abelian Hasse–Arf are supplied by `Herbrand/CyclicReduction.lean` in pinned Tau Ceti. Detection is an essential input to §2.2.

**Witness:** At manifest pin `a91d3aa`, `Herbrand/CyclicReduction.lean` does not exist. Neither cited declaration occurs anywhere in Tau Ceti. The existing `Herbrand/HasseArf.lean:137` requires prime degree; degree four does not satisfy it.

**Repair:** Make cyclic detection an explicit README target before its use: for finite abelian local `L/K`, every upper jump is detected in a cyclic intermediate extension, with the stated eventual-triviality condition if that stronger version is needed. Give its finite-abelian-group separation argument and the native upper-quotient theorem as inputs. Remove the unsupported claim that elementary-abelian Hasse–Arf is already supplied; it can follow from the general target. Test detection on `ℚ₂(ζ₈)/ℚ₂`: the breaks 1 and 2 occur respectively in `ℚ₂(i)` and `ℚ₂(√2)`. Do not replace detection by prime-degree integrality or by an abstract filtration assumption.

Re-raised: H08 in `packages/LocalFieldsRamification/reports/GATE-LocalFieldsRamification~2.md`. Its answer relies on newer Tau Ceti `358314d`. This brief explicitly requires the branch's `lake-manifest.json`, whose Tau Ceti revision is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Availability at a different revision does not discharge this contract. The requested branch and its packages were checked directly. A scratch `#check` confirms both unknown names; the main build cannot detect a missing README-only prerequisite.

## R02 (P2) — Supply the graded-quotient input to the complete break list

**Location:** `TauCetiRoadmap/LocalFieldsRamification/README.md:330`: “the rest follows since `G = G_1` … and the subgroups of a cyclic `p`-group form a chain”.

**Claim:** Those facts imply strict increase of the `r` breaks and that every subgroup of order `p^(r−j)` occurs.

**Witness:** Filter `C₄` by `H₀ = H₁ = C₄`, `H₂ = 1`. All positive groups are 2-groups and the subgroups form a chain, but `c₁ = c₂ = 1`; the order-two subgroup never occurs.

**Repair:** Retain the true local-field theorem, but add the missing arithmetic input: each positive graded quotient embeds into the additive residue field, so it has exponent `p`; a nontrivial cyclic quotient therefore has order exactly `p`. Cite `TauCeti.ramificationGroupGradedToResidueField` and `TauCeti.ramificationGroupGradedToResidueField_injective` in `TauCeti/NumberTheory/LocalField/UnitFiltration/RamificationGroup.lean:481,506` in this target's Needs line. To justify `G₀ = G₁`, also cite the tame-quotient order bound at line 628 of that file and the total-ramification criterion in `RamificationGroup.lean:161`. The countermodel is then excluded because its first quotient has exponent 4, whereas an additive field of characteristic 2 has exponent 2. The actual cyclic quartic with breaks 2,4 has successive quotient orders 2,2 and passes. This is a defect in the stated proof route, not a counterexample to the local-field theorem.

## R03 (P3) — Use the actual namespace for tame conjugation

**Location:** `TauCetiRoadmap/LocalFieldsRamification/README.md:231`: `TauCeti.toTameQuotient_mul_tameInertiaHom_mul_inv`.

**Claim:** That fully qualified declaration is a pinned supplier.

**Witness:** `TauCeti/NumberTheory/LocalField/Tame/Quotient.lean:381` opens `namespace IsArithFrobeniusLift`; the theorem is at line 401. Lean rejects the README name and accepts `TauCeti.IsArithFrobeniusLift.toTameQuotient_mul_tameInertiaHom_mul_inv`.

**Repair:** Use the latter name. This is a namespace correction, not missing mathematics. On the order-21 quotient with `τ` of order 7 and arithmetic Frobenius of order 3, it gives `στσ⁻¹ = τ²`; the inverse convention gives `τ⁴`. The corrected pinned theorem has exactly the arithmetic convention.

## R04 (P3) — Correct the ClassFieldTheory section attribution

**Location:** `TauCetiRoadmap/LocalFieldsRamification/README.md:51`: “Finite-group Tate cohomology, class formations, local reciprocity and local duality are **ClassFieldTheory**'s (Layers 5–8).”

**Claim:** Layers 5–8 locate all four subjects.

**Witness:** On main, `TauCetiRoadmap/ClassFieldTheory/README.md:642` puts the Tate-supplier audit in Layer 0, and line 807 puts class formations in Layer 2. Layers 5–8 start with local coefficients and duality.

**Repair:** Attribute the finite-Tate baseline to Mathlib and its supplements to ClassFieldTheory Layer 0; cite Layer 2 for class formations, Layer 5 for local duality, and Layers 6–8 for local reciprocity/existence. Resolving those headings gives the requested subjects. This is a scope locator correction and creates no supplier edge to ClassFieldTheory.

## Verified sound

:robot: Independent AI review. This is a review comment for human consideration, not an approval. All 495 README lines and all 78 Lean lines were read, including unchanged passages. No worktree source was edited. The only changed files against `origin/main` are the two reviewed files; the outside-folder diff is empty. The requested head is exactly `14889ced739a59a4b1641d630246d8ad1579f562`. Main context is `c99407021ca54e77e61223896e876565b8c18aa4`; the branch packages match Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The previous seven findings were checked first:

| Previous finding | Passage at this head | Result |
|---|---|---|
| R01, noncommuting Herbrand claim | README:85, “can differ, but they need not”; lines 104–108 supply both numerical towers | Repaired: 9/4 versus 2, and 3 versus 3. |
| R02, duplicate native constructions | README:26, “exact declarations are listed under Exact supplier contracts”; Lean contains no new carriers | Substantially repaired. Implemented arithmetic/tame APIs are imported by name. The new cyclic-detection deferral fails at the actual pin: new R01. |
| R03, missing Sen headline | Lean:51, `pow_succ_dvd_lowerIndex_sub`; README:352 gives the same integer divisibility | Repaired. The complete-list and upper-sum targets remain explicit in §§1.1 and 1.3; they are consequences of the graded theory and Sen arithmetic, rather than additional independent deep acceptance statements. R02 repairs their route. |
| R04, Lean padding | Lean:13, “two, and both are statable there on native carriers” | Repaired: only the two deep theorems remain; all admitted examples and API wrappers are gone. |
| R05, structure and Checks | README:117, “Exact supplier contracts”; all eight numbered targets have Checks, and all three layers have Examples and Dependencies | Repaired for the retained programme. No new Lean definitions require an API catalogue. The lower-break notation is developed in Layer 1. |
| R06, sources and obsolete citations | README:487 gives Fesenko–Vostokov's edition and pp. 91–93; README:51 replaces the old `tateH` citation | Partly repaired. The precise Fesenko locators are checked below; the other books remain uncertified. The remaining ClassFieldTheory locator defect is R04. No source manifest exists. The repair report explicitly says its allowed edits excluded that file; this review does not reopen that operational limitation as a package finding. |
| R07, process narrative | Lean:9, “The roadmap is README.md; this file is not the roadmap” | Repaired. The cited review/history/PR-number passages are gone. |

The rewrite continues the existing local-fields roadmap; it does not create a second plan for its implemented programme. The removed algebraic/separable-closure comparison also has a native implementation, `TauCeti.absoluteGaloisGroupRestrictEquiv`, in `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:325`. There is no reason to restore a duplicate construction. No algorithm, sorry'd data, `set_option`, route-specific prime exclusion, or copied source passage was found.

The supplied gate reports all checks zero and `OK`, including build, dependency, imports, stray-files and outside-folder. Independent targeted `lake build TauCetiRoadmap.LocalFieldsRamification.Suggested` succeeded (9,004 jobs). Direct `lake env lean` on the original succeeded, with precisely two `declaration uses sorry` warnings and no other diagnostics. The stale PR-description count of admissions was not used.

The prescribed dependency check produced:

```text
depcheck: 185 roadmaps, 1131 edges, 0 problem(s)
```

All eight Needs clauses and the supplier list were read. There is no UPWARD or CYCLE line, no declared gap and no roadmap used as a proof supplier. The order is Layer 0 independent; §1.1 → §1.2 → §1.3; §§1.3 and 2.1 → §2.2. R01 is a missing pinned-library input, which the roadmap-order check does not detect.

Both declarations were queried with `#check @name` in one scratch copy. Their elaborated signatures retain both local-field structures, finite degree, compatible valuation extension, and respectively Galois/abelian-Galois hypotheses. Sen retains `ringChar 𝓀[K] = p`, total ramification, degree `p^r`, the generator equation, `j+1<r`, and both lower-index equalities; subtraction is in ℤ. There are no section variables to disappear. Nothing changed in the submitted signatures. Residue finiteness implies that `p` is prime, so an additional explicit primality hypothesis is unnecessary.

The headline inventory is exactly **Sen's congruence** and **general finite-abelian Hasse–Arf** (README:14); both are stated. The older arithmetic, norm, different and tame-presentation headlines are native deferrals. No unstatable headline or stand-in is used. One-tactic scratch probes tried `simp`, `rfl` and `infer_instance` on each admission; neither closed. An `exact` attempt with native prime-degree Hasse–Arf failed with the remaining prime-degree premise. Searches of the pinned ramification/lower-index APIs found no theorem supplying Sen's general conclusion. No padding finding remains.

### Seeded source sample

All eight sampled targets were inspected. No additional locator is explicitly marked unverified in the README. All four cited works were submitted to the source service; no repository source manifest was edited. Fesenko–Vostokov was fetched from the [author-hosted second edition](https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf). Printed pp. 91–93 were also rendered and read to resolve the extraction's inequality glyphs: the proposition uses ≥, not >.

| Target | Locator and result |
|---|---|
| 0.1, unit filtration of ℚₚ | Serre IV §2: text unavailable, no printed page supplied. Independently checked against native unit congruences and the p-adic integer/residue maps below. |
| 0.2, unshifted norm inclusion | Serre V §6: text unavailable, no printed page supplied. The displayed monotonicity deduction from the pinned shifted inclusion is valid, including depth zero. |
| 0.3, dyadic square classes | Neukirch II §5: text unavailable, no printed page supplied. Independently checked from pinned square-class cardinality, residue cardinality and e·f. |
| 1.1, lower-break list | `fesenko-vostokov` line 4166, III (4.3), unnumbered Proposition (1), p. 92: cyclic, totally ramified, degree pᵐ. Supports dependence on vₚ(k); strictness needs R02's additional input. |
| 1.2, Sen | `fesenko-vostokov` line 4183, Proposition (3), p. 92; proof lines 4192–4237, p. 93. The congruence and product/valuation induction support the target in both characteristics. |
| 1.3, upper breaks | `fesenko-vostokov` line 4163, proof on p. 92: the slope/divisibility step supports the conversion. The README sum follows by integrating its group orders. |
| 2.1, p-part reduction | `fesenko-vostokov` line 4137, proof on p. 91: removes unramified and prime-to-p parts. The README supplies the quotient-theorem formulation of the same reduction. |
| 2.2, Hasse–Arf | `fesenko-vostokov` line 4133, Theorem in III (4.3), pp. 91–92: finite abelian, separable residue extension. Finite residue fields satisfy that hypothesis. The book's h is ψ. |

### Adversarial mathematics

The following 40 rows give computed values, including every sampled target, both headlines, their constituent assertions and the findings' mathematical controls. “Keep” means no mathematical change is required; this review changes no source file. These are checks of statements and routes, not substitutes for proofs.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Native local-field hypotheses and positive cardinalities | ℚ₂, 𝔽₃((t)); trivially valued 𝔽₂; zero ring | Residue orders 2,3 and primes 2,3; trivial valuation has no nontrivial value; zero ring has 0=1 | Valid inputs have q≥2; last two excluded. Keep. |
| Finite-extension normalization and e·f | ℚ₂ itself, √2, √5 | (e,f,N)=(1,1,1),(2,1,2),(1,2,2); e·f=1,2,2=N | Keep; degree 0 impossible. |
| Additive valuation versus absolute value | 12 in ℚ₂; 2 and 1 | v(12)=2, 2^(−2)=1/4; v(2)=1, norm=1/2; v(1)=0, norm=1 | Correct sign. At zero use valuation-with-zero, not the unit-domain homomorphism. |
| Unit filtration, positive and negative membership | ℚ₂, units 1,5 and nonunit 2 | v(1−1)=∞; v(5−1)=2; v(2)=1; 5 lies in U₂ and not U₃, 2 not in U₀ | Both directions distinguish depth and unit conditions. Keep. |
| Graded-unit conventions | ℚ₂; ℚ₃ | #U₀/U₁=1,2=q−1; #U₁/U₂=2,3=q | Multiplicative depth zero and additive positive depth agree. |
| Lower index and integer group membership | ℚ₂(√2), nontrivial σ; identity | i(σ)=v(−2√2)=3, b=2; 2+1≤3 true, 3+1≤3 false; i(1)=∞ | G₂=C₂ and G₃=1. Identity has no finite assigned break. |
| Real lower indexing | ℚ₂(ζ₈), u=1,3/2,3,7/2 | Group orders 4,2,2,1 at ceilings 1,2,3,4 | Ceiling convention is correct. |
| Herbrand integral and inverse | ℚ₂(ζ₈), u=2,3; identity/unramified extension | φ(2)=1+1/2=3/2, φ(3)=2, ψ(2)=3; identity/unramified φ(2)=ψ(2)=2 | Inverse directions agree; 3/2 is not itself a jump here. |
| Upper-jump predicate | ℚ₂(ζ₈), u=1,3/2,2 | Orders drop 4→2 after 1 and 2→1 after 2; at 3/2 and 7/4 both orders are 2 | Breaks exactly 1,2; a constant interval is rejected. |
| Lower numbering versus quotient | ℚ₂(ζ₈), H={1,7}, quotient ℚ₂(√2) | #G₃H/H=2, #(G/H)₃=1; upper groups at 2 both have order 2 | Lower quotient equality fails, upper equality passes. |
| Herbrand tower order | ℚ₂⊂ℚ₂(√2)⊂ℚ₂(ζ₈), input 4 | Correct composite φ(5/2)=9/4; reverse φ(3)=2; direct φ(4)=9/4 | Keep repaired claim. |
| Tower commutation negative control | Unramified quadratic L/ℚ₂, M=L(√2), input 4 | φ(L/K)=id; φ(M/L)(4)=2+(4−2)/2=3; both composites=3 | Wildness does not force noncommutation. |
| Arithmetic/geometric Frobenius and tame relation | ℚ₂(ζ₇); C₇⋊C₃ | Arithmetic exponent 2, inverse exponent 4, 2·4≡1 mod 7; conjugation τ↦τ² | Keep convention; R03 corrects only the supplier name. |
| 0.1, congruence iff | p=2,u=5,i=2,3; p=3,u=−1,i=0,1 | 4 divides 4, 8 does not; 1 divides −2, 3 does not | Same truth values as filtration membership. |
| 0.1, residue comparison | p=5,x=7; p=2,x=5 | Residue and toZMod both yield 2; both yield 1 | Correct composition of the native residue equivalences. |
| 0.2, norm inclusion with floor | L=ℚ₃(√3),i=2,u=4 | v_L(4−1)=2, φ(2)=1, N(4)=16, v₃(16−1)=1 | Image lies in U₁ but not U₂. Keep floor target. |
| 0.2, shift argument | Same tame quadratic, n=2; ζ₈ extension,i=2 | ψ(2)=4 in tame case; for ζ₈, floor φ(2)=1 and ψ(1)=1≤2, whereas ψ(2)=3>2 | Antitonicity gives the claimed inclusion; ceiling is not justified by this argument. |
| 0.2, zero and unramified cases | i=0; unramified extension,i=2 | φ(0)=ψ(0)=0; unramified φ(2)=ψ(2)=2 | Norms of units remain units, with unchanged positive depth in unramified case. |
| 0.3, dyadic count | K=ℚ₂, ℚ₂(√2), ℚ₂(√5) | 4·2=8=2³; 4·2²=16=2⁴; 4·4=16=2⁴ | All three counts agree. |
| 0.3, converting q^v(2) | Last two quadratic fields | (q,v(2))=(2,2),(4,1); q^v=4,4=2^(e·f) | Distinguishes e from degree; false 4·2^e gives 16,8. |
| 0.3, excluded characteristics | ℚ₃; 𝔽₂((t)) | ℚ₃ square classes=4, not 8; in characteristic 2, squares have even t-exponents and 1+t is not a square | Neither is a finite extension of ℚ₂. Nonzero-2 premise of the native count is necessary. |
| Layer 1, cₖ and uniformizer independence | ℚ₂(√2), π=√2 and π'=3√2 | Both ratios σπ/π−1 and σπ'/π'−1 equal −2; v_L(−2)=2 | Same c₁=2; c at identity excluded. |
| 1.1, exact finite break list | ℚ₂(√2); real quartic subfield of ℚ₂(ζ₁₆) | r=1: [2]; r=2: [2,4]; generator powers have indices [3,5] | Actual field lists agree. |
| 1.1, strictness proof | Abstract C₄ with H₀=H₁=C₄,H₂=1 | c₁=c₂=1; one break versus claimed two; first quotient exponent 4 versus required 2 | R02: current subgroup-chain argument insufficient. |
| 1.1, subgroup orders and tail | Real quartic, j=0,1; i=5 | #G₂=4=2², #G₄=2=2¹, #G₅=1 | Keep. |
| 1.1, dependence on vₚ(k) | Same quartic, k=1,3,−1,2,6 | v₂=0,0,0,1,1; c=2,2,2,4,4 | Equal valuations yield equal depths. k=0,4 are identity powers and excluded. |
| 1.1, residue-prime restriction | ℚ₃(√3), group C₂ | Residue characteristic 3, group order 2, sole break 0 | Excluded from the cyclic 3-power layer. |
| 1.2, Sen headline | Real quartic; degree-9 subfield of ℚ₃(ζ₂₇) | 2 divides 4−2=2; 3 divides 4−1=3 | Nonvacuous instances pass. |
| 1.2, quantifier and subtraction boundaries | r=0,1; j=r−1; reversed hypothetical depths | No natural j satisfies j+1<r for r≤1; j=r−1 excluded; 2−4=−2 in ℤ | No identity-power or truncated-subtraction artefact. |
| 1.2, impossible arithmetic filtration | C₄ with breaks 2,3 | 2 does not divide 3−2=1; φ(3)=2+1/2=5/2 | Correctly ruled out, even though subgroup and quotient breaks separately are integers. |
| 1.2, product construction and distinct valuations | ℚ₂(√2), σ(π)=−π, k=1,−1 | α₁=π, α₋₁=π⁻¹ have valuations 1,−1; both displacement ratios −2 have valuation 2; k+cₖ=3,1 | Product/inverse construction has the stated values and separates these terms. |
| 1.3, upper-break sum and iff | Real quartic; degree-9 cyclotomic subfield | [2,2+(4−2)/2]=[2,3]; [1,1+(4−1)/3]=[1,2] | Both computed images are precisely the jumps; intermediate indices have constant groups. |
| 1.3, rank-one and negative control | ℚ₂(√2); impossible C₄ filtration | Empty sum gives u₀=2=b₀; bad second break gives 5/2, not an integer | Keep. |
| 2.1, removing unramified part | Unramified cubic; unramified quadratic composited with ℚ₂(√2) | First positive jump set empty; second has inertia order 2, lower break 2 and upper break 2 over either base | Denominator is inertia order, so positive indexing is unchanged. |
| 2.1, removing tame part | ℚ₂(i); ℚ₃(ζ₉) | First E=F, break 1; second lower orders 6,3,3,1 give φ(2)=1, and cyclic cubic quotient has break 1 | Positive break preserved; tame break 0 excluded. |
| 2.1, isomorphism on positive groups | ℚ₃(ζ₉), tame subgroup C₂ | At u=1 the positive group C₃ has trivial intersection with C₂; image order 3; at v>1 both orders 1 | Strict drop survives restriction. |
| 2.2, nonpositive and trivial cases | Identity; unramified cubic; tame quadratic | Jump sets ∅, {−1}, {0}; on (−1,0] group orders are respectively 1,1,2 | Boundary argument and all integer values agree. |
| 2.2, cyclic detection | ℚ₂(ζ₈), C₂×C₂ | G upper breaks 1,2; cyclic quotient breaks ℚ₂(i):1, ℚ₂(√2):2; later quotient groups order 1 | Mathematics passes; ownership at the pin requires R01. |
| 2.2, Hasse–Arf headline in mixed/equal characteristic | ℚ₂(ζ₁₆); y²−y=t⁻¹ over 𝔽₂((t)); y³−y=t⁻² over 𝔽₃((t)) | Lower [1,3,7] maps to upper [1,2,3]; Artin–Schreier lower/upper breaks are 1/1 and 2/2 | Both characteristics covered; all are integers. |
| 2.2, nonabelian negative control | Splitting field of X³−3 over ℚ₃, group S₃ | With α³=3, β=ζ₃−1, π=β/α: v(π)=3−2=1; wild c=3, tame c=0. Thus orders 6,3,3,3,1 give upper break 3/2 | Dropping abelianity is false. This independently verifies necessity without certifying the unread quaternion exercise. |

For the last row, the wild automorphism fixes β and sends α to ζ₃α, so its uniformizer ratio is ζ₃⁻¹ and the ratio minus 1 has valuation 3. The tame involution fixes α and inverts ζ₃; its ratio is −ζ₃⁻¹, whose difference from 1 is a unit. Thus the displayed S₃ filtration and 3/2 are computed directly. For the Artin–Schreier examples, use uniformizers 1/y and ty respectively; under y↦y+1 their ratio-minus-one valuations are 1 and 2.

The following additional checks concern the imported objects and deferrals, rather than new targets. They also test that the deferrals use compatible conventions.

| Imported statement | Instance | Computed values | Result / change |
|---|---|---|---|
| Finite extension versus separable extension | 𝔽₂((s))/𝔽₂((s²)) | e=2, f=1, degree=2, automorphism group order 1 | e·f still holds; Galois hypotheses in the headlines exclude this inseparable input. |
| Valuation and unit decomposition | 6 in ℚ₃ | 6=3·(−1)·(−2); valuation 1; residue of −1 is 2, residue of −2 is 1 | Uniformizer, residue root and principal unit have their intended roles. |
| Deep-unit logarithm | ℚ₂, depth 2 versus depth 1 | e=1<2; v₂(log 5)=2; log(−1)=0 although −1≠1 | Deep threshold excludes the torsion counterexample to injectivity. |
| General power classes | ℚ₃, n=2; ℚ₂, n=2 | 2·2·3⁰=4; 2·2·2¹=8 | Native nonzero-n hypothesis excludes n=0 and the characteristic-2 square case. |
| Unramified degree and norm valuation | Unramified cubic over ℚ₂ | e=1, f=3; N(2)=8, v₂(8)=3; value 1 is not in 3ℤ | Degree and norm-value formulas agree. |
| Eisenstein and valuation basis | ℚ₃(π), π²=3 | v_L(π)=1, v_L(2π)=1; v_L(1+π)=min(0,1)=0 | Eisenstein generator and basis normalization agree; zero polynomial excluded. |
| Tame radical | ℚ₃(√3); ℚ₂(√2) | e=2, gcd(2,3)=1; e=2, gcd(2,2)=2 | First is tame, second wild. |
| Norm on depth-zero residue units | ℚ₃(√3)/ℚ₃ | x↦x² on 𝔽₃× has image {1}, kernel size 2, index 2 | Correct tame exponent. |
| Positive norm before the break | ℚ₂(√2), t=2, v=1 | On 𝔽₂, x↦x²=x; kernel size 1, image size 2 | Before-break Frobenius is bijective. |
| Norm at the break | Same field, v=t=2 | Break polynomial x²−x is zero on 𝔽₂; kernel size 2, image size 1 | Distinct from the before/after-break maps. |
| Norm after the break | Same field, v=3, ψ(3)=4 | Source unit 5 has v_L(5−1)=4; N(5)=25 and v₂(25−1)=3 | Nonzero graded element maps to the nonzero element of 𝔽₂. |
| Different and discriminant | ℚ₂(√2); ℚ₃(√3); unramified quadratic | Different exponents 3,1,0; Hilbert sums 3·(2−1),1·(2−1),0; discriminant exponents f·d=3,1,0 | Wild bound 2≤3≤1+v_L(2)=3; tame d=e−1=1. |
| Wild inertia and tame quotient | Same wild/tame quadratics | Wild inertia orders 2 and 1; tame inertia quotient orders 1 and 2 | Definitions distinguish the two and exclude a whole-Galois-group substitute. |
| Arithmetic tame presentation | C₇⋊C₃ with q=2 | στσ⁻¹=τ²; unramified coordinate σ↦1, τ↦0 in ℤ/3; inverse marking gives 2 | Marking excludes the geometric generator as the arithmetic one. |
| Pro-p and Sylow carriers | C₂,C₃ at p=2; S₃ | Identity-open quotients have orders 2,3; Sylow C₂ in S₃ has index 3 and is not normal | Pro-p distinguishes the first two; Sylow does not silently mean normal. |

### Pinned definitions and duplication audit

An object-based search covered ramification groups and indices, Herbrand functions, jumps, norm filtrations, square classes, residue maps, tame conjugation, and absolute Galois comparison. The name audit covered **130 distinct fully qualified library names** in the README; their declaration signatures and surrounding namespaces were opened. It found the two absent names in R01 and the namespace error R03. The following are concrete pinned locations underlying the checks above; locations are relative to each library's source root, not to a newer checkout.

| Object opened | Pinned location and relevant content |
|---|---|
| Native local fields | Mathlib `Mathlib/NumberTheory/LocalField/Basic.lean:46`: `IsNonarchimedeanLocalField` includes valuative topology, local compactness and nontrivial valuation. It is not a bare arbitrary-topology field. |
| Abelian Galois hypothesis | Mathlib `Mathlib/FieldTheory/Galois/Abelian.lean:25`: `IsAbelianGalois` includes Galois and commutativity, but not finite degree; both headlines explicitly retain finite degree. |
| Lower index | Tau Ceti `TauCeti/RingTheory/LocalRing/RamificationGroup.lean:347`: `IsLocalRing.lowerIndex` is the infimum of displacement valuations over the valuation ring, with ENat values. Identity has value ∞. |
| Total ramification | Tau Ceti `TauCeti/NumberTheory/LocalField/RamificationIndex.lean:188`: `IsTotallyRamified` equates ramification index and finrank; it does not alone supply separability or finite dimension. |
| Lower/upper indexing | Tau Ceti `TauCeti/NumberTheory/LocalField/RamificationGroup.lean:262` gives real lower groups through ceilings; `Herbrand/Basic.lean:254,258,417` define φ, ψ and upper groups. |
| Jump and prime-degree integrality | Tau Ceti `TauCeti/NumberTheory/LocalField/Herbrand/Jump.lean:42` defines `UpperJump` using strict drop at every later index; `Herbrand/HasseArf.lean:137` proves integrality with a prime-degree premise. |
| Quotients and towers | Tau Ceti `TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean:98,264` supplies restriction/fixed-field compatibility; `Herbrand/Tower.lean:199,216,226` fixes composition order and natural ψ. |
| Unit filtration | Tau Ceti `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:99,115,125,299`: congruence subgroup mapped from integer-ring units, positive-depth membership, depth zero and antitonicity. `Uniformizer.lean:53` identifies positive graded units with the additive residue field. |
| Positive ramification graded groups | Tau Ceti `TauCeti/NumberTheory/LocalField/UnitFiltration/RamificationGroup.lean:481,506` defines the residue embedding and proves injectivity; line 628 bounds the tame graded group's order by q−1. These discharge R02's missing input. |
| P-adic residue comparison | Tau Ceti `TauCeti/NumberTheory/LocalField/Padic.lean:86,92,104` gives the integer-ring equivalence, its underlying map and residue cardinality. Mathlib `Mathlib/NumberTheory/Padics/RingHoms.lean:349,442` gives `PadicInt.residueField` and its compatibility with `toZMod`. The README's composite comparison is a small adapter, not a second carrier. |
| Norm bound | Tau Ceti `TauCeti/NumberTheory/LocalField/Norm/Herbrand.lean:177` is the shifted inclusion for finite Galois extensions. Its hypotheses and monotonicity yield §0.2. |
| Power and square classes | Tau Ceti `TauCeti/NumberTheory/LocalField/PowerSubgroup/Basic.lean:325,414` gives cardinalities with nonzero n/2 in the field; `PowerSubgroup/Open.lean:42` gives openness under the nonzero condition. |
| Residue cardinality and e·f | Tau Ceti `TauCeti/NumberTheory/LocalField/InertiaDegree.lean:71,84,101` supplies residue degree, cardinality and e·f; `AbsoluteRamificationIndex.lean:103,137` supplies the characteristic-zero p-adic extension and valuation of natural scalars. |
| Norm transitions | Tau Ceti `TauCeti/NumberTheory/LocalField/Norm/Graded.lean:293,397,549,646` distinguishes tame depth zero, before-break, break polynomial, and break kernel/index; `Norm/AfterBreak.lean:107` gives bijectivity after the break. |
| Different/discriminant | Tau Ceti `TauCeti/NumberTheory/LocalField/Different/Basic.lean:92,148`, `Different/Wild.lean:90`, `Different/Hilbert.lean:91`, and `Discriminant/Basic.lean:157`: definitions, separable tame criterion, wild bounds, Hilbert sum, and f·d. Separability premises were retained when reading these statements. |
| Tame presentation and convention | Tau Ceti `TauCeti/NumberTheory/LocalField/Tame/Quotient.lean:401`, `Tame/Presentation.lean:106,158,398`, `Tame/Geometric.lean:112,198`: arithmetic conjugation, presented group/coordinate/comparison and inverse convention. R03 is only the fully qualified name. |
| Profinite carriers | Tau Ceti `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68` defines pro-p via open normal quotients, without putting compactness/Hausdorffness in that predicate; `TauCeti/Topology/Algebra/Group/Profinite/Sylow/Basic.lean:62` adds closedness and finite-image index conditions. Ambient hypotheses must still be supplied. |

The native square-class result remains general; the dyadic count is its explicitly scoped consequence, not a replacement for general local fields. The same applies to the p-adic unit comparison. There are no new Lean carrier declarations or fully qualified name collisions with another roadmap. The two remaining theorem names are unique to this roadmap's continuation.

### Ownership and cross-roadmap citations

The ownership searches used the roadmap service over the indexed open heads and main, as well as the supplied board packages. They searched the mathematical objects, not just these two theorem names. Existing revisions of LocalFieldsRamification were treated as revisions of the same owner, not alternative suppliers. This review did not use those revisions to fill the missing pinned input.

| Citation or possible owner | Resolved location and boundary |
|---|---|
| NumberFieldArithmetic | Main `Completed/NumberFieldArithmetic/README.md:1643` treats monogenic local completions; line 1731 starts ramification groups; line 2235 points toward local Hasse–Arf. Its global arithmetic applications consume the local theory. |
| ClassFieldTheory | Main `TauCetiRoadmap/ClassFieldTheory/README.md:642,807,920,1220,1312,1433` resolves Layers 0,2,5,6,7,8. Open revision `ClassFieldTheory/README.md:149` also imports local theory. R04 corrects the scope attribution; this later work is not a proof supplier. |
| LocalGaloisGroups | Main `Completed/LocalGaloisGroups/README.md:146,152` consumes local arithmetic and extension counts. No new local-field carrier should be planned there. |
| ProfiniteProPGroups | Main `Completed/ProfiniteProPGroups/README.md:18,68` separates abstract profinite/pro-p structure from local arithmetic. This agrees with the scope boundary. |
| MassFormula | Main `TauCetiRoadmap/MassFormula/README.md:103,144` imports local arithmetic. It is a consumer, not an owner of Sen or Hasse–Arf. |
| LocalFieldsRamificationPartII | `packages/LocalFieldsRamificationPartII/design/plan.json` and its design scope extend the base toward general valued-field/Krull, henselization, tame and defect theory. No competing finite-local Sen/Hasse–Arf target was found. It is not used here as a supplier. |
| ArtinRepresentations | Supplied open head `TauCetiRoadmap/ArtinRepresentations/README.md:196` imports the local filtrations and Hasse–Arf. |
| PadicExtensionFamilies | Supplied open head `TauCetiRoadmap/PadicExtensionFamilies/README.md:59,326` consumes the baseline local theory and owns extension-family questions. |
| FunctionFieldArithmetic | Supplied open head `TauCetiRoadmap/FunctionFieldArithmetic/README.md:306` imports local Hasse–Arf. |
| AlgebraicCurves | Supplied open head `TauCetiRoadmap/AlgebraicCurves/README.md:1014` distinguishes finite-residue local input from the more general complete-DVR setting needed by curves. That wider setting is not a duplicate of this finite-residue headline. |

The service's citation resolver reported no missing citations, but explicitly did not check external Lean names because it had no pinned Lake packages in its configured search location. Direct inspection of this branch's packages is therefore decisive for R01 and R03. No upward dependency, cycle, computational programme, or competing new-roadmap ownership was found. No ownership move is required beyond making R01's missing prerequisite an explicit target here.

## Not verifiable

- **Serre, Local Fields**, DOI `10.1007/978-1-4757-5673-9`: the source service found only the paywalled publisher record and returned `uncertified`. Consequently IV §2 (unit filtration), IV §3 (Herbrand theory and the quaternion exercise), V §6 (norm inclusion) and V §7 were not verified against the text. The README supplies section locators but no printed pages. The independent native-library and numerical checks above do not certify these source locators. This settled paywalled citation was not added to the missing-text request.
- **Neukirch, Algebraic Number Theory**, DOI `10.1007/978-3-662-03983-0`: the source service returned `uncertified` at the paywalled publisher record. II §5, cited for the dyadic count, has no page locator here and was not read. The cardinality formula was checked independently against the pinned library. This settled paywalled citation was not requested again.
- **Sen, On Automorphisms of Local Fields (1969)**: the source service resolved DOI `10.2307/1970680` to a JSTOR landing page without a readable legal text. The [official Annals record](https://annals.math.princeton.edu/1969/90-1/p04) confirms volume 90, pp. 33–46, but provides no theorem text used in this review. Its original numbering/proof remain unverified. The missing-text request retains the existing key `sen1969`. The precise Fesenko–Vostokov proposition supporting §1.2 was read instead.

There is no source manifest in this package, and this read-only review edits none. Missing-source status is recorded separately from the two blocking findings; the review is complete rather than awaiting those books. No general claim that every cited source was certified is made.

## Source issues

- none
