# FIX-RT-PerfectoidQuotientsPartII~2

Repair of red-team round 2 (passes a and b) on `packages/PerfectoidQuotientsPartII`. There are nine
findings. Where they overlap they are merged, giving six sections. I checked every finding against
the cited sources (CS24, Stacks), the supplier roadmaps (PerfectoidQuotients §0.6 and
PrismaticCohomology §§0.61–0.63 at their open heads, PerfectoidSpaces P4.15.2 on main) and the
pinned Tau Ceti. All nine hold, so none is disputed and none is marked not actionable. Every
change is in `README.md` and `sources.toml`. `Suggested.lean` is unchanged: no finding asks for a
Lean change, and no statement in it was found false. `design/plan.json` keeps `"gaps": []`.

## RT-PerfectoidQuotientsPartII~2a/F01, RT-PerfectoidQuotientsPartII~2b/F01 (P2) — applied

**Change.** Old Q6.8 route: the `ϖ̃'`-adic completion of `Ã'[1/ũ]` is perfectoid "by
`perfectoid_completely_etale_henselization`". New route, in two steps:
1. `R₁`, the `p`-adic completion of the étale algebra `Ã'[1/ũ]`, is perfectoid by
   `perfectoid_completely_etale_henselization`.
2. `Ã`, the `ϖ̃'`-adic completion of `R₁`, is perfectoid by `perfectoid_sharp_ideal_completion`,
   taken at the image of `X_{ϖ♭}`; its sharp is the image of `ϖ̃'` by `untilt_natural`.

Since `p ∈ ϖ̃'^p Ã'`, `R₁/ϖ̃'ⁿ = Ã'[1/ũ]/ϖ̃'ⁿ`. The Needs line, a new Check and the §0.6 contract
bullet are updated.

**Evidence.** PerfectoidQuotients §0.6 (at its open head) states this target only for "the
ordinary `p`-completion" of a henselization and "the appropriate `p`-completion" of ind-étale
algebras. CS24 Corollary 2.1.6 (CS24 line 492) gives the `ϖ`-adic form, and the source's proof uses
it (CS24 lines 697–699). I verified 2b's witness in full and recorded it as a new Q6.8 Check:
- Take `A` perfect, `ξ = p`, `ϖ = 0 = ϖ♭u` with `u ≠ 1`, `ξ̃₀ = 0` and `ξ̃₁ = 1`.
- Then `Ã' = B` and `p = 0` in it, so `B[1/X_u]` is its own `p`-adic completion.
- `Σ(X_0/X_u)ⁿ` converges `X_0`-adically to an inverse of `1 − X_0/X_u`.
- `1 − X_0/X_u` has no inverse in `B[1/X_u]`. The map `X_0, X_u ↦ t`, with every other `X_a ↦ 1`,
  sends `B[1/X_u]` to the nonzero ring `𝔽_p[t^{1/p^∞}]^∧[1/t]` and kills `X_u − X_0`.

2a/F01 also asks for two more changes: replace the Q6.1 citation, and cite Stacks 090T. These
coincide with 2b/F02 and 2b/F03, and I made them as described in those two sections.

Pattern: the §0.6 contract bullet described this target as "completed ind-étale and henselian
extensions, Corollary 2.1.6". It now says "`p`-adic completions", and says that Q6.8 gets the
`ϖ`-adic form by combining it with (e). No other route cites this target. Q9.3 restores
henselianity with Tau Ceti's henselization, and `quotientPowEquiv` leaves its completion unchanged.

## RT-PerfectoidQuotientsPartII~2b/F02 (P3) — applied

**Change.** Old: "`Ã' = W(B)/(ξ̃)` is integral perfectoid (Q6.1)". New: `(W(B), (ξ̃))` is a perfect
prism. `W(B)` is `(p, [ξ̃₀])`-complete, and `δ(ξ̃)` reduces to the unit `ξ̃₁` of `B`. So `Ã'` is
integral perfectoid with tilt `B` (PerfectoidSpaces P4.15.2; CS24 (2.1.2.1), p. 10). In the Needs
line, Q6.1 is replaced by P4.15.2. The `p`-torsion-free variant now reads `Ã'[p] ≅ B[X_{ξ₀}] = 0`
(Q5.4 (1)).

**Evidence.** Q6.1 is relative: it works over a fixed `A` with `ξ ∈ W(A♭)`. Here `B` maps onto `A♭`
rather than being an `A♭`-algebra, and `ξ̃` comes from no base. CS24 cites the absolute statement
(2.1.2.1) at CS24 line 694, which is stated at CS24 lines 396–399.

Distinguishedness, checked directly: write `ξ̃ = [ξ̃₀] + pw`. Then `pδ(ξ̃) = φ(ξ̃) − ξ̃^p ≡ pφ(w) mod p²`,
so `δ(ξ̃) ≡ φ(w) ≡ ξ̃₁ mod p`. This is why I did not add PrismaticCohomology §§0.61–0.63 to the Needs
line, which 2b suggested. Those sections hold δ-functoriality and the radical criterion, which the
direct computation does not use. They stay in the layer's Dependencies.

Pattern: Q5.6 already cites P4.15.2 and (2.1.2.1) for the same absolute step. Q6.6 cites Q6.1
correctly, because it works over the base `V`.

## RT-PerfectoidQuotientsPartII~2b/F03 (P3) — applied

**Change.** Old: "`B` … a perfect `ξ̃₀`-complete `𝔽_p`-algebra". New: `B` is `ξ̃₀`-adically complete
because `(ξ̃₀) ⊆ (X_{ϖ♭})` (Stacks Lemma 10.96.8). The Stacks entry in `sources.toml` now lists Q6.8
under `cited_for`.

**Evidence.** Stacks line 10626 (tag 090T): for ideals `I ⊂ J` with `I` finitely generated, a module
that is `J`-adically complete is also `I`-adically complete. Before this change, the References list
was the only place in the README that mentioned 10.96.8.

## RT-PerfectoidQuotientsPartII~2a/F02 (P3) — applied

**Change.**
- Q8.4 proof route: added the rank-one coarsening. `H` is the largest convex subgroup not
  containing `v(ϖ)`. `Γ_v/H` has rank one and embeds in `ℝ_{>0}`. The coarsening `w` is continuous
  (Q8.1), with `w(A₀) ≤ 1` and `w(a) ≥ 1`.
- Conventions: valuations in Q8.3 and Q8.4 take values in any universe.
- New Q8.4 Check: a rank-two valuation on `ℚ_p⟨T⟩` coarsens to the Gauss valuation.

**Evidence.** The elaborated signatures show the gap: `Γ₀ : Type u_2` while the ring has
`Type u_1`. The old route builds its witness from a valuation ring `V` whose value group lies in
the ring's universe. So the "if" direction was not reached when `Γ₀` lives in a smaller universe.

The coarsening works because the powers of `v(ϖ)` are cofinal. Any convex subgroup containing
`v(ϖ)` is then all of `Γ_v`, so `Γ_v/H` has only trivial convex subgroups and is archimedean.

I recomputed the witness. With `v(f) = (|f|_Gauss, γ^{ord_{T=1} f̄})`:
- `v(p)ⁿ = (p^{−n}, 1)` is cofinal, and `v(T) = (1, 1)`.
- `H = 1 × γ^ℤ`, and `w` is the Gauss valuation with `w(T) = 1`.
- Coarsening by the whole group would give the trivial valuation, which is not continuous.

The Lean statement already quantifies over an independent universe and is true as typed, so it is
unchanged.

## RT-PerfectoidQuotientsPartII~2a/F03, RT-PerfectoidQuotientsPartII~2b/F05 (P3) — applied differently

**Change.**
- Tau Ceti contract: lists `of_algEquiv`, `baseChange`, `mvPolynomial`, `mvPolynomial_fin`, `trans`,
  `localization_away`, `trans_localization_away` and `localization_away_trans`, with their files.
  Old: "relative global complete intersection automatically flat … is Q7.6". New: "for one
  equation … (case of one relation) is Q7.6".
- Q7.2: the composition argument now goes chart by chart, and two Checks name Tau Ceti's polynomial
  and localization cases.

**Evidence.** I checked each name at the pin:
- `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean` lines 206, 218, 232, 243.
- `Composition.lean` line 43.
- `Localization.lean` lines 57, 68, 75.

Stacks Lemma 10.136.13 (Stacks line 16817) covers any number of relations, while Q7.6 covers one.
2b/F05 is applied exactly as asked.

**What differs from 2a's repair.**
- 2a proposed `trans` and `trans_localization_away` for composition, and that pair does not prove
  it. For `R → S → T`, a chart `T_h` is standard syntomic over `S`, not over `S_g`. One first needs
  `T_{hg} = T_h ⊗_S S_g` over `S_g` by base change, then `trans` over `R`. The products `hg`
  generate the unit ideal. The Q7.2 bullet now states this.
- The Lean names appear only in the contract, which uses the same namespace pattern as the
  `IsIntegralPerfectoid` bullet. Q7.2's API bullet and Checks refer to them in prose, so the Checks
  name no Lean declarations.

I recomputed `ℤ[x]/(px − 1)`. It has one generator and one relation. Its fibres are empty at `p` and
a point elsewhere, so the relative dimension is `0`.

## RT-PerfectoidQuotientsPartII~2a/F04, RT-PerfectoidQuotientsPartII~2b/F04 (P3) — applied

**Change.**
- Summary: "(Layers Q5–Q6, after Česnavičius–Scholze §2.1)" becomes "(Layers Q5–Q6;
  Česnavičius–Scholze Propositions 2.1.4, 2.1.9 and 2.1.12)". "(…, after §2.3)" becomes
  "(Layers Q7–Q9; … Theorem 2.3.4 and Corollary 2.3.7)".
- Scope: the "remaining structure theory of §2.1, all of §2.3" passage is replaced. It now names
  the mathematics and gives exact locators with pages.

**Evidence.** The planning principle forbids saying that a roadmap follows a source. I chose 2a's
by-result locators over 2b's section-and-page form, because the latter still assigns the layers to
source sections. I checked the pages against CS24:
- (2.1.1.3): p. 10, line 386. (2.1.2.2) and (2.1.2.5): p. 11.
- Proposition 2.1.4: p. 12. Example 2.1.5: p. 13. Proposition 2.1.9: p. 14. Remark 2.1.10: p. 15.
- Proposition 2.1.12: p. 17, line 682. Lemma 2.3.1: p. 22.
- Lemma 2.3.2 and §2.3.3: p. 24, lines 959 and 980. Theorem 2.3.4: p. 25.
- Corollary 2.3.7: p. 28, line 1157.

Pattern: the README has no other "after" or "following" phrase about its own layers. The
"Česnavičius–Scholze §§3–6" mentions in "Not owned here" and "Downstream consumers" locate other
roadmaps' subjects, not this roadmap's organisation, so I left them.

## Checks

**Elaboration** of `packages/PerfectoidQuotientsPartII/Suggested.lean` (unchanged):
`lake env lean`, run from the content checkout, exited 0 with 16 `declaration uses 'sorry'`
warnings, at lines 91, 109, 120, 130, 139, 148, 160, 171, 189, 202, 225, 246, 271, 284, 304 and
339. There were no other messages.

**`#check @name` for all 19 declarations.** I elaborated a scratch copy with the 19 `#check`
lines appended, and it exited 0. Each elaborated type matches its README statement:
- `exists_approximation` and `isTopologicallyNilpotent_iff_forall_lt_one` put `Γ₀` in a universe
  independent of the ring's, as the new Conventions sentence says.
- The Q10 statements keep `IsDomain`, `IsRegularLocalRing`, `IsAdicComplete (maximalIdeal R) R`,
  `CharZero`, `CharP (ResidueField R) p` and, where stated, the `Module.Finite … fieldRange` binder.
- No statement lost a binder, and no signature changed this round.

**Dependency check** (complete output):

    depcheck: 207 roadmaps, 1900 edges, 0 problem(s)

There are no UPWARD, CYCLE or `moved:` lines.

**Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citations and no Lean
names found nowhere. It notes that names outside TauCetiRoadmap were not checked on this host, so I
checked the eight Tau Ceti syntomic names newly added to the contract at the pinned files and lines
listed above.

No gate failures were listed for this round.

## Adversarial pass on added and changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `(W(B),(ξ̃))` perfect prism (Q6.8) | `ξ̃ = (0,1,0,…)`; `ξ̃ = [−X] + p` (`p` odd) over `𝔽_p[X^{1/p^∞}]^∧`; `ξ̃ = [X]` | `ξ̃ = V(1) = p`, `δ(p) ≡ 1`; `ξ̃₁ = 1`, quotient the completed `ℤ_p[p^{1/p^∞}]`; `ξ̃₁ = 0`, `δ([X]) = 0`, not distinguished | holds; `ξ̃₁` a unit is the criterion |
| `ϖ̃'^p ∣ p` in `Ã'` | `ξ̃ = [ξ̃₀] + pw`, `ξ̃₀ = X^p c` | `p = −(ξ̃₀)♯θ(w)^{−1} = ϖ̃'^p · (−c♯θ(w)^{−1})` | holds |
| `R₁/ϖ̃'ⁿ = Ã'[1/ũ]/ϖ̃'ⁿ` | `n = 0`; `p = 0`; mixed characteristic | `0 = 0`; `R₁ = Ã'[1/ũ]`; `pⁿ ∈ (ϖ̃'^{pn}) ⊆ (ϖ̃'ⁿ)` and `R₁/pⁿ = Ã'[1/ũ]/pⁿ` | holds |
| `Ã` `ϖ̃`-torsion-free | `ũ = 1`; `x ∈ lim S/ϖ̃'ⁿ` with `ϖ̃'x = 0` | `Ã = Ã'`; `ϖ̃'x_{n+1} ∈ ϖ̃'^{n+1}S ⇒ x_{n+1} ∈ ϖ̃'ⁿS ⇒ x_n = 0` | holds |
| `Ã ↠ A`, `ϖ̃ ↦ ϖ` | `ϖ̃' ↦ (ϖ♭)♯ = u^{−1}ϖ` | `ϖ̃'ⁿ ↦ (ϖⁿ)`, map extends to the completion; `ϖ̃'ũ ↦ u^{−1}ϖu = ϖ` | holds |
| `p`-torsion-free variant | `A = 𝔽_p`, `ξ₀ = 0` | `Ã'[p] ≅ B[X_0] = 0`, `Ã' ↠ 𝔽_p` | holds |
| New Q6.8 Check | `ϖ♭ = 0`, `u ≠ 1` (`p` odd or `A = 𝔽_4`) | `B[1/X_u] → 𝔽_p[t^{1/p^∞}]^∧[1/t]`, `X_u − X_0 ↦ t − t = 0`; `X_0 ≠ X_u` as `u ≠ 0` | `p`-completion alone is not `X_0`-complete |
| Q8.4 coarsening | `ℚ_p`, `a = 1`; rank-two `v` on `ℚ_p⟨T⟩`; zero ring | `H = 1`, `w = v`, `w(1) = 1`; `H = 1 × γ^ℤ`, `w` Gauss, `w(T) = 1`; no valuations | holds |
| Rank-one claim | convex `K ∋ v(ϖ)`, `γ ∈ Γ_v` | `v(ϖ)^n < γ` and `v(ϖ)^m < γ^{−1}` give `γ ∈ K`, so `K = Γ_v` | `Γ_v/H` has rank one |
| Conventions universe sentence | `Γ₀ : Type 0`, ring in `Type 1` | rank-one `w` lands in `ℝ_{>0}` and transports to any universe | holds |
| Q7.2 composition | `R → S → T` with charts | `Σa_ig_i = 1`, `Σb_jh_j = 1` ⇒ `Σa_ib_j g_ih_j = 1`; `T_{hg} = T_h ⊗_S S_g` | holds with `baseChange` + `trans` |
| Q7.2 Checks | `ℤ → ℤ[1/p]`; `A[T^{1/pⁿ}]` | 1 generator, 1 relation, fibres `∅`/point, dim 0; one variable, dim 1 | match `localization_away`, `mvPolynomial_fin` |
| Contract, Q7.6 sentence | `A[x,y]/(f₁,f₂)` | two relations: Stacks 10.136.13 yes, Q7.6 no | sentence now one relation |
| Summary and Scope locators | 13 CS24 locators | pages 10–17 and 22–28 found at the CS24 lines listed above | correct |

## Ownership and overlaps

I added no new targets. The repaired Q6.8 route uses only suppliers that the contracts already
name:
- PerfectoidQuotients §0.2 (`untilt_natural`) and §0.6 (`perfectoid_sharp_ideal_completion`,
  `perfectoid_completely_etale_henselization`). I read both sections at PerfectoidQuotients' open
  head.
- PerfectoidSpaces P4.15.2 on main, which states the equivalence between perfect prisms and
  integral perfectoid rings.

PrismaticCohomology §§0.61–0.63 were read at their open head and are unchanged as citations. The
overlap file lists no open pull request that changes this roadmap and no id it cites that is
dropped. No supplier gap was needed.

## For the maintainer

- No Lean name changed or was added. No backticked name of this roadmap's own was added to the
  README. Other roadmaps cite ids here (PurityForFlatCohomology, EtaleDualityAndPerverseSheavesPartII,
  SchemeAndStackFoundationsPartII), and all of them remain valid.
- `sources.toml`:
  - CS24's `locator` gains (2.1.2.1) and Corollary 2.1.6, and its `cited_for` gains "Summary" and
    "Scope and ownership".
  - Stacks' `cited_for` gains Q6.8.
  - No new source and no `needs-references.toml`.
- The `summary` field of `design/plan.json` still says the package follows Česnavičius–Scholze
  §§2.1 and 2.3. This job may not edit that field, which is outside the `gaps` list. The README no
  longer says this.
- In 2a/F03, the repair as proposed would not prove composition of syntomic maps, as the
  "What differs from 2a's repair" note there explains.
