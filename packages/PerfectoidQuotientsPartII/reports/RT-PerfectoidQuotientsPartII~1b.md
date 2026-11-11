<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12942#issuecomment-6792881679 -->
Red team round 1 pass b (claude) of dddd8d6

Verdict: needs_changes

1. **F01** (P2) Q9.2 cites a supplier target that is stated only for `p`-torsion-free rings

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1255–1256`: "also `P − Q ∈ ϖ^{1/p^t}Â_0` by
   the iterated Frobenius bijections (`perfectoid_compatible_roots_iterated_frobenius`)."

   **Claim:** PerfectoidQuotients §0.4 supplies the bijections `Â_0/ϖ^{1/p^{n+1}} → Â_0/ϖ^{1/pⁿ}` used
   to pass from `(P − Q)^{p^t} ∈ ϖÂ_0` to `P − Q ∈ ϖ^{1/p^t}Â_0`.

   **Witness:** PerfectoidQuotients §0.4 (open head, README lines 813–822) states that target "for
   `p`-torsion-free integral perfectoid `R`" with `(π^p) = (p)`. In Q9.2, `A` = the `t`-adic completion
   of `𝔽_p[t^{1/p^∞}]`, `ϖ = t` satisfies every hypothesis and has `p = 0`. The name is also absent
   from the supplier contract list (README lines 250–254).

   **Repair:** replace the parenthesis by: "by iterating the bijection `x ↦ x^p : Â_0/π → Â_0/π^p` of
   PerfectoidSpaces P1.24 at `π = ϖ^{1/p^j}`, `1 ≤ j ≤ t` (`π^p = ϖ^{1/p^{j−1}}` divides `p`, and no
   torsion-freeness is assumed; Česnavičius–Scholze (2.1.2.4), p. 11)". P1.24 is already in the
   `*Needs:*` line of Q9.2. Tested on the witness: P1.24 asks only `π^p | p` and `π`-adic completeness,
   both true with `p = 0`.

2. **F02** (P3) "Downstream consumers" names a roadmap earlier in the merge order that does not use this one

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1763–1765`: "ArcTopologyAndDescent uses
   the valuation-ring results of Q6.4 and Q6.7 for tilting complete arc covers of arbitrary rank".

   **Claim:** ArcTopologyAndDescent consumes Q6.4 and Q6.7.

   **Witness:** `merge-order/ORDER.txt` line 109 is ArcTopologyAndDescent, line 220 this roadmap. At its
   open head, ArcTopologyAndDescent §12.6 (Česnavičius–Scholze Lemma 2.2.2) needs PerfectoidSpaces
   P1.15, P1.27, P2.2 and PerfectoidQuotients §§0.4–0.6; `roadmaps grep PerfectoidQuotientsPartII`
   finds no citation there.

   **Repair:** replace the bullet by: "Česnavičius–Scholze §2.2 (algebraic tilting of étale cohomology,
   Lemma 2.2.2) belongs to ArcTopologyAndDescent §12.6, which is earlier in the build and does not use
   this roadmap." (Citing roadmaps found: PerfectoidQuotients, PurityForFlatCohomology,
   EtaleDualityAndPerverseSheavesPartII.)

3. **F03** (P3) Q10.6 Check: non-Cohen–Macaulay `S` already occur over two-dimensional `R`

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1714–1716`: "the statement has content
   for non-Cohen–Macaulay `S`, which occur once `dim R ≥ 3`."

   **Claim:** for `dim R = 2` the source `Tor` always vanishes.

   **Witness:** `S` is any finite subalgebra, not a normal one. `R = ℤ_p⟦x⟧`, `S = R ⊕ (p, x)·√x ⊂ R[√x]`
   (a subring, since `(p, x)²·x ⊂ R`), `c = px`: `S ≅ R ⊕ 𝔪`, so
   `Tor_1^{R/pⁿ}(S/pⁿ, k) = Tor_1^R(𝔪, k) = Tor_2^R(k, k) = k ≠ 0`.

   **Repair:** replace the Check's second half by: "so the source vanishes for normal `S`. For
   non-normal `S` it need not: for `R = ℤ_p⟦x⟧` and `S = R ⊕ (p, x)√x ⊂ R[√x]`, with `c = px`,
   `Tor_1^{R/pⁿ}(S/pⁿ, k) = Tor_2^R(k, k) = k`. Normal non-Cohen–Macaulay `S` occur once `dim R ≥ 3`."

4. **F04** (P3) Q5.4 Check uses an element for which the ring is not `ϖ`-adically complete

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:502–503`: "for `ϖ = (p^{1/p}, 1)` both
   sides are 0."

   **Claim:** the instance tests Q5.4 (2), whose hypothesis is "`A` `ϖ`-adically complete".

   **Witness:** for `A = 𝒪_C × 𝔽̄_p` and `ϖ = (p^{1/p}, 1)`, `⋂ ϖⁿA = 0 × 𝔽̄_p ≠ 0`: `A` is not
   `ϖ`-adically separated, so (2) does not apply and the instance tests nothing.

   **Repair:** replace the clause by: "for the root `ϖ = (p^{1/p²}, 0)` both sides are again `0 × 𝔽̄_p`
   (the torsion does not depend on the root chosen); `ϖ = (p^{1/p}, 1)` is excluded, since `A` is not
   `ϖ`-adically separated in the second factor." Computed: `A[(p^{1/p²}, 0)] = 0 × 𝔽̄_p`, and
   `(p^{1/p²}, 0)^p = (p^{1/p}, 0)` divides `p`.

5. **F05** (P3) Q7.6 at `n = 0`: "relative dimension `n − 1`" and the cited presentation do not exist

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:994–998`: "`A[x]/(g)` is standard
   syntomic of relative dimension `n − 1` … The case `n = 0` is allowed".

   **Claim:** at `n = 0` the presentation with `0` generators and the relation `g` gives the conclusion.

   **Witness:** `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension m` asks for `m + c` generators
   and `c` relations (`Nat.card ι = n + Nat.card σ`,
   `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:94–95`); `0 = m + 1` has no solution in `ℕ`, and
   `n − 1` is not a natural number.

   **Repair:** state the target for `n ≥ 1`, and replace the last two sentences of the statement by:
   "For `n = 0`, `g ∈ A` is a unit in every residue field, hence a unit, and `A/(g) = 0` is standard
   syntomic of every relative dimension `m` (presentation `A[x_1, …, x_{m+1}]/(1)`, no nontrivial
   fibre)." Checked: `m + 1` generators, one relation, flat, no nonempty fibre.

6. **F06** (P3) Page locators that do not match the cached texts

   **Location and witness:**

   - `README.md:541` "proof, second paragraph, pp. 12–13": the proof of Proposition 2.1.4 ends at CS24
     line 486, and page 13 starts at CS24 line 488. Repair: "p. 12".
   - `README.md:1526` and `README.md:1562` "Remark 10.13, p. 84" (perfectoidness of the completion of
     `R⁺`; the cover inside it): both sentences are at BS22 lines 3215 and 3221–3222, on page 83 (page
     84 starts at BS22 line 3224 and holds only the closing sentence). Repair: "p. 83".
   - `README.md:1774` "Theorem 7.4 and its proof, pp. 61–62": the theorem is stated at BS22 line 2175
     (page 56); its proof starts at BS22 line 2431 (page 62). Repair: "Theorem 7.4, p. 56, and its
     proof, p. 62".

7. **F07** (P3) Q10.2: Bhatt's Proposition 5.2 is cited for more than it states

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1483` "Bhatt Proposition 5.2, p. 8";
   `Suggested.lean:31` "in the generality of Bhatt's Proposition 5.2"; `Suggested.lean:264`.

   **Claim:** Proposition 5.2 gives a faithfully flat perfectoid cover of every regular local ring with
   `p ∈ 𝔪`.

   **Witness:** Bha18 lines 469–475: the ring is `p`-torsion-free, the map is almost faithfully flat,
   and faithful flatness is stated for the unramified case; the general case is modification (a) of the
   following paragraph (Bha18 lines 475–479). The Lean statement also covers equal characteristic `p`.

   **Repair:** README: "(Bhatt–Scholze Remark 3.11, pp. 32–33, for complete `R` of mixed
   characteristic; Bhatt Proposition 5.2 with modification (a) of the paragraph after its statement,
   p. 8, for `p`-torsion-free `R`; in equal characteristic `p` the cover is the perfection, by Kunz's
   theorem)". `Suggested.lean:31`: "(Bhatt–Scholze Remark 3.11 and Bhatt, Proposition 5.2, in mixed
   characteristic; the perfection in equal characteristic `p`)"; the same wording at line 264.

8. **F08** (P3) Docstring refers to an item "Q6.8 (2)" that the README does not have

   **Location:** `packages/PerfectoidQuotientsPartII/Suggested.lean:153`: "(README Q6.8 (2), made
   explicit in the proof of …".

   **Witness:** README Q6.8 (lines 781–795) states three unnumbered theorems; no "(2)" exists.

   **Repair:** "(README Q6.8, second theorem; made explicit in the proof of …".

9. **F09** (P3) Process wording "kept variant"

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:413` "This is the kept variant of the
   product clause"; `README.md:451–452` "This is the kept variant, for integral perfectoid rings with
   torsion".

   **Witness:** "kept" refers to an editing decision, not to mathematics; neither sentence defines it.

   **Repair:** line 413: "This is the product clause of PerfectoidQuotients §0.6
   (`integralPerfectoid_pi_iff`) without a perfectoid hypothesis."; line 451: "This is the form, for
   integral perfectoid rings with torsion and possibly without a Tate structure, of the isomorphism …".

One P2 (a proof-route input cited to a supplier target whose hypotheses do not cover the use) and
eight P3 findings (two Checks, one boundary case, one consumer claim, locators, wording). No Lean
statement was found false; no finding of an earlier repair report was marked not actionable, so
nothing is re-raised.

## Verified sound

Counts: 18 declarations read (3 definitions, 15 theorems); 37 README subsections read, every line;
141 Check bullets read, those with a computable value recomputed (two defective: R03, R04). Locators:
every page, theorem and equation locator into CS24, BS22, BMS1, Bha18, HM17, Ces19, Sch12 and
Wedhorn, and 16 of the 17 Stacks tags, were looked up in the cached texts (four wrong pages: R06;
one tag not in the cache, below). Sibling citations: the 24 PerfectoidQuotients target names and
§§0.2–0.6, 1.2, 1.4 at its open head; PrismaticCohomology §§0.61–0.63, 0.79, 0.83–0.84, 2.30–2.31
and DerivedDeRhamCohomology §1.10 with both Lean names at their open heads; PerfectoidSpaces P0.1,
P0.2, P0.11, P1.4–P1.6, P1.15, P1.24, P1.25, P3.7, P4.15.2, P4.15.4, P4.15.5, P7.16a, P7.17 with
8 names, EnhancedDerivedSheaves §E1.6 and StableReduction Layer 1 on main: all exist; one is cited
beyond its hypotheses (R01). Pinned declarations: the 22 Tau Ceti names and the Mathlib names of
the supplier contracts were found at the pins in the files the README gives.

Dependency check, complete output:

    depcheck: 237 roadmaps, 2142 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` shows only files under
`packages/PerfectoidQuotientsPartII/`. No `lemma`, `set_option`, pull-request number, `#eval` or
sorry'd data in either file. Lean was not run in this pass (the brief forbids it); the elaborated
types in the worker's `signatures.md` were compared with the README statements and agree.

Headline theorems (README lines 19–23): Q9.3, Q9.6, Q5.6, Q6.4, Q6.7, Q6.8, Q10.2, Q10.5, Q10.6: all
stated. Q6.1 is named in the module docstring as not statable (no tilt functor at the pins). Padding
probe: none of the 15 theorems restates a definition, follows from one pinned lemma or mirrors a
Check; `tor_map_mul_root_eq_zero` needs the construction of Q10.4 and is not a corollary by one step.

Ownership: `ind-syntomic`, `ind-fppf`, `p`-Zariski, Česnavičius–Scholze Propositions 2.1.4, 2.1.9,
2.1.12, Lemmas 2.3.1–2.3.2, Theorem 2.3.4, Corollary 2.3.7 and Bhatt–Scholze Remark 10.13 were
searched by object over main and all open heads: no second owner. PerfectoidQuotients' scope
paragraph hands Layers Q5–Q9 to this roadmap. DirectSummandsAndBigCohenMacaulay §§3.2–3.3 owns
Bhatt's almost faithfully flat `K°`-cover, a different object from Q10.2. No `Suggested.lean` name
here collides with a readable roadmap's declaration.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsSyntomic` | `S = 0`; `ℤ → ℤ[1/p]`; `𝔽_p[x,y]/(x²,xy,y²)` | empty cover, `span ∅ = ⊤` in `0`; one generator, one relation, fibres of dimension 0; no presentation with fibre dimension `n` | holds, holds, fails as intended |
| `IsIndSyntomic` | `A' = 0` over `A ≠ 0`; `A[T^{1/p^∞}]` | test maps to `0` factor through the syntomic `0`; finite stages polynomial | consistent with Q7.3 (empty product ind-syntomic, not ind-fppf) |
| `IsPZariski` | `0`, `ℤ/pⁿ`, `ℤ`, `ℚ` | vacuous; `p` nilpotent; `1 + p` nonunit; `1 + p(−1/p) = 0` | as README |
| `isIntegralPerfectoid_fibreProduct` | `A' = 0`; `g = id`; `𝔽_p[t^{1/p^∞}] ×_{𝔽_p}` itself | `A × B`; `A`; perfect ring | true; CS24 lines 468–486 |
| Q5.2 (2) completeness step | defect `d = f(a₁) − g(b₁)`, `p^{n+1}d = 0` | `pd = 0`, so `(pa₁, pb₁) ∈ C` | no surjectivity needed |
| `isAdicComplete_preTilt_iff` | `ϖ♭` unit; `ϖ♭ = 0`; `p = 0` in `A'`; `(p♭, 1)` in `𝒪_C × 𝔽̄_p` | both sides false; both true; identity; both false | true; `(ϖ♭)♯ | p` from `ξ₀♯ = −p·θ(w)`, `w` a unit |
| `valuationRing_iff_preTilt` | perfect field; `𝒪_C`; `𝔽_p[t^{1/p^∞}]`; `𝒪_C × 𝒪_C` | both; both; neither; neither | true |
| `untilt_dvd_iff_and_exists_isUnit_mul_untilt` | `x = 0`; `a = 0`; `a = 1 + p` | `0 | y ⇔ y = 0 ⇔ y♯ = 0`; `b = 0`; `u = 1 + p`, `b = 1` | true |
| `isAlgClosed_fractionRing_iff` | completion of `ℤ_p[p^{1/p^∞}]`, `p` odd | `X² − u` has no root (residue field `𝔽_p`) | consistent |
| `exists_surjective_of_isSMulRegular` (three forms) | `A = 0`; `A = 𝔽_p`, `ϖ = 0`; `ϖ` a unit | `Ã = 0`; completion of `ℤ_p[p^{1/p^∞}]`, `ϖ̃ = p^{1/p}`; forces `A = 0` | true; CS24 lines 682–700 |
| `exists_approximation` | `p = 0`; `m = 0`; `v(ϖ) = 0`; `a = 1 + p` in `𝒪_C` | `a' = a`; bound `v(p)`; `a − a'♯ ∈ pA ⊆ √(ϖ)`; `v(p) ≤ v(p)` | true; CS24 lines 895–950 |
| `isTopologicallyNilpotent_iff_forall_lt_one` | `T ∈ ℚ_p⟨T⟩`; type-5 point with `v(T) < 1`; indiscrete ring; zero ring; universe of `Γ₀` | Gauss point has `v(T) = 1`; irrelevant, the Gauss point refutes the right side; no continuous valuation and every element nilpotent; same; rank-one points suffice (spectral radius) | true in every universe |
| Q8.1 rank-two control | `v(f) = (−ord_T f, −v_p(a))` on `ℚ_p⟨T⟩` | `v(T) = (−1,0) < (0,−n)` | not continuous, as README |
| `exists_indSyntomic_andre` | `A = 0`; `𝒪_C`; constant `P = 1` | all zero, no polynomial of positive degree; `A' = A`, `I' = 0`; excluded by `0 < natDegree` | true; CS24 lines 1004–1010 |
| Q9.1 "no perfectoid hypothesis" | `p`-integral closedness of `A'/I'` | `I' ⊆ ϖA'` gives `(A'/I')/ϖ = A'/ϖ`, injectivity from closedness of `A'` | holds without (2.1.2.3) |
| `exists_semiperfectoid_cover` | `A = 0`; `ℤ_(p)`; `𝔽_p`; roots in `B/J` not `B` | `0`; `ℤ̄_p`; `ℤ̄_p/p`; coefficients lift to `B` | true; README corrects the source's `B` to `B/J` |
| `exists_faithfullyFlat_isIntegralPerfectoid` | field of characteristic `p`; `ℤ_p`; `𝔽_p⟦t⟧`; crystalline prism | perfect closure; completion of `ℤ_p[p^{1/p^∞}]`; `⋃ 𝔽_p⟦t^{1/pⁿ}⟧`; `ℤ_p → 𝔽_p` not flat | true |
| Q10.4 ranks | `ℤ_p`; `k = 𝔽_p(t)`, `d = 2`; `p² − x_1` | `pⁿ`; `pⁿ·p^{2n}`; `φ(f) ∈ 𝔪²` | as README |
| `tor_map_mul_root_eq_zero_of_cover`, `tor_map_mul_root_eq_zero` | `c = 0`; `S = R`; `S` étale; `R = ℤ_p⟦x⟧`, `S = R ⊕ 𝔪√x` | `c_k = 0`; source 0; source 0; source `k ≠ 0` (R03) | statement consistent; enlargement step checked (`T = c` in `R'_∞`, so `T^{1/pᵏ} ∈ J`) |

Supplier hypotheses checked where the route relies on them: DerivedDeRhamCohomology §1.10 (base
noetherian, both rings `π`-torsion-free and classically complete: `R` complete in Q10.2, Q10.4,
Q10.5); PrismaticCohomology §2.31 (finitely presented finite algebra, finitely generated `J`);
PerfectoidSpaces P1.24 (Frobenius bijective with no nonzerodivisor hypothesis); Mathlib
`Perfection.quotientMulEquiv` (needs `CharP (R ⧸ I) p`, so a nonzero quotient: README Q5.1 says so).

## Not verifiable

- Stacks Lemma 15.32.2 (0BIQ): the cached Stacks text is the Commutative Algebra chapter only; the
  tag is the one Česnavičius–Scholze cite at (2.3.6.1) (CS24 line 1080), the statement was not read.
- The elaboration of `Suggested.lean`: not run here; the last repair report records exit 0 with 15
  `sorry` warnings on an unchanged file.
- GR18, Huber, Kedlaya–Liu and Gabber references that the sources cite inside proofs: not in the
  manifest and not cited by the README as locators.
- PurityForFlatCohomology (later in the merge order) states a contract
  `gap:regular-tower-tilt` on §Q10.1 of this roadmap (the tilt of the completed tower of a perfect
  residue field). Nothing here provides it; under the gap rules this is the consumer's declared
  contract and not a finding of this pass.

## Source issues

- **Gap** in BS22 at Remark 10.13, p. 83: the source says a faithfully flat perfectoid cover inside the completed absolute integral closure exists by Remark 3.11 for every complete regular local ring; it should be restricted to covers whose Frobenius stages are finite, as for `F`-finite residue fields; affects the proof.
- **Gap** in BS22 at Remark 10.13, pp. 83–84: the source says almost vanishing of the middle `Tor` gives annihilation by the chosen roots of `c` in `R⁺`; it should first enlarge the cover by roots of `c` mapping to the chosen ones; affects the proof.
- **Gap** in CS24 at Corollary 2.3.7, proof, p. 29: the source says Theorem 2.3.4 gives a ring in which every monic polynomial has a root; it should take the quotient of that ring by the divisible ideal of the theorem; affects the proof.
- **Misprint** in CS24 at Corollary 2.3.7, proof, p. 29: the source says part (d) of Proposition 2.1.11, which concerns products, gives perfectoidness of the completed reduced quotient; it should be part (c), root-stable quotients; affects nothing.
- **Misprint** in CS24 at Theorem 2.3.4, p. 25: the source says every monic polynomial acquires a root; it should be every monic polynomial of positive degree, the constant one having none in a nonzero ring; affects a stated result.
- **Error** in CS24 at §2.3.3, p. 24: the source says a finite product of ind-fppf algebras is ind-fppf; it should be a nonempty finite product, the zero algebra not being faithfully flat over a nonzero ring; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dddd8d6eb69c93e5f9fdcde10e9d99d555da445c", "job": "RT-PerfectoidQuotientsPartII~1b", "model": "fable", "worker": "chris-x10"} -->
