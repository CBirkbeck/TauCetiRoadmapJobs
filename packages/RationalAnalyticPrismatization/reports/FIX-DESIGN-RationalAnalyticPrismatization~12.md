# Repair of RationalAnalyticPrismatization (design, round 12)

There was one review, `REV-DESIGN-RationalAnalyticPrismatization~11`. Its verdict was `needs_changes`, with three findings, all P3.

- Each finding was checked against the cached ALRS text before any edit. All three hold, and all three are applied.
- Files changed:
  - `packages/RationalAnalyticPrismatization/design/README.md`
  - `packages/RationalAnalyticPrismatization/design/plan.json`
  - `packages/RationalAnalyticPrismatization/sources.toml` (Remarks 3.1.4 and A.3.2 added to the ALRS locator list)
- Every README change to a statement, API bullet or Check is mirrored verbatim in `plan.json`.
- The review's "For the human reviewers" section (scope, licence, Gestalten ownership) lists no finding, and nothing was changed because of it.

## F01 (P3) — applied

**Verified.** The 4.8 clause defined (T_X[1]{1})^† as the fibre of T_X[1]{1} → "its de Rham stack" and cited ALRS Remark 3.1.4. Both parts of the finding hold.

- ALRS Remark 3.1.4 (ALRS line 2230–2233) uses the weight twist (−1) and the relative stack T[1](−1)^dR ×_{X^dR} X.
- The general definition is ALRS Remark A.3.2 (ALRS line 10074–10082, p. 187). There, (T_f[i])^dR is an object over Y with value τ_{≥−i}Hom_A(η^*L_f, A^u), and (T_f[i])^†(A) = τ_{≥−i}Hom_A(η^*L_f, Nil†(A)).
- The witness holds. Take Y = A¹ and A = C_p[ε]/ε². The relative fibre is B(C_p·ε). An absolute de Rham stack of the total space would add the fibre C_p·ε of A¹(A) → A¹(C_p).
- The symbol {1} was also a forward reference: it is defined only in 9.1.

**Change (4.8).** "(T_X[1]{1})^† as the fibre of T_X[1]{1} → its de Rham stack (Remark 3.1.4)" → T_f[i], (T_f[i])^dR and (T_f[i])^† over Y for i ≥ 0, with their values, and the twisted versions for a line bundle L on Y (Remark A.3.2). Remark 3.1.4 is now identified as the base change X × BG_m → BG_m with L of weight −1.

The target also gains:
- four API bullets: the values of the three stacks, the fibre sequence of spectrum objects, L_{BG/S} ≅ e^*L_{G/S}[−1], and L_{Ŷ/X̂} = 0;
- the Check `tangent_overconvergentLine`;
- §3.1, §1.8 and §1.2 in its *Needs* line;
- Remark A.3.2 in its plan locator, and i and L in its plan hypotheses.

**Where this differs from the suggested repair.**
- The values are written τ_{≥0}Hom_R(η^*L_f, R[i]), which is T_f(η, R, R[i]) of Construction A.3.1 read as an anima. The statement records that the source writes this τ_{≥−i}Hom_R(η^*L_f, R). With this notation the Check value T_{A¹}[1](η) = BA is unambiguous; read literally, τ_{≥−1}Hom(A, A) would be A.

**Same pattern elsewhere.**
- **5.4.** It described the Hodge stack as "the classifying stack of the shifted tangent bundle T_X[1](−1) restricted to its overconvergent neighbourhood of zero". Read literally, that is the classifying stack of T[1], which is wrong. It now reads "(T_X[1](−1))^† of 4.8, formed for X × BG_m → BG_m and the line bundle of weight −1; for X with tangent bundle T_X, the classifying stack of T^†_X(−1)". *Needs* gains §4.8.
- **9.1.** (T_X[1]{1})^† now says it is the 4.8 complex formed for X × Q_p^HT → Q_p^HT and the pullback of I.
- **9.2 and 11.x.** Their uses of (T{1}[2])^†, (O{1}[3])^† and BT^†{1} are instances of the new definition with i = 0, 1, 2. They needed no change.

## F02 (P3) — applied

**Verified.** ALRS line 5094–5098 first names G_r ⊂ G_0 as the compact open subgroup of ℚ_p-points of G_0(r). It then reuses the letter for the rigid group ⊔_{g ∈ G/G_r} gG_0(r). The README took only the second meaning, so "G/G_r" was circular.

The fifth Check was also wrong. For G = ℤ_p and 1/p ≤ r′ < 1, the rigid group G_{r′} = ⊔_{a ∈ ℤ/p}(a + G_0(r′)) contains all of ℤ_p.

**Change (10.3 statement).** "G_r the induced rigid analytic group ⊔_{g ∈ G/G_r} gG_0(r)" → "G_0(r)(ℚ_p) ⊆ G_0 the compact open subgroup of ℚ_p-points of G_0(r), normal in G because conjugation is given by integral power series, G_r the induced rigid analytic group ⊔_{g ∈ G/G_0(r)(ℚ_p)} g·G_0(r)".

**Change (10.3 fifth Check).** "since G_{r′} ∩ ℤ_p = pℤ_p" → "since G_0(r′)(ℚ_p) = {x ∈ ℤ_p : |x| ≤ r′} = pℤ_p …, so that G_{r′} is the union of the p discs a + G_0(r′) …; the rigid group G_{r′} itself contains all of ℤ_p".

**Same pattern elsewhere.** G_r, G_{<r}, G_{≤r} and G_0(r) occur only in 10.3.

## F03 (P3) — applied

**Verified.** The script over `plan.json` (theorem-typed targets, empty `api`, statement containing "define" or "call") returns exactly the twenty listed targets: 3.5, 4.3, 4.7, 4.8, 5.2, 5.4, 6.3, 7.4, 7.5, 7.6, 8.4, 9.4, 9.5, 9.9, 10.4, 10.7, 10.8, 10.9, 11.10 and 12.1. Each was read in the README.

**Change.** Each of the twenty gains a "The API has the following laws." list:
- three bullets for 5.4, 7.4, 9.4 and 10.8, four for the other sixteen, 75 in all;
- each placed after *Needs* and before **Checks**, mirrored as named `api` entries in `plan.json`;
- each bullet restates, with its hypotheses, a property the statement proves. For 8.4 these are the line bundle and its divisor, the pullback ⊔ φ^{n,*}D, triviality off ⋃ φ^{−n}(Q_p^HT), and the cone square.

After the edit the script returns no target.

**Where this differs from the suggested repair.** The suggestion said "no statement changes". Writing the API exposed notions that a statement named only by source number, or used undefined. Each is now stated:

- **3.5.** The definitions of Tannakian, strongly Tannakian and perfect stacks (ALRS Definition 2.4.2, ALRS line 1092–1103).
- **5.2.** Sqz(Y/S; η) as the fibre of τ_{≥0}Hom_Y(L_{Y/S}, f^*M[1]) → τ_{≥0}Hom_Y(f^*L_{X/S}, f^*M[1]) at f^*η (ALRS line 1716–1723).
- **5.4.** Div¹_{A¹}, the stack of degree-one divisors on Ã¹_A, and X^{Div¹_{A¹}}, the sheafification of (A, D) ↦ X(D) (ALRS line 2243–2247).
- **10.4.** The R-semilinear representations Mod_R(D(BG^Bin_{r,ϖ})) (ALRS line 5493–5495).
- **10.7.** The algebra B, which was undefined in "B ⊗_{R^la} R = R′". It is the Berkovich-étale R^la-algebra corresponding to R′, with a locally analytic G-action (ALRS line 5877–5881).
- **10.8.** "ϵ-TORS uniformly on G": ϵ-TORS for every G_0 in a basis of compact open subgroups (ALRS line 6213–6216).
- **4.3.** "for Zariski closed f: Z → Y and g: Z → X" → "for two Zariski closed maps …". ALRS Lemma 2.7.3 (ALRS line 1375) assumes both maps are Zariski closed.

Two bullets carry the exact loss the source proves: ϵ-TORS becomes dϵ-TORS (ALRS Corollary 5.5.13, ALRS line 6203–6207, and Lemma 5.5.16(2), ALRS line 6232–6234).

## Checks run

**Dependency check (gate),** after all edits:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2264 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

**`roadmaps resolve`.** One citation is found nowhere: "MotivesAndAlgebraicCyclesPartII Layer 0". As in earlier rounds, this is a board package (`packages/MotivesAndAlgebraicCyclesPartII/README.md` has "## Layer 0: The Banach arc-site"), so it is not a defect. No Lean name is found nowhere. No new cross-roadmap citation was added: VectorBundlesAndIsocrystals Layer 5 and PadicHodgeTheory §2.3 in the new bullets were already cited by the same targets.

**Scripted agreement.**
- All 611 plan statements, API bullets and tests occur verbatim in the README. That is 534 before, plus 75 API bullets, the 4.8 Check, and the changed 10.3 Check.
- All 21 gap `needs` sentences occur in the README.
- `plan.json` round-trips with its original formatting.
- `sources.toml` parses.

**New locators against the page markers.**

| Line | Page | Locator |
|---|---|---|
| ALRS 1092 | 21 | Definition 2.4.2 |
| ALRS 1712 | 32 | Definition 2.8.11 |
| ALRS 2230 | 43 | Remark 3.1.4 |
| ALRS 2240 | 43 | Definition 3.1.5 |
| ALRS 5094 | 97 | §5.2.2 |
| ALRS 5492 | 104 | Definition 5.2.18 |
| ALRS 5877 | 110 | Lemma 5.4.5 |
| ALRS 6213 | 116 | Definition 5.5.14 |
| ALRS 10041 | 186 | Construction A.3.1 |
| ALRS 10064 | 187 | Construction A.3.1, shifted tangent space |
| ALRS 10074 | 187 | Remark A.3.2 |

All agree.

**Policy grep** (README and plan): no LaTeX delimiter, `$`, machine path, pull-request number or `set_option`. The README has no backticked name of its own.

**Suggested.lean.** The design stage has no `Suggested.lean`, so there was no `#check` pass and no elaboration. No Lean file was written.

**Sources.** No source was fetched, and no `needs-references.toml` was written. Every passage used is in the cached ALRS text.

**Ownership.** No new construction was introduced. The tangent complexes, the Hodge stack, the Tannakian analytification and the square-zero lifts are all stated for Gelfand stacks, inside layers this roadmap owns. `roadmaps grep -i` at the index of 2026-11-15:
- "overconvergent tangent", "Hodge stack", "Tannakian stack": no match on main or in any open pull request;
- "square-zero lift": only the discrete-ring theory of DerivedModuleAlgebra §0.25, which 5.2 already lists in *Needs*, and unrelated uses in ComplexComparisonPartII, CrystallineCohomology and DerivedDeRhamCohomology.

Ownership against open pull requests was not checked beyond this search.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.8 T_f[i], (T_f[i])^dR, (T_f[i])^† | Y = GSpec(ℚ_p); Y = A¹, A = C_p[ε]/ε², i = 1; same, i = 0; A = C_p | Point, point, point. BA, BC_p, B(C_p·ε). For i = 0, (T)^† = C_p·ε = G_a^†(A), the overconvergent neighbourhood of the zero section (agrees with 9.2). Nil†(C_p) = 0 gives (T[i])^† = point | holds | defined |
| 4.8 absolute versus relative de Rham | A¹, C_p[ε]/ε² | relative fibre B(C_p·ε); absolute fibre B(C_p·ε) × C_p·ε | relative is correct | Check added |
| 4.8, BG_m | L = O[−1], i = 1 | Hom(A[−1], A[1]) = A[2], so T[1] = B²A and (T[1])^† = B²G_a^† | consistent with L_{BG_m} Check | — |
| 4.8, Remark 3.1.4 (relative to X^dR) | point (x, L) of X × BG_m over A | Fibre of T[1](−1) → T[1](−1)^dR ×_{X^dR} X: L′ over A^u is forced to L ⊗ A^u, leaving ker(Hom(x^*L_X, L[1]) → Hom(x^*L_X, (L ⊗ A^u)[1])) = Hom(x^*L_X, (L ⊗ Nil†A)[1]). Same as relative to X × BG_m | same fibre | stated |
| 4.8 twist, used in 9.1 | X = A¹; Y = GSpec(C_p), L_Y = C_p(1)[1], I ≅ Ĉ(1) | B(G_a^†{1}), the band of 9.1 Check 2. Hom(C_p(1)[1], I[1]) = O, so (T_Y[1]{1})^† = G_a^† (9.1 Check 3) | holds | pointer added |
| 5.4 Hodge stack | X = GSpec(ℚ_p); X = A¹ | BG_m = (A¹/G_m) ×_{A¹/G_m} BG_m; B(G_a^†(−1)) over A¹ × BG_m. The old reading "classifying stack of T[1](−1)" gives B²G_a(−1) | new text holds | fixed |
| 5.4 Div¹_{A¹} ≅ A¹/G_m^† | A = C_p; A = C_p[ε]/ε² | C_p = C_p/G_m^†(C_p). At A: a ≠ 0 gives one point; at the thickened origin, divisors bε with automorphisms 1 + cε, matching orbits of (1 + C_p ε) on A | holds | defined |
| 10.3 G_r | G = ℤ_p with r′ = 1, 1/p, 1/p²; G = ℤ_p × ℤ/2, p odd | G_0(r′)(ℚ_p) = ℤ_p, pℤ_p, p²ℤ_p, giving 1, p, p² discs. 2p^k discs. Integral f with f(0) = 0 has \|f(x)\| ≤ \|x\|, so G_0(r)(ℚ_p) is normal | holds | fixed |
| 10.3 fifth Check | G = ℤ_p, r′ ∈ [1/p, 1) | old: G_{r′} ∩ ℤ_p = pℤ_p, false (= ℤ_p); new: G_0(r′)(ℚ_p) = pℤ_p | fixed | Check fixed |
| 3.5 Tannakian | X = Spec R′; X = BG_m^sch | affine: Tannaka duality; BG_m: maps Y → BG_m are graded perfect complexes → Perf(Y) given by a line bundle, = Pic(A(*)) = BG_m(A) | holds | defined |
| 4.3 pushout | Z = ∅; two discs at the origin; A = B = C | X ⊔ Y; ℚ_p⟨S, T⟩/(ST); D = A, identity | holds | "two Zariski closed maps" |
| 5.2 Sqz(Y/S; η) | Y = X; X = S; ℚ_p over ℚ_p with M = ℚ_p | L_{Y/X} = 0: the lift is unique. η = 0: Sqz(Y/S; 0) = Sqz(Y/S; M). ℚ_p ×_{ℚ_p ⊕ ℚ_p[1]} ℚ_p = ℚ_p[ε]/ε². Obstruction in π_{−1}Hom(L_{Y/X}, f^*M[1]) = π_0Hom(L_{Y/X}, f^*M[2]) | holds | defined |
| 6.3 API | d = 0; d = 1 (G_m, P¹); d = 2 | ω = O; H¹ = O(−1) and ω_{P¹} = O(1)[2]; (O(1)[2])^{⊗2} = O(2)[4], since (ℚ_p, p^{−1}φ)^{⊗2} = (ℚ_p, p^{−2}φ) | holds | API |
| 7.4 API | Y = Marc(𝔽_p); Y = ∅ | GSpec(ℚ_p), so Y^HK = GSpec(ℚ_p)/φ^ℤ; the right adjoint gives ∅ | holds | API |
| 7.5 API | A perfectoid; A = C_p[ε]/ε² | identity square; Γ = ℚ_p ×_{C_p} A = ℚ_p ⊕ C_p·ε | holds | API |
| 7.6 API | λ = 0; λ = −1 at C_p and C_p[ε]/ε²; λ = 1 | kernel of ℚ_p^la → ℚ_p^sm is Nil†; π_0 = C_p/ℚ_p and π_1 = C_p·ε ⊗ D_1; 1 + D̃^{<1} | holds | API |
| 8.4 API | X_cyc; X = GSpec(ℚ_p) | zeros Φ_{p^{n+1}}(q), n ≥ 0, disjoint; Q_p^Δ = A¹/G_m ×_{(A¹/G_m)^dR} D^{×,dR}_{FF,Marc(ℚ_p)} | holds | API |
| 9.4 API | X = GSpec(ℚ_p); X = ∅ | X^cone_s = BG_m, GSpec(ℚ_p) → BG_m^dR a G_m^dR-torsor; all empty | holds | API |
| 9.5 API | X = GSpec(ℚ_p); G_m | FE = O{1} and L = C_p(1)[1]; cocycle γ ↦ t non-split | holds | API |
| 9.9 API | arc-stacks; X_cyc | 0 → ℚ_p(1) → BC(O(1)) → G_a → 0; p^{−1}φ(log q) = log q | holds | API |
| 10.4 API | d = 0; G = ℤ_p, (1 + p)^a; Λ = ℚ_p(p^{1/2}) | C_{r,ϖ} = Λ° and G^Bin = GSpec(Λ); c_n = p^n with r < p; \|p\|_ϖ = 1/4 ≤ 1/2 | holds | API, statement |
| 10.7 API and B | G trivial; R′ = R × R split | R^la = R; B = R^la × R^la with B ⊗_{R^la} R = R′ | holds | API, statement |
| 10.8 API | trivial action; A = B = C | ϵ-TORS for every ϵ; B ⊗ C = C has ϖ^ϵ- hence ϖ^{dϵ}-torsion (dϵ ≥ ϵ for d ≥ 1); d = 0 is excluded by δ > dϵ > 0 | holds | API, statement |
| 10.9 API | G trivial; one-dimensional Γ | Perf identity; W^la = W^fin with K̂_∞ ⊗ W^la = W | holds | API |
| 11.10 API | trivial torsor; K_∞ = K(μ_{p^∞}) | all Sen operators 0; K^HT = GSpec(K(μ_{p^∞}))/Γ^la, θ^arith dual to the identity | holds | API |
| 12.1 API | identity; origin of the disc; A¹ → point | Δ-!-able; L = ℚ_p[1], f^{Div¹} 0-affine; diagonal 0-affine | holds | API |

## For the maintainer

- No target id, section number, gap slug or Lean name of this roadmap was renamed or removed. No other roadmap cites the changed sections; AnalyticStacks cites only this roadmap's gap slugs.
- New plan names:
  - 75 API entries, one per new README bullet, named in the namespace of their target (for example `TauCeti.GelfandStack.tangentComplex_fibreSequence` and `TauCeti.Decompletion.epsTors_baseChange`);
  - the test `tangent_overconvergentLine` (4.8).
- Pre-existing, and left unchanged:
  - The plan test names `proper_identity` (2.2 and 12.4) and `HT_perfectoid` (8.3 and 9.1) each occur twice.
  - X^{Div¹/𝒳}, the relative twistor stack over a perfect prism, is used in 9.2 and in the relative versions of 9.4 but is never written out. ALRS Definition 4.1.8 (ALRS line 3048–3057) defines it "similarly" to Y^{Δ/𝒳}, which 8.2 states.
- The Gestalten contracts still have no owner. That is a board decision, recorded in earlier rounds.
- No suspicious instructions were found in the review text.
