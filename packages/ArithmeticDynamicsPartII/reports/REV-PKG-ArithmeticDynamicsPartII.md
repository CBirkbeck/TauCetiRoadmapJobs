<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1041#issuecomment-6378162067 -->
Review (claude) of 4ba5ef1

Verdict: needs changes

1. **F01** (P2) `effective_connectivity` states an endpoint that no source or route establishes

   **Location.** `packages/ArithmeticDynamicsPartII/Suggested.lean:159–163`: `theorem effective_connectivity … (hp : 3489 * 10 ^ 389 < p) …`. README line 677: "Prove connectivity and positive integral lifting for every prime p>3489·10^389". README line 470: "The stronger inequality with constants (6,4) is an additional local theorem required before using the smaller order intervals."

   **Claim.** The acceptance file presents the numerical endpoint as a theorem of the finished roadmap. `Suggested.lean` is meant to hold only statements the roadmap is sure of.

   **Witness.** EFLMT24's ≈3.45·10^392 (line 1027) rests on the (6,4) constants that §5.1 rejects. At the source's N, the repaired guard 1492992·C₉₃⁸ ≈ 1.016·10^394 exceeds N+2 ≈ 3.448·10^392, so the repaired test fails there. Gap line 73 still asks for the endpoint.

   **Repair.** Delete `effective_connectivity` from `Suggested.lean`; `eventual_connectivity` already states the eventual theorem. In README §5.14, either:
   - make the (6,4) inequality a named target of §5.1, stating (3/2)·max((6td)^(1/3), 4td/p) with its hypotheses, and make the 3.45·10^392 endpoint conditional on that target; or
   - state connectivity above the endpoint that the §5.13 criterion yields with the §5.1 constants, with no numeral.

   Remove the backticked name from line 677. Tested: `effective_connectivity` appears only at Suggested.lean:160 and README:677, so no other declaration depends on it. The remaining file elaborates, as the full file does.

2. **F02** (P2) Layer 5 writes EFLMT24's Algorithms 1–3 and a certificate value into the roadmap

   **Location.** README line 615: "an exhaustive partition by admissible prefixes and powers of two". Line 636 (§5.12): the degree-k coefficient is unchanged "when every intermediate product is reduced modulo T^(k+1)". Line 656: "The resulting finite descending sequence of rank inequalities must strictly decrease at each refinement". Line 685: "C₉₃(N)=3013671869689423302959704266406116383317724743440".

   **Claim.** These targets are an enumeration procedure, truncated polynomial multiplication, a termination measure and a computed certificate. The principles forbid computational algorithms and large computations.

   **Witness.** §§5.11, 5.12 and 5.13 cite EFLMT24's Algorithms 2, 3 and 1 (EFLMT24 lines 1054, 1204 and 953). EFLMT24 line 1202 reports that the combined run met 124,720,785 reduced numbers.

   **Repair.**
   - Delete §5.11 and §5.12, together with their Checks, their entries in the §5.13 *Needs:* line (line 673) and their entries in the Layer 5 Dependencies.
   - In §5.13, keep the mathematical criterion (EFLMT24 Theorem 4.2 as a statement: if the rank inequalities hold for every reduced n in [L, 4U−2], then G_p is connected for L<p≤U). Delete the refinement and termination sentences.
   - Delete N, Ω(N) and C₉₃(N) from §5.14 and from the Layer 5 Examples.
   - In the same spirit, state the q<203,897 exclusion in §7.5 and the transitivity at 770 in §7.6 as named finite facts cited to MP18 (line 1435 and line 1240). The set at 770 has 4·40·28·88 = 394,240 points. Do not plan the verification as library work.

   Tested: after the deletion, only line 673 cites §§5.11–5.12.

3. **F03** (P2) §6.0 plans again the admissible-cover stack that InverseGaloisAndArithmeticFundamentalGroups §IG.5.4 owns

   **Location.** README line 697: "construct the stack of connected H-covers of pointed smooth genus-one curves, branched only at the section, and its balanced admissible-cover compactification over stable pointed genus-one curves". The *Needs:* line (line 714) cites only §IG.3.2 of that roadmap.

   **Claim.** §6.0 builds Adm(H) itself instead of importing it.

   **Witness.** At its open head, §IG.5.4 ("Admissible stacks and stable marked G-curves") builds the proper Deligne–Mumford stack of balanced admissible G-covers for every 2g−2+n>0, (1,1) included, with vertical automorphisms Z(G). It excludes only rigidification and the (1,1) compactification of G-structures.

   **Repair.**
   - Import Adm(H) from §IG.5.4 at (g,n)=(1,1): add it to "Exact supplier contracts" and to the §6.0 *Needs:* line.
   - Keep as this roadmap's targets only the center-rigidified Level(H), its compactification, the coarse degree, and the ramification/cotangent congruence.
   - Change Scope line 13 and the SchemeAndStackFoundations contract (line 63) to match.

   Tested: (1,1) satisfies 2g−2+n = 1 > 0, the hypothesis of §IG.5.4, and that roadmap precedes this one in the merge order (line 53 versus line 276).

4. **F04** (P2) the uniprimitive order bound in §7.5a has no supplier for its key input

   **Location.** README line 903: "prove |G|<exp(4√n(log n)²) if G is not two-transitive (`primitive_order_bound`)". The *Needs:* line (line 905) lists only Mathlib items and this subsection's socle targets. No proof route is given.

   **Claim.** The bound is stated with no owned input.

   **Witness.** The bound follows from Babai's distinguisher estimate (any two points are separated by at least √n/2 points) and a base of size about 4√n·log n. The estimate is PolynomialGaloisGroupsPartII §4.4 `babai_distinguishers` (open head), uncited in §7.5a.

   **Repair.** Add PolynomialGaloisGroupsPartII §4.4 to the supplier contracts and to the §7.5a *Needs:* line. Add §4.5 (Bochert) as well if the two-transitive section bound uses it. Add a one-sentence route for each bound, for example: distinguishers give a base B with |B| ≤ ⌈4√n log n⌉, and then |G| ≤ n^|B|. Tested: PolynomialGaloisGroupsPartII is at line 269 of ORDER.txt and this roadmap at line 276, so the citation points down the order.

5. **F05** (P2) the declared gap is compound and asks for elementary and in-roadmap content

   **Location.** README line 73 and the `gaps` entry in `design/plan.json`: "…together with proved values and domains sufficient to bound n/φ(n)≤τ(n) and produce a finite numerical endpoint for the two repaired order intervals."

   **Claim.** The `needs` sentence bundles three requests:
   - an explicit divisor constant;
   - an elementary inequality;
   - this roadmap's own endpoint computation.

   The word "repaired" is also process wording.

   **Witness.** README line 71 already derives n/φ(n) ≤ τ(n) for n ≥ 1. The endpoint is the §5.13–§5.14 computation of this roadmap. ErdosProgressionPowers §0.9 already provides an effective N with τ(n) ≤ n^ε.

   **Repair.** Narrow `needs` to a single export: "numerical C ∈ ℚ>0 and N ∈ ℕ with τ(n) ≤ C·n^(1/16) for every n ≥ N (§0.9 gives an effective N; the numerical value is missing)". Prove n/φ(n) ≤ τ(n) locally in §5.4 from Mathlib `Nat.totient` and `Nat.card_divisors`. If §5.14 loses its numeral under R01, delete the gap instead. If plan.json may only gain entries at this stage, add the narrowed gap under a new slug and cite that slug. Tested: at n=12, n/φ(n) = 3 ≤ τ(12) = 6.

6. **F06** (P3) design-stage labels and vague section references

   **Location.**
   - "CA.4" at lines 91, 111, 249, 410, 412, 422, 821, 929 and 939.
   - Line 264: "Under the MD.6 moduli dictionary, rotation cycles identify the specified cusp classes".
   - Line 939: "their transitivity checks are in MD.0".
   - Line 881: "apply FF.2's geometric non-square bound".
   - "§3.0 (the specified finite-field estimate)" at lines 330, 346, 376, 474, 883 and 921.

   **Witness.** MD.k are the design's layer labels (design README lines 27–34). No roadmap FiniteFieldsAndCharacterSums exists on main or at any open head. §3.0 contains three different estimates.

   **Repair.**
   - Replace each CA.4 with "ClassicalArithmeticCompletion §4.x", naming the exact section (4.92, 4.101, 4.106, 4.108 or 4.111).
   - Replace MD.0 with §0.4.
   - Replace FF.2 with "the §3.0 quadratic-character bound".
   - Replace the line-264 bullet with a §6.0 target, "γ∞-orbits correspond to cusps" (C24, Proposition 5.2.20, pp. 403–404), or delete it.
   - Name the §3.0 estimate that each *Needs:* line uses.

7. **F07** (P3) locator errors

   **Location and witness.**
   - Line 247: C24 Proposition 5.3.3 is cited at "pp. 406–408". It is on p. 409 (C24 line 4391; extraction page 109).
   - Line 712: Corollary 4.12.5 is cited at "pp. 389–390". It is on p. 391 (C24 line 3599).
   - Line 714: "Propositions 3.5.2 and 4.10.3". Item 4.10.3 is a Theorem (C24 line 3340).
   - Line 697: Theorem 2.5.2 starts on p. 335, not p. 336 (C24 line 1364).
   - Line 35: `Equiv.Perm` is cited at `Mathlib/Logic/Equiv/Defs.lean:131`. It is at :94; line 131 is `Perm.congr_arg`.
   - Line 47: `TauCeti.AffineGroup.isPreprimitive` and `natCard_range_toPermHom` are cited at :80 and :85. They are at :84 and :89.
   - Lines 11, 71, 338, 346, 366 and 681 cite "Explicit totient and divisor bounds". At its head, ErdosProgressionPowers puts the divisor-subpower bound in §0.9 "Explicit prime arithmetic".

   **Repair.** Correct each locator as given.

8. **F08** (P3) the cage's parabolic clause is attributed to BGS16, which does not contain it

   **Location.** README line 306: "include the nonempty parabolic slices at ±2 as specified by the BGS endgame."

   **Witness.** BGS16 lines 510–527 (§3.2, p. 11) define the cage as the set of maximal points only. That parabolic triples join the large component is stated by EFLMT24 (lines 141–142, p. 4), citing BGS.

   **Repair.** Drop "as specified by the BGS endgame". Either cite the parabolic clause to EFLMT24 p. 4, or make "for p≡1 mod 4 the parabolic slices lie in the cage orbit" a named target of §3.3 with a locator.

9. **F09** (P3) `bigOmega` restates Mathlib's Ω, and two names shadow root declarations

   **Location.** `Suggested.lean:134` `def bigOmega (n : ℕ) : ℕ := n.factorization.sum fun _ a => a`; `:56` `def rotation`; `:140` `def IsReduced`.

   **Witness.** `ArithmeticFunction.cardFactors` (`Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:258`). At the pins, `bigOmega n = ArithmeticFunction.cardFactors n` closes by `rw [ArithmeticFunction.cardFactors_eq_sum_factorization]; rfl`. `_root_.rotation` and `_root_.IsReduced` also exist at the pin.

   **Repair.**
   - Delete `bigOmega` and use `ArithmeticFunction.cardFactors` in `divisorRank` and `central_rank_bound`.
   - Cite it in README line 582 and in the Mathlib contract.
   - Rename `rotation` to `markoffRotation` and `IsReduced` to a distinct name such as `IsMaxDivReduced`, in both files.

10. **F10** (P3) the two permutation-group bounds are not headlines of this roadmap

   **Location.** `Suggested.lean:226–243`: `primitive_order_bound` and `primitive_section_bound`.

   **Witness.** Neither statement mentions any Markoff object. Both are general tools for the §7.5 induction (MP18 Theorem 5.12, line 1369). The roadmap's end theorems are those of §§7.7–7.8.

   **Repair.** Delete both declarations from `Suggested.lean`. Keep §7.5a as README targets, without the backticked names at line 903. Change the sentence of the module docstring at lines 14–15 to match.

11. **F11** (P3) `oriented_transitivity` is narrower than its source

   **Location.** `Suggested.lean:207` `(hp : 5 ≤ p)`; README line 791: "For prime p≥5, if Γ is transitive on X*(F_p), then Γ⁺ is transitive".

   **Witness.** C24 Theorem 5.5.7 (line 4654) asserts part (a) for every prime outside E_bgs. At p=2 the four points {111, 110, 101, 011} form one Γ⁺-orbit (computed). At p=3, X* is empty.

   **Repair.** Drop `hp` from the finite-action statement. Keep p≥5 only for the stack clause. Add p=2 as a Check.

12. **F12** (P3) §4.1 proves again an equivalence that ClassicalArithmeticCompletion §4.111 already states

   **Location.** README line 410: "The image of the CA.4 positive integer reduction map is exactly this root orbit, so these conditions are equivalent to CA.4's prime strong-approximation predicate". Route at line 412.

   **Witness.** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` §4.111 lists `markoffStrongApproximation_iff_orbit`: strong approximation at p holds iff every nonzero point is a move-word applied to (1,1,1).

   **Repair.** Cite §4.111 `markoffStrongApproximation_iff_orbit` for this equivalence. Delete the last route sentence at line 412.

13. **F13** (P3) layer Dependencies leave out suppliers that the layer's sections use

   **Location.**
   - Line 805 (Layer 6): "ClassicalArithmeticCompletion §4.58; Mathlib `orderOf`; §0.4; §4.2."
   - Line 384 (Layer 3).
   - Line 462 (Layer 4).

   **Witness.**
   - §6.0 *Needs:* (line 714) uses ArithmeticGaloisRepresentations §4.4, SchemeAndStackFoundations §§1.18–1.23 and 4.15, and §IG.3.2.
   - §6.1 *Needs:* (line 724) uses the Tau Ceti trace identity.
   - §3.0 (line 302) and §4.0 (line 406) use SchemeAndStackFoundations.

   **Repair.** Add these suppliers to the three Dependencies lists.

Files reviewed: `packages/ArithmeticDynamicsPartII/README.md` (972 lines), `packages/ArithmeticDynamicsPartII/Suggested.lean` (276 lines), `packages/ArithmeticDynamicsPartII/metadata.toml`, `packages/ArithmeticDynamicsPartII/sources.toml`, and the declared gap in `packages/ArithmeticDynamicsPartII/design/plan.json`. Thirteen findings: five blocking (P2), eight non-blocking (P3). No P1. No previous review exists, so nothing is re-raised.

## Verified sound

### Elaboration, binders and padding probe

- `lake env lean` on `packages/ArithmeticDynamicsPartII/Suggested.lean`, run from the content checkout at the manifest pins (toolchain v4.35.0-rc3):
  - exit 0;
  - 21 warnings, every one "declaration uses `sorry`";
  - no errors, no `set_option`, a single `import Mathlib`, no sorry'd data.
- `#check @name` file (scratch copy): all 35 declarations elaborated. The file has no `variable` block, so no binder can be lost. Every elaborated type matches its README statement; nothing changed.
- One-tactic probe (scratch copy, `first | rfl | infer_instance | (simp; done) | (norm_num; done) | sorry` in place of each `sorry`): none of the 21 theorems closes. No declaration restates a definition or computes a small value.

### Dependency check

`depcheck: 29 roadmaps, 255 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

### Library declarations opened at the pins

All declarations below were checked at the file and line given.

**Mathlib (22 cited and correct, plus `ArithmeticFunction.cardFactors`, opened for R09):**
- `Subgroup.closure` (Lattice.lean:329)
- `MulAction.orbit` (GroupAction/Defs.lean:49)
- `SimpleGraph` (Basic.lean:93)
- `SimpleGraph.Reachable` (Connected.lean:51)
- `SimpleGraph.ConnectedComponent` (Connected.lean:389)
- `ZMod` (Defs.lean:138)
- `ZMod.castHom` (Basic.lean:331)
- `ZMod.natCast_eq_zero_iff` (Basic.lean:519)
- `ZMod.chineseRemainder` (Basic.lean:889)
- `orderOf` (OrderOfElement.lean:181)
- `Nat.divisors` (Divisors.lean:52)
- `Nat.factorization` (Factorization/Defs.lean:50)
- `Nat.totient` (Totient.lean:37)
- `Nat.minFac` (Prime/Defs.lean:218)
- `MulAction.IsBlock` (Blocks.lean:171)
- `MulAction.IsPreprimitive` (Primitive.lean:91)
- `IsPreprimitive.isQuasiPreprimitive` (Primitive.lean:287)
- `RingOfIntegers.dvd_norm` (Norm.lean:76; finite Galois)
- `Algebra.norm_eq_prod_embeddings` (Transitivity.lean:261; separable, algebraically closed target)
- `Algebra.norm_ne_zero_iff` (Norm/Basic.lean:110; domains, free and finite)
- `IsCyclotomicExtension.finrank` (PrimitiveRoots.lean:177; irreducible cyclotomic)
- `Fintype.sum_equiv` (Finset/Defs.lean:741; cited at :739, inside its attribute block)
- `ArithmeticFunction.cardFactors` (R09)

**Mathlib, cited at the wrong line:** `Equiv.Perm` (R07).

**Tau Ceti (6):**
- `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` (FinTwo.lean:127). It uses ABA⁻¹B⁻¹, works over any commutative ring, and has the −2.
- `MulAction.IsBlock.of_le` (:54) and `MulAction.IsPreprimitive.of_le` (:59).
- `fixedPoints_stabilizer_eq_singleton` (:71). It needs faithful, preprimitive, nontrivial.
- The two affine declarations (R07).

### Cross-roadmap citations resolved

- **ClassicalArithmeticCompletion on main:** §§4.3, 4.23, 4.38, 4.42, 4.43, 4.44, 4.57, 4.58, 4.62, 4.76, 4.92, 4.101, 4.103, 4.106, 4.108 and 4.111 all exist. Their content matches the contracts: surfaces, moves, the twist with its 𝔽₃ exception, the point count p²+3pχ(−1), and the predicate. §4.111 says its theorems belong to this Part II, which is consistent.
- **SchemeAndStackFoundations on main:** §§0.1, 0.2, 1.18, 1.19, 1.21, 1.23, 3.1–3.3, 4.15 and 5.9–5.11 exist.
- **WeilConjectures (open head):** WC.5 "Compatibility with curve and elliptic bounds" and "The independent surface route to curve bounds", and WC.7 "Curves and their Jacobians", exist. They give |N_r−1−q^r| ≤ 2g·q^(r/2) with b₁ = 2g.
- **InverseGaloisAndArithmeticFundamentalGroups:** §IG.3.2 "Exterior epimorphisms and T-systems" exists; see R03 for §IG.5.4.
- **ArithmeticGaloisRepresentations:** §4.4 "Dickson's classification" exists, including the characteristic-2 conclusion.
- **ErdosProgressionPowers:** §0.9 gives the eventual divisor-subpower bound (R07).
- **ArithmeticDynamics (open head):** has no Markoff content, so the Part II scope is accurate.
- **Merge order:** all of these suppliers precede line 276 in ORDER.txt.

### Ownership against open work

The following were searched, by object and not only by name, in the roadmaps on main, every open roadmap pull request (`roadmaps grep`) and the board packages:
- Markoff orbit theory;
- admissible covers;
- primitive-group bounds;
- divisor antichains.

What the search found:
- **NonabelianLevelStructures** (board design, ORDER line 278, after this roadmap) plans elliptic level stacks and Markoff orbit divisibility (its NL.1–NL.6). The merge order makes this roadmap the owner of §§6.0–6.5, so that design must import them; this is not a defect of this package.
- **ProbabilisticAndMetricNumberTheoryPartII** (board design, line 277) assigns Markoff–Hurwitz counting to this roadmap, which its Scope excludes. That is for that design's review.
- **Socle structure and the section bound:** no other owner was found.
- **Babai's distinguisher estimate** is already owned (R04).
- **Admissible covers** are already owned (R03).

### Sources: seeded sample (15 targets) and adversarial pass

| Target | Locator checked | Result |
|---|---|---|
| 0.4 Small prime graphs | M25 §1 (uncertified) | statement computed: sizes 4, 8, 40, 28, 208, one V-component each; X*(𝔽₃)=∅ |
| 1.3 Finite involution balance | M25 §2 (uncertified) | statement proved directly: 2Σf = Σ(f+f∘r) = #C, including with fixed points and for empty C |
| 1.4 Chen's divisibility theorem | M25 Thm 1.4 (uncertified); cross-checked EFLMT24 lines 153 and 191, C24 Thm 5.5.4 line 4631 | p∣component size for p≤109, p≠3; 3∤8 |
| 3.1 The cage | BGS16 §3.2 p. 11, lines 510–527 | maximal-point cage confirmed; parabolic clause unsupported (R08) |
| 4.4 All-prime conjecture | C24 Conj. 1.2.2 p. 307, line 261; M25 (uncertified) | confirmed; coefficient-one form agrees for p≠3, both true at 3 |
| 5.2 Maximal divisors | EFLMT24 Def. 3.1 and Thm 3.2, p. 7, lines 296–305 | confirmed |
| 5.3 Signed complement | EFLMT24 Lemma 2.2, p. 5, line 191 | confirmed; README adds the sign-stability hypothesis explicitly |
| 5.4 Effective obstruction | EFLMT24 Prop. 2.4 (pp. 5–6), Thm 3.2 (p. 7), Prop. 6.1 (pp. 28–29, line 1306) | confirmed with (81/4, 6); README's conservative (108, 24) follows from the corrected Lemma 2.1 |
| 5.5 Reducing functions | EFLMT24 Notation 3.3, Def. 3.4, Lemmas 3.7–3.8, pp. 8–10 | confirmed; Lemma 3.7 proof gap (Source issues) |
| 5.10 Antichain bounds | EFLMT24 Lemmas 3.18–3.19 (p. 17), Thm 3.21 (p. 19) | confirmed; README's [r,s] form is a valid generalization |
| 6.0 Level structures | C24 Thm 1.1.1(a) (p. 304), Thm 3.5.1 (p. 358), Thm 5.2.10 (p. 398), Prop. 5.2.20 (p. 403), Thm 5.4.3 (p. 412) | statements confirmed; page and label slips (R07) |
| 6.3 Orbit congruences | C24 Thm 5.4.4, p. 413, line 4534 | odd q confirmed; even-q correction is the README's own (Source issues) |
| 6.4 Valuation form | C24 Thm 5.5.9 (p. 417), Thm 1.2.7 (pp. 308–309) | confirmed (ord_ℓ(q³−q) = r+s, max(r−s,0)) |
| 6.6 Oriented transitivity | C24 Thm 5.5.7(a)–(b), pp. 415–416 | confirmed; narrower than source (R11) |
| 7.5 Independence | MP18 Cor. 5.11, Thm 5.12, Lemma 5.13, pp. 25–27 | confirmed (Thm 5.12 matches both Lean bounds, natural log); Cor. 5.11 proof slip at p=7 |

The author flagged no locator as unverified beyond the uncertified M25 and DM96 entries.

**Adversarial table.** Each row gives the instances tried and the values computed on each side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Surfaces, twist (l. 19–21) | 𝔽₂, 𝔽₃; (1,1,1), (1,1,2) | #M*(𝔽₃)=8, #X*(𝔽₃)=0; (3,3,3): 27=27; (3,3,6): 54=54 | holds | – |
| Fricke trace (l. 25, §6.1) | A=[[1,1],[0,1]], B=[[1,0],[1,1]]; A=B=I | (2,2,3): 4+4+9−12−2=3 = tr[A,B]; (2,2,2): 2 | holds | – |
| 𝔽₄ splitting (l. 27) | T²+aT+1 | values at 0, 1, a, a²: 1, a, 1, a (no root); companion order 5; disc a² is a square | holds | – |
| §0.1 moves | R₂(1,1,1) over 𝔽₅ | (1,1,2): 1+1+4 = 6 = 3·1·1·2 | holds | – |
| §0.2 graph, p=2 | R₀(111)=011, R₁(011)=011 | star centered at 111; Adj(011,011) false | holds | – |
| §0.3, §0.4 | p ≤ 109 | V-components 1 each; sizes 4, 8, 40, 28, 208 | holds | – |
| §1.1–1.2 weights | (0,1,2) ∈ M*(𝔽₅) | (0,3,3), sum 6≡1; R₀→(1,1,2), w₀: 0+1=1; R₁→(0,4,2), 3+3≡1 | holds | – |
| §1.4 `stable_card_dvd` | p = 2, 3, 5, …, 109 | sizes 4, 8, 40, 28, …; p∣size except 3∤8 | holds; p≠3 needed | – |
| §2.1 rotation | (3,3,3) | ρ₀ = (3,3,6), on X | holds | – |
| §2.2 slices, p=5 | a = 1, 0, 2, −2 | 6, 8, 10, 10 points; periods 6, 4, 5, 10 | holds | – |
| §2.3 counts | p = 3, 5, 7 | 0, 40, 28 = p(p±3) | holds | – |
| §2.4 `rotation_orbit_count` | every odd p<60 | formula = direct count (0, 8, 5, 26 at 3, 5, 7, 13) | holds | – |
| §3.0 character sums | f = X, X(X−1), X² over 𝔽₅ | 0 ≤ 0; \|−1\| ≤ √5; X² gives 4 (excluded) | holds | – |
| §3.0 CZ13 Cor. 2 | x+y=1, μ₄² | 3 ≤ max(9.52, 38.4) | holds | – |
| §3.0 Markoff curve χ | αX²Y+βYZ² = XY²+XZ² | div x = B+C−A−D, div y = A+C−B−D; χ=4 | holds | source χ=3 wrong |
| §3.1 cage | BGS16 §3.2 | maximal points only | clause unsupported | R08 |
| §3.5 `no_finite_orbit` | real cube | at (2,2,2), \|abc\| = 8 = (2/3)·12; forces a²+b²+c² = 0 | holds | – |
| §3.5 `orbit_log_lower_bound` | p ≤ 37 | min orbit = \|X*\| ≥ (log₂₀ p)^(1/3) (40 ≥ 0.81 at p=5) | holds | – |
| §3.6 `giant_orbit` | p = 5…37 | complement 0 | holds | – |
| §3.7 `sparse_exceptional_primes` | p ≤ 109 | 0 disconnected primes | consistent | – |
| §4.0 affine | x²+1 mod 5; (40,40,40) mod 65 | 2, 3 are residue roots with no ℤ-root; 4800 ≡ 192000 ≡ 55; zero mod 5, (1,1,1) mod 13 | holds | – |
| §4.1 root image | 49,150 tree triples | reductions cover 4/4, 8/8, 40/40, 28/28, 208/208; none ≡ 0 mod 5 | holds | – |
| §4.3 `prime_affine_lifting` | p=2, c=1; p=3, c=1,3 | (0,1,1) ← (6,3,3); X(𝔽₃) = {0}; cube lifted | holds | – |
| §5.1 local bound | bidegree (2,2), χ=4 | 3·max((32td)^(1/3), 16td/p), halved | holds | R01 |
| §5.2 `maximalDivisors` | 12 and 1 | M₆={4,6}, M₃={2,3}, M₀=∅, M₁(1)={1} | holds | – |
| §5.3 free signs | fixed sign change | x = −x, y = −y ⇒ origin | holds | – |
| §5.4 intervals | solve both cases | d ≤ 108M³; d ≥ p/(24M); (6,4) gives 81/4 and 6 | holds | – |
| §5.5 reducing maps | q^i↦3^i; D(3)→D(5) | ratio (3/q)^(a−i) ≤ 3/q; f(3) = 5 > 3 | holds | – |
| §5.7 `IsReduced` | 3, 27, 2^a·3 | 3 ✓; 27 ✗ (9 ≥ 5); a ≤ 7 ✓, a = 8 ✗ (256 ≥ 200) | holds | – |
| §5.8 `reduced_domination` | n = 2…259 | dominating reduced m in [n, 4n−6] always found; max m/n = 120/66 | holds | – |
| §5.9 rank polynomial | 12, 1, 8 | 1+2T+2T²+T³; C₀(1) = 1; C₁(8) = 1 ≠ 3 | holds | – |
| §5.10 `central_rank_bound` | n ≤ 3000 (normalized); n ≤ 600, all cutoffs | 0 failures; n=4: 1·4 ≤ 3·2 | holds | R09 |
| §5.13 constants | M ≤ 2C | 864C³; 373248C⁸; 1492992C⁸ | arithmetic holds | R02 |
| §5.14 `effective_connectivity` | N, Ω(N)=187 | C₉₃ matches; N+2 = 3.448e392 < 3.571e392 (source guard) < 1.016e394 (repaired guard) | not established | R01 |
| §6.0 Checks | H=1; SL₂(𝔽₅), t=−2; SL₂(𝔽₄) | 12∣12; 120∣960; centralizer 5, quotient 1 | holds | R03 |
| §6.1 dihedral Check | 𝔽₇: diag(2,4), [[0,6],[1,0]] | (6,0,0); 36−2 ≡ 6 | holds | – |
| §6.2 `traceOrder` | 𝔽₅, t=−2; 𝔽₄, t=0 | 10; 2 | holds | – |
| §6.3 `semisimple_orbit_congruence` | q = 3, 4, 5, 7, 8, 9, 11, 13, 16, 17, 19, 25; every t≠±2 | 136 non-dihedral orbits, 0 failures; moduli up to 17 (𝔽₁₆, nonsplit) | holds, char 2 included | – |
| §6.4 `valuation_orbit_congruence` | same; ℓ ∈ {3,5,7,11,13,17} | 0 failures | holds | – |
| §6.5 `oriented_card_dvd` | p = 2…37 | one Γ⁺-orbit of size \|X*\|; p=2: 4 | holds | – |
| §6.6 `oriented_transitivity` | p = 2, 5…37 | one orbit each | holds | R11 |
| §7.1 primitive locus | n = 65 | 40·208 = 8320; (55,55,55): 0 mod 5, (3,3,3) mod 13 | holds | – |
| §7.2 blocks | p = 5, 7 | 10, 7 blocks | holds | – |
| §7.3 MP condition | p = 7 | ord ≤ 8, 64 < 8192; p≡3 mod 4 needs p+1 ≥ 1024 | holds | – |
| §7.5 p=7 affine case | ρ⁴ on Y*(7) | fixes 4 of 7 blocks, nonidentity (order 12) | holds | – |
| §7.5 equal orders | (11, 5) | 120 = 5·24 | holds | – |
| §7.7–7.8 squarefree image | n = 65 | image 8321 of 8569 = 1 + 8320 + 248; (40,40,40) not lifted | holds | – |

## Not verifiable

- **M25** (paywalled; recorded as uncertified, settled). These could not be checked against the text:
  - the M25 locators of §§0.1–0.4, 1.1–1.4, 4.1–4.4 and 5.14;
  - the 3.489·10^392 figure attributed to Martin in the `effective_connectivity` docstring.
- **DM96** (uncertified). Theorems 1.6A, 4.3B, 4.7A, 5.3A and 5.5B were not checked; the review relied on MP18's restatements (Thms 5.9–5.12). The proof inputs of the two-transitive section bound are unknown.
- **EFLMT24** (OCR scan). The displays of Prop. 2.4, Thm 3.2 and Thm 1.4 on p. 3 are garbled. I checked the intervals through the proof text (lines 211–244) and the endpoint through line 1027.
- **Not read** (outside the sample): the CKSZ14 resultant argument (§4) and the CZ13 proofs (§§4–5).
- **Not reproduced:** MP18's computer verifications (transitivity at 770; Q_p for p = 2, 5, 7, 11).
- **Deep theorems:** BGS16, Chen and MP18 were checked only on the small instances in the table above.

## Source issues

- **Error** in EFLMT24 at Lemma 2.1, proof, pp. 4–5: the source says the curve's zero/pole set is three points and takes coordinate degrees t, d, giving χ=3; it should be four points (adding [1:α:0]), χ=4, degrees 2t, 2d, bound (3/2)·max((32td)^(1/3), 16td/p); affects a stated result.
- **Gap** in EFLMT24 at Lemma 3.7, proof, p. 9: the source says the least prime factor of a coprime product is the minimum over factors; it should treat a quotient equal to 1 separately, since λ(1)=1; affects the proof.
- **Misprint** in EFLMT24 at §4.1, p. 20: the source says the first interval of Theorem 3.14 should be empty; it should be Theorem 3.2; affects nothing.
- **Misprint** in EFLMT24 at Remark 4.1, p. 21: the source says Theorem 3.2 gives a reduced number in [B, 4B−2]; it should be Theorem 3.14; affects nothing.
- **Error** in C24 at Proposition 5.4.2(b) and Theorems 5.4.3–5.4.4, pp. 411–413: the source says in even characteristic every trace is the square case with order dividing q−1; it should split by roots of T²−tT+1, since over 𝔽₄ nonsplit order-5 elements exist; affects a stated result.
- **Error** in C24 at Theorem 5.5.8(b), pp. 416–417: the source says X and M satisfy strong approximation modulo squarefree n; it should say the image is the origin plus the primitive locus, since (40,40,40) mod 65 has no lift; affects a stated result.
- **Error** in C24 at Theorem 5.5.8, proof, p. 417: the source says M(𝔽₃) has two singleton orbits, the origin and (1,1,1); it should be the origin and one eight-point orbit, as on p. 415; affects the proof.
- **Error** in MP18 at Corollary 5.11, proof, p. 25: the source says p(p±3)/4 is never a prime power; it should exclude p=7, where it is 7 and the fixed-point argument given there is needed; affects the proof.
- **Misprint** in MP18 at Lemma 5.13, proof, p. 26: the source writes the commutator's second component with h1; it should be h2; affects nothing.
- **Misprint** in MP18 at Lemma 5.13, proof, p. 26: the source speaks of normal subgroups of Q_p; it should be Q_q; affects nothing.
- **Misprint** in MP18 at Lemma 5.13, proof, p. 26: the source concludes containment in the image under π_p; it should be π_q; affects nothing.
- **Misprint** in MP18 at footnote 14, p. 26: the source says the only equal-order case below 10^6 is p=5; it should be the pair p=11, q=5; affects nothing.
- **Misprint** in BGS16 at Proposition 12, proof, pp. 16–17: the source labels the excluded case as orders (2,2,2) with ζ=±i; it should be (4,4,4), since ±i has order 4; affects nothing.
- **Misprint** in BGS16 at equation (63), p. 16: the source pairs ζ_{l1} with ζ_{l2}⁻¹ in the first factor; it should be ζ_{l1}⁻¹; affects nothing.
- **Misprint** in BGS16 at §1, p. 1: the source says R2, R3 are defined similarly after defining R3; it should be R1, R2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4ba5ef1", "job": "REV-PKG-ArithmeticDynamicsPartII", "model": "opus", "worker": "fable-rev44"} -->
