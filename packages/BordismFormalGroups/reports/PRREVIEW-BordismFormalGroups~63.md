# Review of BordismFormalGroups (pull request #1807 at 8f64f53)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/BordismFormalGroups/README.md` (3641 lines) and `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` (127 lines) at `8f64f53`. Since `7fa7fe9` the README changed by 316 lines. `Suggested.lean` is unchanged.

- **Gate.** The worker's gate passes every check, the targeted build included. My rerun differs only in `outside-folder=26`, which counts the README and `Suggested.lean` of the 13 sibling folders that the brief names as this pull request's own. That is not a finding. `git diff --stat origin/main...HEAD` shows no change outside the 14 folders.
- **Dependency check.** It prints `depcheck: 230 roadmaps, 2160 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Lean.** `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 71, 86, 112) and nothing else.
- **Findings.**
  - R01 (P2, blocking): the new p-typical theory in F1.5 drops commutativity, and the README's own carrier admits a counterexample.
  - R02 (P3): three passages still describe the old layer structure.
  - R03 (P3): three sampled sections have no locator at their theorem.

## Previous findings (review of 7fa7fe9)

| Id | Status | Evidence at 8f64f53 |
|---|---|---|
| R01, G2.4 cited for localization, splitting and telescopes | repaired | F3.1 (lines 1109–1116) now states idempotent splitting as a target, citing Bökstedt–Neeman Proposition 3.2 and Remark 3.3, pp. 221–222 (`bokstedt-neeman` lines 362–378, read). Its *Needs:* (1135–1139) names G3.9, G2.4 and G3.4. At this head G3.4 (line 2390) builds "the actual cofiber of 1−shift on the wedge" for spectra, and G3.9 (2681) builds `spectrumPrimeLocalization`. F3.3 (1237–1240), the F3 Dependencies (1269–1273), F6.2 (2196–2198) and F6.3 (2446–2451, 2784–2787) are repointed. |
| R02, F1.5 needs F3 | repaired | The algebraic p-typical theory is now in F1.5 (lines 528–591). F3.2's *Needs:* (1181–1184) names only F1.5, Mathlib and the pinned height. The F1 Dependencies (664–667) say no section of F1 uses a later layer, and the *Needs:* lines confirm it. Three stale sentences remain (R02 below). |
| R03, F6.2 credits F2.2 with homology operations | repaired | Lines 2201–2204: "F2.2's mod-p Steenrod operations and dual Steenrod algebra; the mod-p homology operations of Ω²S^(2m+1) and of the extended powers D_(2,j) … are constructed here". |
| R04, sampled sections without locators | repaired | Locators have been added and I checked each one at the text: F3.1 (Theorems 4.1.12, 4.1.18, 4.1.19; Lemmas 4.1.13, 4.1.15), F3.3 (§4.2, pp. 116–118; §1.5, p. 33; §3.1, p. 66), F4.4 (Theorem 4.4.1, p. 132), F5.2 ((B.5.19), p. 182; Theorem 3.3.7, p. 33), F2.1 (Definition 4.1.1, Lemma 4.1.4, Lemma 4.1.13), F4.6 (Hovey, Theorem 1.2, Corollary 1.6, Theorem 1.7), F6.1 (*Nilpotence and Periodicity*, Theorem 7.1.3, p. 76) and F6.3 (Theorems 3.4.3, p. 37, and 1.5.4, p. 9). |
| R05, References | repaired | References (lines 3612–3615) list Landweber 1976, Carrick–Davies–van Nigtevecht and Bauer. F5.4 (line 1752) cites Landweber 1976, Theorem 2.6, together with *Nilpotence and Periodicity*, Theorem B.6.2. |

## R01 (P2) — F1.5's p-typical theory drops commutativity, so Cartier's theorem and the universal property contradict each other in the README's carrier

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md`, lines 530–550:
- "a formal group law over a torsion-free ℤ_(p)-algebra is p-typical when …";
- line 540, "Cartier's theorem: every formal group law over a ℤ_(p)-algebra is strictly isomorphic … to a p-typical one";
- line 546, "p-typical laws over a commutative ℤ_(p)-algebra R correspond bijectively to ring maps V→R".

**Claim.**
- The Conventions (lines 130–131 and 157–158) make the carrier Mathlib's `FormalGroup R`, which "carries no commutativity: IsComm is a separate class". Ravenel's formal group laws are commutative by definition.
- Read in this carrier, the Cartier bullet and the universality bullet cannot both hold. Every law classified by a map V→R is commutative, and a strict isomorphism preserves commutativity.

**Witness.**
- Over 𝔽_p[ε]/(ε²), F(X,Y)=X+Y+εXY^p is associative: both bracketings give X+Y+Z+ε(XY^p+XZ^p+YZ^p).
- It is not commutative: F(X,Y)−F(Y,X)=ε(XY^p−YX^p).
- Ravenel's definition includes commutativity: `ravenel-green` line 19850, Definition A2.1.1(ii).

**Repair.**
- Write "commutative formal group law" in both definitions of p-typicality, in Cartier's theorem, in the universal property ("commutative p-typical laws over R ↔ ring maps V→R") and in the strict-isomorphism bullet. Add one clause noting that Ravenel's laws are commutative (Definition A2.1.1).
- Add a Check: X+Y+εXY^p over 𝔽_p[ε]/(ε²) is a `FormalGroup` that is not `IsComm`. Cartier's theorem therefore does not apply to it, and no ring map V→𝔽_p[ε]/(ε²) classifies it.
- Tested on the instance: with commutativity in place, the two bullets are Ravenel's Theorem A2.1.18 and Theorem A2.1.25 as stated (`ravenel-green` lines 20167 and 20299), and the witness is excluded by hypothesis.

## R02 (P3) — Three passages still say F1 is pinned Tau Ceti apart from the classification, or that only F3.2 uses F1.5's p-typical theory

**Location.**
- `TauCetiRoadmap/BordismFormalGroups/README.md` lines 303–307: "Everything in this layer except the height classification at its end is a theorem of the pinned Tau Ceti".
- `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 26–31 (module docstring): "The rest of F1 (…) consists of theorems of the pinned Tau Ceti".
- README line 1269: "F1 (with F1.5's p-typical theory, on which F3.2 alone depends)".

**Claim.** F1.5 now builds a theory that the pin does not contain, and F3.1 consumes that theory as well as F3.2.

**Witness.**
- README line 528: "Build the algebraic theory of p-typical laws, which the pinned Tau Ceti formal-group tree does not contain."
- F3.1's *Needs:* (lines 1135–1136) names "F1.5's p-typical theory".
- A grep of the pinned `TauCeti/RingTheory/FormalGroup` for p-typical declarations finds none. The only "Cartier" hits are the Cartier operator in `Frobenius/Basic.lean`.

**Repair.**
- Line 303: "Everything in this layer except F1.5's algebraic theory of p-typical laws and the height classification is a theorem of the pinned Tau Ceti; the classification is the layer's only headline."
- Docstring: "The rest of F1, except F1.5's algebraic theory of p-typical laws (a README target, not a headline), consists of …".
- Line 1269: "F1 (F1.5's p-typical theory, used by F3.1 and F3.2; F3.2 needs nothing from F2)".

## R03 (P3) — Three sampled sections state theorems with no locator at the claim

**Location and claim.**
- **F4.3** (lines 1381–1398). Two results have no citation: the criterion that dualizable comodules are those with finitely generated projective underlying module, and the identification E₂^(s,t)=Ext_(BP_*BP)^(s,t)(BP_*,BP_*X). The only locator in the section is in a Check (line 1401).
- **F6.5** (lines 3110–3114). "Prove the Greenlees–Sadofsky/Kuhn theorem" carries no theorem number. The References (lines 3632 and 3636) give none for Greenlees–Sadofsky or for Kuhn, and only "§2" for Clausen–Mathew.
- **F6.7** (lines 3530–3562), and F6.6 outside the sample. Neither section cites any source.

**Witness.**
- `clausen-mathew` lines 21–25: Theorem 1.1, p. 1, is exactly F6.5's statement. G is finite, X is in Fun(BG, L_K(n)Sp), and the K(n)-local norm is an equivalence; the paper credits it to Greenlees–Sadofsky and Hovey–Sadofsky.
- `kuhn-tate` lines 151–152: Theorem 1.5, p. 4, is the telescopic form.
- `ravenel-green` line 7556: Theorem 4.4.1(i), p. 132, states F4.3's E₂-term.

**Repair.**
- F4.3:
  - Add "(Ravenel, Theorem 4.4.1(i), p. 132; Theorem 2.2.3, p. 50, for an E-Adams resolution)" at the E₂ statement.
  - Cite a source for the dualizability criterion. Hovey, *Homotopy theory of comodules over a Hopf algebroid* (2004), §1.3, is a candidate; I did not read it, so check its number.
- F6.5: add "(Clausen–Mathew, Theorem 1.1, p. 1; Kuhn, Theorem 1.5, p. 4, for the telescopic form)" at the claim, and put the same numbers in the References.
- F6.6–F6.7: if the Euler cancellation and the extension nullhomotopy are this roadmap's own arguments, say so at the claim. For F6.7, say that it follows formally from F6.6's injectivity and G5.7's extension classification, as its first Check shows. Otherwise cite the source of the Euler-class regularity.

## Verified sound

**Headline theorems.**
- From the Summary and Scope, stated in `Suggested.lean`:
  - Lazard's height classification (F1.5);
  - the classification of the homogeneous invariant primes of L (F5.3);
  - the Lubin–Tate universal deformation (F5.5), with the one definition `IsStarIso`, which has a real body.
- Named in the docstring as not statable, each with its missing carrier: Quillen's theorem and π_*MO; Bousfield localization; the Conner–Floyd and graded Eilenberg–MacLane comparisons; the exact functor theorem; nilpotence; thick subcategories and periodicity; smashing, fracture and the K(n)-local completion; Tate vanishing; F6.6; F6.7.
- The README calls the classification F1's only headline (line 307), so F1.5's Cartier theorem is a target, not a headline.

**Lean form.**
- The file has `module`, `public import Mathlib` and four existing `TauCeti.*` modules. There is no `set_option`, no sorry'd data, no `variable` block, and only `theorem`.
- I ran `#check @name` on all four declarations in one scratch file. Each elaborated type matches its README statement binder for binder (lines 593–601, 1688–1700, 1799–1802, 1839–1849), and no section binder is lost.
- One-tactic probe on scratch copies:
  - `simp`: "made no progress" on the first two theorems, unsolved goals on the third;
  - `rfl`: fails three times;
  - `exact?`: "could not close the goal" three times.
- None of the three theorems is padding.

**Pinned declarations opened (40).**
- Mathlib `RingTheory/FormalGroup/Basic.lean`:
  - `FormalGroup` (57): its fields are the power series, zero constant term, the two linear coefficients and associativity, with no commutativity and no inverse;
  - `FormalGroup.IsComm` (75).
- Tau Ceti `RingTheory/FormalGroup/`:
  - `LazardRing/Basic.lean`: `relations` 194, `formalGroup` 253, `lift` 311, `lift_map` 346, `grading` 390, `gradedLift` 463.
  - `LazardRing/Polynomial.lean`: `mvPolynomialEquiv` 112.
  - `LazardRing/Indecomposable.lean`: `generator` 190, `generator_mem_grading` 195, `cotangentBasis` 398.
  - `LazardRing/Independence.lean`: `algebraicIndependent_generator`.
  - `SymmetricCocycle/Basic.lean`: `lazardGcd_eq_one_of_not_isPrimePow` 197, `lazardGcd_prime_pow` 206, `lazardCocycle`, `map_lazardCocycle`, `aeval_diag_lazardCocycle`.
  - `SymmetricCocycle/Classification.lean`: `existsUnique_eq_smul_lazardCocycle`.
  - `CoordinateChange/Lazard.lean`: `coordinateChangeLift` 77, `rightUnit` 130, `counit` 163.
  - `CoordinateChange/HopfAlgebroid.lean`: `coproduct` 171, `coproduct_coassoc` 260, `conjugation` 293, `conjugation_conjugation` 339, `counit_conjugation` 353, `map_rightUnit_heightIdeal` 390, the four `tensorLift_*` laws and `conjugation_comp_rightUnit`.
  - `CoordinateChange/Grading.lean`: `coordinateGrading` 57, `coordinateTensorGrading` 230.
  - `Height/Ideal.lean`: `heightIdeal_zero` 104, `heightIdeal_smul` 138, `heightIdeal_one` 190, `heightIdeal_eq_span` 195, `heightIdeal_eq_bot_iff_le_height` 218.
  - `Logarithm/Basic.lean`: `invariantDifferential` 178 (`invOfUnit F.derivZeroX 1`), `subst_invariantDifferential_mul_pderiv_one` 256, `invariantDifferential_𝔾ₘ` 287 (`mk ((-1)^n)`), `coeff_log` 338, `subst_toPowerSeries_eq_add_iff` 404.
  - `Logarithm/Naturality.lean`: `coeffOneEquiv` 117, `log_smul` 149 (`linearCoeff φ • subst φ⁻¹ log`).
  - `Logarithm/InfiniteHeight.lean`: `existsUnique_logarithm_of_nsmulSeries_eq_zero` 249.
- Tau Ceti `RingTheory/PowerSeries/Coordinate/Universal.lean`: `universalStrictCoordinate`.
- All 230 backticked names in the README resolve at the pins. The exceptions are 28 module names, which exist as files, and the four declarations of `Suggested.lean`.
- Neither pin has idempotent splitting for triangulated categories: a grep for `IsIdempotentComplete` alongside `Pretriangulated` finds nothing. F3.1 is therefore the right owner.

**Cross-roadmap citations resolved (28).**
- GeneralizedCohomology at this head: G2.3 (831), G2.4 (864), G2.5 (922), G2.6 (1077), G2.7 (1109), G2.8 (1156), G2.9 (1222), G2.11 (1341), G3.1 (2254), G3.3 (2350), G3.4 (2390), G3.8 (2561), G3.9 (2681), G4.3 (3156), G4.5 (3222), G5.1 (3627), G5.3 (3699), G5.4 (3752), G5.5 (3907), G5.7 (4552).
- AlgebraicTopology at this head: Stage 5 item 5 (1456, Serre fibrations); Stage 8 items 3 (2563), 7 (2760), 8 (2784), 10 (3072).
- TopologicalKTheory T2 item 5 (952), with ψᵏ(β_n)=kⁿβ_n (998).
- CharacteristicClasses C3 (1568), with `H*(BO(n);F2)=F2[w₁,…,w_n]` (1757).
- ArithmeticKTheory (#1418), lines 547–556, cites F3 for BP on Hazewinkel generators with their logarithm recursion and BP_*BP. F3.1 still supplies these (lines 1129–1134).

**Overlap and ownership.**
- The dropped anchor `#f65-local-group-actions-and-completion-comparisons` is cited only by GeneralizedCohomology on main, line 46, through a link pinned to commit `d525554`. Lines 96–126 map the former sub-headings to G2.11. No change is needed.
- #1808 and #1854 change this folder. The description's shared-folder block orders them "this pull request → #1808 → #1854".
- `roadmaps grep` for Cartier's theorem, p-typical laws, Hazewinkel, Araki, Bökstedt and idempotent splitting found no second owner. The Cartier hits elsewhere concern smoothness of group schemes or Cartier modules.

**Sources read at the text, with their locators checked.**
- `ravenel-green`:
  - Definition A2.1.17 (20159); Theorem A2.1.18, p. 358 (20167); Proposition A2.1.20 and (A2.1.21), p. 358 (20183–20203); Definition A2.1.22, p. 359 (20229); (A2.1.24) (20294);
  - Theorem A2.1.25, p. 360 (20299); Lemma A2.1.26 (20326); Theorem A2.1.27, p. 361 (20395); (A2.2.1) and (A2.2.2), p. 363; Theorem A2.2.3 and (A2.2.4), p. 364 (20556–20571); Theorem A2.2.6, p. 365 (20682);
  - Definition 4.1.1, p. 106 (6005); Lemma 4.1.4, p. 107 (6027), which cites Adams Part III §7 for the Atiyah–Hirzebruch spectral sequence; Theorem 4.1.12, p. 110 (6245); Lemmas 4.1.13, p. 111, and 4.1.15, p. 112; Theorems 4.1.18 and 4.1.19, p. 113;
  - §4.2, pp. 116–119 (6526–6745); §1.5, p. 33 (2198); §3.1, p. 66 (3914);
  - Theorem 1.3.16, p. 17 (1338); Theorem 4.3.2 with its proof, pp. 120–121 (6801–6832); Theorem 4.4.1, p. 132 (7556); Theorem 2.2.3, p. 50 (3146).
- Spot checks repeated from the last review: Theorem 3.1.1 (3673), Lemmas 3.1.3–3.1.8 and Corollary 3.1.10 (3718–3816).
- `ravenel-orange`: Theorem 1.5.4, p. 9 (577); Theorem 3.3.7, p. 33 (1470); Theorem 3.4.3, p. 37 (1597); Theorem 7.1.3, p. 76 (2876); (B.5.19), p. 182 (6926); Theorem B.6.2, p. 183 (6968; see Source issues).
- `hovey-mstring`: Theorem 1.2 (123); Corollary 1.6 (307); Theorem 1.7 (336); line 118, which cites Wilson II, Corollary 5.1, for m<2p+2.
- `bokstedt-neeman`: Proposition 3.2, p. 221 (362), for triangulated categories with direct sums; Remark 3.3, pp. 221–222 (370–378).
- `quillen-fgl-bulletin`: Theorem 3 (110); Theorem 4 (143); the canonical ring isomorphism for unoriented cobordism (155–160).
- `hatcher-at`: Theorems 4L.12, 4L.13 and 4L.16 (21777, 21864, 22197); Theorem 4J.1 (20284); Proposition 3C.8 (12578).
- `miller-cobordism`: Proposition 10.4 (1023); Theorem 11.2 (1142); Theorems 12.1–12.4 (1226–1261).
- `cdvn-toda`: Definitions 3.3 and 3.7 (1190, 1244); Lemma 3.9 (1261); Propositions 3.14 and 3.15 (1397, 1403); Theorem 3.16 (1476), whose case analysis matches F4.5 item 2 as written.
- `clausen-mathew`: Theorem 1.1 (21); Proposition 2.3 (75); Corollary 2.7 (127).
- `kuhn-tate`: Theorem 1.5 (151).

**Adversarial pass.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1. `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ, 𝔾ₘ over 𝔽̄_p | heights ⊤ and 1 (`height_𝔾ₐ`, `height_𝔾ₘ`) | both sides false | — |
| 2. same, without `IsSepClosed` | 𝔾ₘ and a Galois twist over 𝔽_p | heights 1=1; Frobenius X^p is p versus pu, u≠1 in ℤ_p^× | right side true, left side false, so the hypothesis is needed (it is present) | — |
| 3. `isPrime_and_invariant_iff_eq_heightIdeal` | I=⊥; I=(4) | `heightIdeal p 0`=⊥ (Height/Ideal.lean:104), and L is a domain; (4) is invariant (η_R(4)=4) but 2·2∈I with 2∉I | true/true; false/false | — |
| 4. same | (a₁₁) | XY coefficient of φ•F: φ⁻¹=X−b₁X²+…, giving a₁₁+2b₁; 2b₁∉(a₁₁)L[b] | not invariant and not listed | — |
| 5. same, without homogeneity | (2,a₁₁−1) | L/(2,a₁₁−1)≅𝔽₂[x₂,…]; η_R(a₁₁−1)=a₁₁−1+2b₁ | an invariant prime outside the list, so `hI` is needed | — |
| 6. `IsStarIso` | [1+p] on 𝔾ₘ over ℤ_p | reduces to x+x^p+x^(p+1)≠x | an isomorphism that is not ⋆ | — |
| 7. `lubinTate_universal_deformation` | h=1, R=W(k), G=X+Y+uXY with u≡1 (p) | `Fin 0`, so θ is the structure map; G(u⁻¹x,u⁻¹y)=u⁻¹(x+y+xy) | the ⋆-isomorphism x↦u⁻¹x is unique | — |
| 8. same | F₀=𝔾ₐ over 𝔽_p[ε] | X+Y+εC_(p^j): d_(p^j)=p=0 gives infinitely many classes, against p^(h−1) maps | `hF₀` (finite height) needed and present | — |
| 9. same | A=k; h−1 | 𝔪=0 forces θ(t_i)=0; `one_le_height` gives h≥1, so no junk subtraction | holds | — |
| 10. F1.5 Cartier and universality | X+Y+εXY^p over 𝔽_p[ε]/(ε²) | both bracketings give X+Y+Z+ε(XY^p+XZ^p+YZ^p); the commutator is ε(XY^p−YX^p)≠0 | a noncommutative law, which the two bullets cannot both treat | R01 |
| 11. F1.5 Check, p-typicalization of 𝔾ₘ | p=3, p=2 | log Σ(−1)^(p^i+1)x^(p^i)/p^i: ℓ₁=1/3 and v₁=1; ℓ₁=−1/2 and v₁=−1 | units, as height 1 requires | — |
| 12. F1.5 generators | n=1 | Hazewinkel ℓ₁=v₁/p, Araki ℓ₁=v₁/(p−p^p); ratio 1−p^(p−1): −1 at p=2, −8≡1 (mod 3) at p=3 | matches (A2.2.1), (A2.2.2) and A2.2.3 | — |
| 13. F1.5 Araki right unit | x^p coefficient of A2.2.6 | left side η_R(v₁)+p^p t₁, right side v₁+pt₁, so η_R(v₁)=v₁+(p−p^p)t₁ | agrees with η_R(ℓ₁)=ℓ₁+t₁ (A2.1.27(iv)) | — |
| 14. F1.5 additive law | both recursions | pℓ_n=0 forces v_n=0 | classified by v_i↦0 | — |
| 15. F3.1 idempotent splitting | S[1/2]∨S[1/2], e=(1+τ)/2 | e·π₀ is the diagonal ℤ[1/2]; cofib(e)=(1−e)X∨Σ(1−e)X; the tower [ΣX,X] along −∘e has constant images, so lim¹=0, and j_i∘(1−e)=j_(i+1)∘e∘(1−e)=0 | the splitting maps are unique and compose to the identity | — |
| 16. F3.1 generators at p=2 | m₁ | log∘F has XY coefficient a₁₁+2m₁=0; Hazewinkel v₁=2ℓ₁=−a₁₁, Araki v₁=(2−4)ℓ₁=a₁₁ | "±x₁" is correct, and both agree with F5.3 mod 2 | — |
| 17. F1.2 cocycle | n=3, 4, 6 | d₃=3, C₃=X²Y+XY²; d₄=2, C₄=2X³Y+3X²Y²+2XY³; d₆=1 since gcd(6,15,20)=1 | matches `lazardGcd_prime_pow` and `…_not_isPrimePow` | — |
| 18. F1.3 𝔾ₘ | P, coeff_log | P=mk((−1)^n)=(1+T)⁻¹; coefficient (−1)^(n−1)/n gives log(1+T); with 1+T instead, (1+F)(1+Y)≠1+X | inverse convention pinned | — |
| 19. F2.2 | Poincaré series; d₂ | (1+t^d)/(1−t^(2d))=1/(1−t^d) for d=2^i−1; (1,2)↦(3,3), stem 1→0 | holds | — |
| 20. F2.3 Hurewicz | i=1,…,6 | 2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆ | matches 3.1.5(ii) | — |
| 21. F2.4 degree 5 | H_*, A_*, P | 7; A ranks 1,1,1,2,2,2; P ranks 1,0,1,0,2,1; sum 1+2+0+2+0+2=7 | holds | — |
| 22. F3.3 ko_(p) | p=5, p=3 | Σ⁰ and Σ⁴ of BP⟨1⟩: degrees 0,8,16,… and 4,12,…, one ℤ_(5) in each 4k; at p=3 one summand | holds | — |
| 23. F3.3 E(0) | v₀⁻¹BP versus Hℚ | at p=2, π₂(p⁻¹BP)=ℚv₁≠0, while π₂Hℚ=0 | the Check's distinction holds | — |
| 24. F4.3 | α₁, p=3 | [t₁]∈Ext^(1,4), stem 3; π₃S_(3)=ℤ/3 | holds; locator missing | R03 |
| 25. F4.5 | ⟨h₀,h₁,h₀⟩ | reduced Δ(ξ₁ξ₂)=[ξ₁³\|ξ₁]+[ξ₁\|ξ₂]+[ξ₂\|ξ₁]+[ξ₁²\|ξ₁²], so the value is h₁²+d[ξ₁ξ₂]; Ext^(1,3)=0 | =h₁² with zero indeterminacy | — |
| 26. F4.5 | ⟨h₁,h₀,h₁⟩ | C(5,k) is odd for k=0,1,4,5; value − h₀h₂ = d[ξ₁²ξ₂]+d[ξ₁⁵] | =h₀h₂≠0 | — |
| 27. F4.6 | BP⟨1⟩₂; K(ℤ_(2),3) | π_i=π_(i−2)BP⟨1⟩, so degrees 2+j(2p−2); ι₃² has order 2 and Sq³ι₃=ι₃²≠0, so H₅=ℤ/2 | holds; Hovey 1.2 generators lie in degrees ≡ m (mod q) | — |
| 28. F5.2 | (p,v₁²); (p²) | η_R(v₁²)≡v₁² (p); factors Σ^(2p−2)A/I₂, A/I₂; A/I₁ twice | holds | — |
| 29. F5.2 | A/I_∞ | colim A/I_n=𝔽_p; the union of its finitely presented subcomodules is 0 | the colimit form is needed | — |
| 30. F5.4, source form | M=K(1)_* | B.6.2 as printed (positive n): v₁ is injective on M/p=M, and M/I_n=0 for n≥2, but p=0 on M | the source admits it; the README demands p injective | Source issue |
| 31. F6.1 | L_S; L_(Hℚ)(S/p) | the identity; 0 although S/p≠0 | L_E is not conservative | — |
| 32. F6.2 James | J₂(S²); Y=S⁰ | J₂/J₁=S⁴ and H₂=ℤ; J(S⁰)=ℕ while π₀ΩS¹=ℤ | path-connectedness is needed | — |
| 33. F6.5 | G=1; K(n), C_p; Hℤ | E^(t1)=0; [p](x)=v_n x^(p^n), so x^(p^n)=0; Ĥ^(2k)(C_p;ℤ)=ℤ/p, while K(n)∧Hℤ=0 | consistent; locator missing | R03 |
| 34. F6.7 | skeleton; r=0; empty family | δ∘⊕eν∼δqj∼0, then injectivity gives [δ]=0; eν=1 gives δ∼0 directly; Q=0 gives A≃B | holds; no source | R03 |
| 35. F1 intro versus F1.5 | line 303 against line 528 | "everything … pinned" against "the pin does not contain" | contradictory | R02 |

## Not verifiable

- **Settled as uncertified, cited by locator only, not read:**
  - Landweber 1976 (the filtration theorem, and Theorem 2.6 for exactness);
  - Adams, *Lectures on generalised cohomology*, Lecture 4;
  - Adams, *Stable Homotopy and Generalised Homology*, Part III §7 (consistent with Ravenel's own citation, `ravenel-green` line 6040);
  - Wilson, Part II, Corollary 5.1 (consistent with Hovey's citation, `hovey-mstring` line 118);
  - Bousfield 1979, §1 and Theorem 6.6;
  - Hopkins–Smith, Theorems 3, 7 and 9;
  - Devinatz–Hopkins–Smith;
  - Quillen 1971; Thom 1954; Toda 1962; James 1955;
  - Johnson–Wilson and Würgler;
  - Symonds;
  - Hovey–Strickland, Proposition 7.10(e);
  - Greenlees–Sadofsky;
  - Landweber–Ravenel–Stong.
- **Not read:** Hovey's comodule paper, offered in R03 only as a candidate; Lurie's HTT and HA, which F6.5 consumes through G2.11.
- **Ownership against open pull requests** was checked with `roadmaps grep` on the objects named above, not exhaustively over all 442 heads.

## Source issues

- **Misprint** in ravenel-orange at Theorem B.6.2, p. 183: the source requires v_n to act injectively on M/I_n only for positive n; it should include n=0, p injective on M, as its own derivation and its remark that K(n)_* fails require; affects a stated result.
- **Misprint** in ravenel-orange at §B.6, p. 183, before Theorem B.6.2: the inductive step uses v_n on BP_*/I_(n−1) and concludes v_n-torsion-freeness; it should use v_(n−1), the generator added to I_(n−1); affects nothing.
- **Misprint** in bokstedt-neeman at Proposition 3.4, p. 222: the proof refers to the proof of Lemma 3.2; it should say Proposition 3.2; affects nothing.
- **Misprint** in ravenel-green at Theorem 1.3.16(iv), p. 17: the source lists the invariant primes of L as I_n for 0<n≤∞; it should be 0≤n≤∞, the zero ideal being invariant and prime; affects nothing.
- **Gap** in ravenel-green at Theorems 1.3.16(iv), p. 17, and 4.3.2(iv), p. 121: the source says the I_n are the only invariant primes; it should restrict to homogeneous ideals, since (p,v₁−1) is invariant and prime and the proof takes a lowest-degree element; affects a stated result.
