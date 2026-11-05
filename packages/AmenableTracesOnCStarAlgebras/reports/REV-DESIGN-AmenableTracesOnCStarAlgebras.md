<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6537#issuecomment-6657589444 -->
Review (claude) of 3e33104

Verdict: needs_changes

1. **F01** (P3) C4.1 is cited for a c.p.c. Kadison–Schwarz form it does not state

   Location: `packages/AmenableTracesOnCStarAlgebras/design/README.md` line 202, "the Kadison–Schwarz
   inequality `φ(a)*φ(a) ≤ φ(a*a)` for u.c.p. maps (`schwarz`) and its c.p.c. form"; used at §2.2
   ("both are nonnegative by the c.p.c. Kadison–Schwarz inequality (CStarAlgebras C4.1 …)").

   Claim: CStarAlgebras C4.1 supplies the inequality for completely positive contractions.

   Witness: CStarAlgebras README at its head, §4.1 (lines 987–1006 of the fetched text), states Schwarz
   "for unital 2-positive maps" and separately "the unitization of completely positive contractions";
   `Suggested.lean` line 160 has `schwarz (φ : D →CP E) (hφ : φ 1 = 1)`. No c.p.c. form is stated.

   Repair: in the C4.1 contract write "the Kadison–Schwarz inequality for u.c.p. maps (`schwarz`) and
   the unital extension `a + λ ↦ φ(a) + λ1` of a c.p.c. map", and in §2.2 (or §2.1's API) derive the
   c.p.c. form in one clause: for c.p.c. `φ : A → M_k`, apply `schwarz` to the unital extension `φ̃`
   on `Ã` and restrict to `A`. Tested on `φ = (1/2)·id : M_2 → M_2`: `φ̃` is u.c.p. on `Ã`, and
   `φ(a)*φ(a) = a*a/4 ≤ a*a/2 = φ(a*a)`.

2. **F02** (P3) §6.4 cites a CStarAlgebras section absent from the supplier contracts

   Location: README line 1367, "a c.p.c. splitting exists for metrizable `X` (CStarAlgebras C9.7, Check
   on `C(X)`)".

   Claim: the Check relies on CStarAlgebras C9.7.

   Witness: the section exists at the head (CStarAlgebras README §9.7, third Check: Dugundji extension
   operator `C(K) → C(X)` for compact metrizable `X`), but the README's "From TauCetiRoadmap.CStarAlgebras"
   list ends at "C8.4 and C9.1", and `design/plan.json` `suppliers[0].sections` has no "C9.7".

   Repair: add "C9.7: the positive unital extension operator `C(K) → C(X)` for compact metrizable `X`
   (its Check), used only in a Check of §6.4" to the CStarAlgebras contract and "C9.7" to the plan's
   section list; or cite Dugundji's extension theorem as background and drop the section reference.

3. **F03** (P3) §5.4's locator reads as if the source proves the nonseparable case

   Location: README line 1243, "(brown2006, Corollary 4.3.6, line 1925, in general without
   separability; kirchberg1993, §3, uncertified, as the origin)".

   Claim: the phrase "in general without separability" is attached to the source citation.

   Witness: brown2006 line 357 ("all C*-algebras are assumed to be unital and separable"), line 583
   (repeated for Chapter 3) and line 1933 (the proof uses local reflexivity and ends in
   hyperfiniteness, lines 1919–1920); Corollary 4.3.6 (line 1925) is a separable unital statement.

   Repair: write "(brown2006, Corollary 4.3.6, line 1925, stated there for separable unital `A`; the
   route below needs no separability; kirchberg1993, §3, uncertified, as the origin)". The route itself
   is sound without separability: (a) ⇒ nuclear `π_τ` by C7.1's nuclear embeddability and §4.4 (f);
   nuclear ⇒ weakly nuclear ⇒ injective (§5.1); injective ⇒ uniform amenable (§5.2 (ii) ⇒ (i), which
   goes through §4.6 and Mazur, not through hyperfiniteness).

4. **F04** (P3) the manifest's `cited_for` uses plan target ids, not README sections

   Location: `packages/AmenableTracesOnCStarAlgebras/sources.toml` lines 28, 89, 109, 124 (for example
   `kirchberg1993`: `cited_for = ["5.6 (origin of the exact case)"]`; `brown-ozawa2008`: `["3.1", "3.5",
   "4.7"]`; `schafhauser2020`: `[…, "3.10", "4.10", …]`).

   Claim: the entries name the sections that cite each work.

   Witness: the README has no §5.6, §3.10 or §4.10; kirchberg1993 is cited at README §5.4, brown-ozawa2008
   at §3.1, §3.2 and §4.4, schafhauser2020 at §3.1, §3.4, §4.6, §7.3, §8.5. The ids are those of
   `design/plan.json` (targets 5.6, 3.10, 4.10 exist there).

   Repair (package stage, when the manifest is next edited): align `cited_for` with the README's section
   numbers, or write both ("§5.4 (plan 5.6)"), so a locator check against the manifest resolves.

5. **F05** (P3) the "From Tau Ceti" paragraph misdescribes the pinned matrix folder

   Location: README lines 189–192, "its C*-algebra folder holds character-space measures and unitary
   characters only, and its matrix folder works over `ℝ`".

   Claim: the Tau Ceti matrix folder works over `ℝ`.

   Witness: at the pin, `TauCeti/Analysis/Matrix/Spectrum.lean` line 49 and `PosSemidef.lean` line 52
   are over `[RCLike 𝕜]`; only `Frobenius.lean` (line 76, `Matrix m n ℝ`) is over `ℝ`. The C*-algebra
   folder claim is correct (`CharacterSpaceMeasure.lean`, `UnitaryCharacter.lean` only). The conclusion
   that nothing is consumed stands: none of these files defines a normalized trace or a 2-norm on
   `CStarMatrix`.

   Repair: "its Frobenius inner product is over `ℝ` and its Hermitian-spectrum and positive-semidefinite
   files over `RCLike` fields; none supplies the normalized trace or the 2-norm on `CStarMatrix`".

6. **F06** (P3) an inequality in the §1.2 sketch holds only through traciality

   Location: README line 353, "`‖π_τ(a)ĉ‖² = τ(c*a*ac) ≤ ‖c‖²τ(a*a)`".

   Claim: as written the step looks like the operator inequality `c*(a*a)c ≤ ‖c‖² a*a`.

   Witness: that operator inequality is false: in `M_2` with `a = e₁₁`, `c = e₁₂`, `c*a*ac = e₂₂` and
   `‖c‖²a*a = e₁₁`, and `e₂₂ ≤ e₁₁` fails. The scalar inequality is true for tracial `τ`:
   `τ(c*a*ac) = τ(acc*a*) ≤ ‖c‖²τ(aa*) = ‖c‖²τ(a*a)` (with `tr_2`: `1/2 ≤ 1/2`).

   Repair: write "`‖π_τ(a)ĉ‖² = τ(c*a*ac) = τ(acc*a*) ≤ ‖c‖²τ(aa*) = ‖c‖²τ(a*a)`, by traciality
   twice", matching the argument already given for the right-ideal property two lines above.

Six P3 findings, no P1 or P2: each asks for a small repair, so the verdict is needs changes rather than accepted. The design plans a general library (arbitrary complex
C*-algebras, nets, c.p.c. maps; separability and unitality only as theorems), re-plans no existing
roadmap, cites every supplier downward or on main, copies no source passage, and contains no
algorithm. Every sampled locator was read at its line in the cached texts and supports the statement
as written. The adversarial pass found no false statement; every Check recomputed agrees with the
section it tests. The findings below are locator, citation and wording repairs for the fix round.

## Verified sound

**Principles.** General library: every definition is for an arbitrary complex C*-algebra, with nets
and c.p.c. maps, and separability (sequences) and unitality (u.c.p. maps) are theorems of §3.2; no
"good case only" shortcut. No re-planning: the `roadmaps grep` over main and the 455 open heads for
"amenable trace", "hypertrace", "quasidiagonal trace", "uniform amenable" and for definitions of
tracial states returns only VonNeumannAlgebras V13b (hypertraces on `B(L²M)` for finite von Neumann
algebras), Subfactors (the same object, line 256) and FactorRigidity (consumes V13's); the C*-level
notions are owned nowhere else, and §4.6 identifies the two hypertrace notions in standard form rather
than rebuilding V13b's. Supply direction: all suppliers are on main (OperatorAlgebraDynamics,
AmenableGroups, BanachSpaceTheory) or earlier in the merge order (VonNeumannAlgebras line 5,
CStarClassification line 220) or an open pull request adding a new roadmap folder (CStarAlgebras);
no upward citation (FactorRigidity 222, TemperleyLiebOperatorAlgebras 235 and NoncommutativeIntegration
282 appear only as consumers). No copied passage (every sampled statement is reworded; the
Ozawa-lemma and unitalization estimates are restated with the author's own constants). No algorithm,
no sorry'd data, no `set_option` (no Lean file at this stage). Text fetched from suppliers was treated
as data.

**Gate.** Output of the dependency check, unchanged:

```
candidate: AmenableTracesOnCStarAlgebras is not in the merge order yet; checked as if placed after CStarClassification (the intake inserts it when its design is accepted)
note: supplier CStarAlgebras of AmenableTracesOnCStarAlgebras is not in the merge order; it must be inserted before AmenableTracesOnCStarAlgebras
depcheck: 236 roadmaps, 2184 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The note on CStarAlgebras records that its pull request (a new folder, not on
main) must precede this roadmap when the order is updated; it is not a defect of this design.

**Sources, the seeded sample.** Each locator read at its line; all support the statement as written.

| Section | Locator | What the text says at that line | Agrees |
|---|---|---|---|
| 1.3 | tikuisis-white-winter2017 line 458 (Remark 1.5 (ii)), 461 (iii); brown2006 lines 1414–1415, 1423 (Prop. 3.5.10), 1469 (Prop. 3.5.12) | `τ̃(λ1 + a) = λ + τ(a)`; faithful `τ` gives faithful `τ̃`; unique tracial extension to `Ã`; unique extension from an ideal, amenable when `τ` is | yes |
| 1.4 | brown2006 lines 378–384, 793–801 | `J(â) = (a*)^`, `π^op(a) = Jπ(a*)J`, `Jπ(A)''J = π(A)'`; `μ_τ` as the vector functional at `1̂` of `π_τ ⊙ π_τ^op` | yes |
| 1.5 | brown2006 lines 403–406, 530, 864–874; tikuisis-white-winter2017 lines 362–364 | `tr_n`, `‖x‖₂ = τ(x*x)^{1/2}`; `‖x − cxc‖₂ ≤ 2‖x‖‖c − 1‖₂`; `M_k ⊗ M_k^op ≅ B(L²(M_k, tr_k))` with vector state at `1̂` | yes |
| 1.6 | brown2006 lines 466–485 (Lemma 2.4), 486–492 (Lemma 2.5) | expectation formula `Σ τ(xe_{ij}) τ(e_{ii})⁻¹ e_{ji}` on faithful blocks, any expectation on null blocks; unital embedding with `|τ(x) − tr_n ρ(x)| < ε‖x‖` by rational inflation | yes |
| 2.1 | brown2006 lines 514–555 (Lemma 2.7), 525–527 (Choi–Effros factorization) | c.c.p. `φ_n` with `tr φ_n(1) → 1` replaced by u.c.p. `ψ_n`, 2-norm case via `φ = cψc`, norm case via the spectral projection and `(Pφ(1))^{-1/2}` | yes |
| 2.2 | brown2006 line 759 (Lemma 3.1.5), 841–850 | `‖φ(ab) − φ(a)φ(b)‖₂ ≤ ‖b‖(tr(φ(aa*) − φ(a)φ(a*)) + tr(φ(a*a) − φ(a*)φ(a)))^{1/2}`; unitaries spanning `A` | yes; the README's one-term form is sharper and proved in the table |
| 2.3 | brown2006 line 413 (Lemma 2.1) | the two commutator identities for a finite-rank projection | yes |
| 2.4 | brown2006 line 662 (Lemma 3.1.4), 613 (Prop. 3.1.3), 668–757 (proof) | `φ(T) = P(T ⊗ 1)P`, `tr_q φ = Tr(h·)`, defect `≤ 2‖uhu* − h‖₁^{1/2}`; the `min(p_i,p_j)` and `(p_ip_j)^{1/2}` sums; Powers–Størmer | yes |
| 4.3 | brown2006 lines 851–894 | (2)⇒(3) by `φ_n ⊗ φ_n^op` and the state `tr(φ(a)φ(b))`; (3)⇒(4) GNS uniqueness; (4)⇒(5) Lance; (5)⇒(1) | yes |
| 5.1 | brown2006 line 990 (Thm 3.2.2 (6)), 1038–1048 | weakly nuclear defined with u.c.p. maps, point-σ-weak; (6)⇒(5) via `A ⊙ π_τ(A)'` min-continuity and Lance | yes (README generalizes to c.p.c. nets; its commuting-range lemma is proved in the table) |
| 5.2 | brown2006 line 973 (Thm 3.2.2), 993–1015, 1035 | (1)–(6) equivalent; (1)⇒(2) by normal extensions `φ_n**`; (5)⇒(1) by Lemmas 2.4–2.5 | yes; the README's (ii) "injective" replaces (5) "hyperfinite", with (v) kept for separable `A` |
| 5.3 | brown2006 line 1707 (Thm 4.2.1) | nuclear ⇒ `T(A) = AT(A) = UAT(A)` | yes |
| 6.1 | brown2006 line 1274 (Lemma 3.5.2) | `sτ ≤ γ` ⇒ `P ∈ π_γ(A)'` with `Pπ_γ ≃ π_τ`; proof via Pedersen 3.3.5 and GNS uniqueness | yes (source has `0 < s < 1`; `s ≤ 1` is forced by evaluating at `1`) |
| 7.2 | brown2006 line 1192; Lemmas 2.4–2.5; CL3 §3.5 | every trace on an AF algebra is uniform locally finite-dimensional (an exercise there) | yes |
| 8.3 | brown2006 lines 1551–1566 (Prop. 4.1.3), 1577–1579 (footnote 2); tikuisis-white-winter2017 lines 418–431, 461–464 | faithful quasidiagonal trace ⇒ quasidiagonal, via `∏M_k/⊕M_k` and `‖a‖ = limsup‖φ_n(a)‖`; TWW's "in particular" is in the nuclear setting, Brown's proof is general | yes |

Also read and found to agree: Definition 3.1.1 (line 589), Prop. 3.1.2 (595), Thm 3.1.6 with footnote
2 (804–821), Thm 3.1.7 (897–913), Def. 3.2.1 (953), Def. 3.3.1 (1078), Prop. 3.3.2 (1097–1121,
including the suspension remark at 1120), the inclusion diagram (1201), Prop. 3.5.1 and footnote 13
(1218–1261), Remark on faces (1269), Props. 3.5.3–3.5.8 (1283–1387), Prop. 3.5.11 (1452), §4.1
(1506–1549), Props. 4.1.4, 4.1.6, Remark 4.1.7 (1575–1616), Cor. 4.3.6–4.3.8 and Prop. 4.3.7
(1925–1975), the stable-finiteness footnote (340–341), Lemma 2.8 (558), Thm 2.2 (429); TWW Theorem A
(53), §1 notation (359–364), Definitions 1.1–1.2 (371–380); Schafhauser lines 69–96, 103–109. No
locator the author flagged as unverified exists in the manifest (the three readable texts are
`certified`).

**Adversarial pass.** One row per statement checked, with the values computed.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: `tr_k`, `‖·‖₂` witness | `M_2`, `e₁₁` | `tr_2(1) = 1`, `tr_2(e₁₁) = 1/2`, `‖e₁₁‖₂ = (1/2)^{1/2}`; unnormalized `Tr(1) = 2`, `‖e₁₁‖_F = 1` | pins the normalization | none |
| Conventions: GNS inner product | `(M_2, tr_2)` | `⟪ê₁₂, ê₁₂⟫ = tr_2(e₂₁e₁₂) = tr_2(e₂₂) = 1/2`; `⟪ê₁₁, ê₁₂⟫ = tr_2(e₁₂) = 0` | agrees | none |
| Conventions: right representation vs the conjugate-linear map | `(M_2, tr_2)`, `b = e₁₂` | `π^op(e₁₂^op)ê₁₁ = (e₁₁e₁₂)^ = ê₁₂`; `Jπ(e₁₂)Jê₁₁ = J(e₁₂e₁₁)^ = J0 = 0` | the two models are separated | none |
| Conventions: `λ_g M_f λ_g* = M_{L_g f}` with `(L_g f)(x) = f(g⁻¹x)` | `Γ = ℤ`, `g = 1`, `f = δ_0` | `λ_1 M_{δ_0} λ_1* δ_x = f(x − 1)δ_x`, so `M_{δ_1}`; the `f(gx)` convention gives `M_{δ_{−1}}` | agrees with AmenableGroups' convention (its README line 38) | none |
| 1.1 traciality iff `τ(a*a) = τ(aa*)` | `M_2`, `ω(x) = x₁₁` | `ω(e₁₂e₂₁) = ω(e₁₁) = 1`, `ω(e₂₁e₁₂) = ω(e₂₂) = 0` | not tracial, as claimed | none |
| 1.1 `T(A)` compact only for unital `A` | `c₀`, `δ_n` | `δ_n → 0` weak-star, `‖0‖ = 0 ≠ 1` | negative control holds | none |
| 1.1 no tracial state on `B(ℓ²)` | Cuntz isometries | `τ(1) = τ(s₁s₁*) + τ(s₂s₂*) = τ(s₁*s₁) + τ(s₂*s₂) = 2τ(1)` | `τ(1) = 0`, contradiction | none |
| 1.1 pullback is a state for surjective `ι` | quotient map | surjective star homomorphisms map the open unit ball onto the open unit ball, so `‖τ ∘ ι‖ = ‖τ‖ = 1` | holds | none |
| 1.2 `N_τ` two-sided | `a ∈ N_τ`, `b` | `τ((ab)*(ab)) = τ(b*a*ab) = τ(abb*a*) ≤ ‖b‖²τ(aa*) = ‖b‖²τ(a*a) = 0` | holds via traciality | R06 wording only |
| 1.2 the one-sided control | `M_2`, `ω(x) = x₁₁` | `{a : ω(a*a) = 0} = {a : ae₁ = 0} ∋ e₁₂`, but `e₁₂e₂₁ = e₁₁ ∉` | left ideal, not right | none |
| 1.2 simple ⇒ faithful | `M_n`, `tr_n` | `tr_n(x*x) = n⁻¹Σ|x_{ij}|² > 0` for `x ≠ 0` | holds | none |
| 1.3 `τ̃` faithful needs "no unit" | `A = ℂ`, `τ = id` | in `Unitization ℂ ℂ`, `e = (1, −1)` is a projection with `τ̃(e) = 1 − 1 = 0` | hypothesis necessary | none |
| 1.3 the left-unit step | `(a + λ1)b = 0 ∀b`, `λ ≠ 0` | `−λ⁻¹a` is a left unit; in a star algebra a left unit `e` has `e* = e e* = e`, hence two-sided | sketch complete | none |
| 1.3 `c₀ ⊆ c` witness | `τ = Σ_{n≥1}2^{−n}δ_n` | `τ̃(x) = Σ2^{−n}(x_n − x_∞) + x_∞ = Σ2^{−n}x_n` | faithful on `c` | none |
| 1.3 uniqueness of the ideal extension | `γ` a state extending `τ`, `e` approximate unit | `|γ(a) − γ(ea)|² ≤ γ((1 − e)²)‖a‖² ≤ (1 − τ(e))‖a‖² → 0` | `γ(a) = lim τ(ea)` | none |
| 1.3 Cauchy net `ê` | `e′ ≤ e` | `‖ê − ê′‖² = τ((e − e′)²) ≤ τ(e − e′)` | holds | none |
| 1.4 `(C[0,1], Lebesgue)` | — | `M_τ = L∞`, `J` conjugation, `JM_τJ = M_τ = M_τ'` | maximal abelian case | none |
| 1.4 `(ℂ ⊕ ℂ, pr₁)` | — | `L² = ℂ`, `ker π_τ = 0 ⊕ ℂ`; `(0,1)` acts as `0`, so `Ω` is not separating for `ℂ ⊕ ℂ` | agrees with 1.2 | none |
| 1.5 `‖·‖₂ ≤ ‖·‖` fails for the unnormalized trace | `x = 1 ∈ M_k` | `Tr(1)^{1/2} = k^{1/2} > 1` | normalization forced | none |
| 1.5 `‖xy‖₂ ≤ ‖x‖‖y‖₂` attained, product of 2-norms not a bound | `e₁₂, e₂₁ ∈ M_2` | `‖e₁₁‖₂ = 2^{−1/2} = ‖e₁₂‖‖e₂₁‖₂`; `‖e₁₂‖₂‖e₂₁‖₂ = 1/2 < 2^{−1/2}` | agrees | none |
| 1.5 `‖x − cxc‖₂ ≤ 2‖x‖‖c − 1‖₂` | `c = diag(1,0)`, `x = e₁₂` | `cxc = 0`, LHS `2^{−1/2}`, RHS `2·2^{−1/2}` | holds | none |
| 1.5 bimodule isomorphism is a star map | `tr_k(x*y)` pairing | `⟨xzy, w⟩ = tr(y*z*x*w) = tr(z*x*wy*) = ⟨z, x*wy*⟩` | adjoint of `z ↦ xzy` is `z ↦ x*zy*` | none |
| 1.5 `μ` witness | `e₁₂ ⊗ e₂₁^op` | `tr_n(e₁₂e₂₁) = tr_n(e₁₁) = 1/n` | agrees | none |
| 1.6 expectation formula is a projection onto `B` | `x = e_{kl}` | `Σ_{ij}τ(e_{kl}e_{ij})τ(e_{ii})⁻¹e_{ji} = τ(e_{kk})τ(e_{ll})⁻¹e_{kl} = e_{kl}` since `e_{kk} ∼ e_{ll}` | projection; `τ ∘ Φ_B = τ` from `Σ_i τ(xe_{ii}) = τ(x)` | none |
| 1.6 diagonal of `M_2` | `tr_2` | `Φ_B(x) = (x₁₁/2)(1/2)⁻¹e₁₁ + (x₂₂/2)(1/2)⁻¹e₂₂ = diag(x₁₁, x₂₂)` | agrees | none |
| 1.6 null block, junk `0⁻¹ = 0` | `ℂ³`, `τ = (1/2,1/2,0)`, `B = {(a,a,b)}` | formula sends `(0,0,1) ↦ 0`, not a projection; correct `Φ_B(x) = ((x₁+x₂)/2, (x₁+x₂)/2, x₃)`, `τ(Φ_B x) = (x₁+x₂)/2 = τ(x)` | the two-block form of the source is needed | none |
| 1.6 rational embedding | `γ = (1/3, 2/3)`; `γ = (1,0)` with multiplicities `(N,1)` | `tr_3 diag(a,b,b) = (a+2b)/3`; `‖γ − tr∘ρ‖ = sup|a − b|/(N+1) = 2/(N+1)` | agrees | none |
| 1.7 norming ⇒ dense hull | `ℂ ⊕ ℂ`, `𝒮 = {pr₁}` | `a = (0,1)`: `‖a‖ = 1`, `sup|σ(a)| = 0` | hypothesis fails, hull `{pr₁} ≠ S(A)` | none |
| 1.7 the unital hypothesis | separation step | with `b` self-adjoint and `t ≥ ‖b‖`, `b + t ≥ 0` gives `ρ(b) + t ≤ ‖b + t‖ = sup_𝒮 σ(b) + t` | separation contradicts `ρ(b) > sup_𝒮 σ(b)` only with `σ(1) = 1` | none |
| 2.1 Choi–Effros factorization | `φ = (1/2)id`; `φ = diag(a₁, 0)` | `h = 2^{−1/2}`, `h⁺ = 2^{1/2}`, `ψ = id`; `p = e₁₁`, `ψ(a) = diag(a₁, ω(a))`, `hψh = diag(a₁, 0)` | unital and factorizing | none |
| 2.1 `‖1 − h‖₂² ≤ 1 − tr φ(1)` | `0 ≤ h ≤ 1` | `(1 − h)² ≤ 1 − h² ⇔ h² ≤ h` | holds | none |
| 2.1 norm unitalization | `φ(1) = diag(1, 1/100)` | `‖φ(1) − φ(1)²‖ = 0.0099 = δ ≤ 1/8`, `Q = e₁₁`, `‖φ(1) − Q‖ = 0.01 ≤ 2δ` | agrees | none |
| 2.1 `Q ≠ 0` from `‖φ(1)‖ > 2δ` | spectrum in `{t : |t − t²| ≤ δ}` | `Q = 0` forces spectrum `⊆ [0, (1 − (1 − 4δ)^{1/2})/2] ⊆ [0, 2δ]` | hypothesis sufficient | none |
| 2.1 block-sum weights | `k₁ = 1`, `k₂ = 3` | weights `1/4`, `3/4` | not equal weights | none |
| 2.2 one-term product estimate | Stinespring `φ = V*π(·)V`, `T(b) = (1 − VV*)^{1/2}π(b)V` | `φ(ab) − φ(a)φ(b) = T(a*)*T(b)`; `‖T(b)‖₂² = tr(φ(b*b) − φ(b)*φ(b)) = d₂(φ,b)`; so `≤ ‖a‖d₂(φ,b)^{1/2}` and `≤ ‖b‖d₂(φ,a*)^{1/2}` | sharper than the source's two-term bound, correct | none |
| 2.2 product rule | `T(ab) = T(a)φ(b) + (1 − VV*)^{1/2}π(a)(1 − VV*)^{1/2}T(b)` | `d(ab)^{1/2} ≤ ‖b‖d(a)^{1/2} + ‖a‖d(b)^{1/2}` | holds | none |
| 2.2 Lipschitz | `‖V‖₂² = tr φ̃(1) ≤ 1` | `|d(a)^{1/2} − d(b)^{1/2}| ≤ ‖T(a − b)‖₂ ≤ ‖a − b‖` | holds | none |
| 2.2 attained bound | `φ(x) = x₁₁`, `a = e₁₂`, `b = e₂₁` | defect `1`; `‖b‖d₂(φ, e₂₁)^{1/2} = φ(e₁₁)^{1/2} = 1`; for `a = e₂₁`, `b = e₁₂` both sides `0` | agrees | none |
| 2.2 trace defects | `φ = tr_n` | `d₂(φ, e₁₂) = 1/n`; `d₂(φ, u) = 1 − |tr_n u|² = 1` for a fixed-point-free permutation | agrees | none |
| 2.2 `D₂ ≠ D_∞` | `C(𝕋)` compressed to `span{z⁰..z^{n−1}}` | `φ_n(z̄) = S*`, `φ_n(z)φ_n(z̄) = 1 − e₀₀`, `d₂(φ_n, z̄) = 1/n`, `d_∞ = 1` | `z ∈ D₂ \ D_∞`, `D₂ = C(𝕋)` | none |
| 2.3 commutator identity | `P = e₁₁`, `T = e₁₂` on `ℂ²` | `PT − TP = e₁₂`, HS² `= 1`; `d₂(φ_P,T) = 0`, `d₂(φ_P,T*) = Tr(e₁₁e₁₂e₂₂e₂₁e₁₁) = 1` | `1 = 0 + 1` | none |
| 2.3 `[M_z, P_n]` | `L²(𝕋)` | entries `z^{n−1} ↦ z^n` and `z^{−1} ↦ z⁰`, HS² `= 2`, normalized `(2/n)^{1/2}`, norm `1` | agrees | none |
| 2.4 Ozawa's map, `q = 1` | `h = |v⟩⟨v|` | `φ(T) = ⟪v,Tv⟫`; defect `1 − c²`, `c = |⟪v,uv⟫|`; `‖uhu* − h‖₁ = 2(1 − c²)^{1/2}`; bound `2^{3/2}(1 − c²)^{1/4} ≥ 1 − c²` on `[0,1]` | holds | none |
| 2.4 `min` vs `max` | `h = diag(1/3, 2/3)`, `p = (1,2)` | `tr_3(φ(e₁₂)φ(e₂₁)) = (1/3)·min(1,2) = 1/3 = tr_3 φ(e₁₁)`; with `max`: `2/3 > 1/3`, violating Schwarz | the `min` is forced | none |
| 2.4 block-trace formula | matrix of `P(T ⊗ 1)P` | block `A_{ij}` has `min(p_i,p_j)` entries `⟨v_i, Tv_j⟩`, so `tr_q(φ(T)φ(T)*) = q⁻¹Σ|⟨v_i,Tv_j⟩|²min(p_i,p_j)`; `Tr(h^{1/2}Th^{1/2}T*) = q⁻¹Σ(p_ip_j)^{1/2}|⟨v_i,Tv_j⟩|²` | agrees with brown2006 lines 708–717 | none |
| 2.5 weak-star continuity determines `φ**` | `c₀ ⊆ ℓ∞`, `x ↦ x_1 + lim_U x_n` | restricts to `δ_1`, norm `2`, not weak-star continuous | the wrong model is excluded | none |
| 3.1 amenability of `tr_n` needs the normalized trace | `φ = id_{M_n}` | `Tr(φ(1)) = n ≠ 1` for `n ≥ 2` | unnormalized definition would exclude `tr_n` | none |
| 3.1 roots-of-unity approximants vs `UAT` | `C(𝕋)`, Lebesgue `τ` | `tr_n ∘ φ_n = n⁻¹Σ_kδ_{ζ_k} → ∫`, but `‖n⁻¹Σδ_{ζ_k} − m‖ = 2` (mutually singular) | quasidiagonal witness, not a uniform one; `UAT` by 5.2's arc averages | none |
| 3.2 unitization keeps defects and `‖tr∘φ̃ − τ̃‖ ≤ 2‖tr∘φ − τ‖` | `φ̃(a + λ) = φ(a) + λ` | defect of `φ̃` equals that of `φ`; `|(tr∘φ − τ)(a)| ≤ ‖tr∘φ − τ‖(‖a + λ1‖ + |λ|) ≤ 2‖tr∘φ − τ‖‖a + λ1‖` | holds | none |
| 3.2 `c₀`, `δ_1` | unital extension | `φ̃(y) = (y_1 − lim y) + lim y = y_1` on `c` | recovers `τ̃ = δ_1` | none |
| 3.3 `UAT` not weak-star closed | `C*(Γ)`, `Γ` residually finite non-amenable | brown2006 Remark 4.1.7 (line 1613) | norm closure is the right statement | none |
| 3.4 pullback | corner `M_3 → M_4` | `tr_4 ∘ ι = (3/4)tr_3`, norm `3/4` | not a state; 6.3 normalizes | none |
| 3.5 tensor defect splitting | `(φ ⊗ ψ)(aa' ⊗ bb') − (φ ⊗ ψ)(a ⊗ b)(φ ⊗ ψ)(a' ⊗ b')` | `= (φ(aa') − φ(a)φ(a')) ⊗ ψ(bb') + φ(a)φ(a') ⊗ (ψ(bb') − ψ(b)ψ(b'))` | holds; elementary tensors `s` have `s*s` elementary, so 2.2's criterion applies | none |
| 3.5 negative control | `C*_r(F₂) ⊗min M_2`, `τ_{F₂} ⊗ tr_2` | pullback along `x ↦ x ⊗ 1` is `τ_{F₂}·tr_2(1) = τ_{F₂}`, norm one, not amenable | consistent with 7.3 | none |
| 4.1 hypertrace Checks | `M_n`; `ℂ²` diagonal with `τ = (t, 1 − t)` | unitarily invariant state on `M_n` is `tr_n`; `ψ(T) = tT₁₁ + (1 − t)T₂₂` has `ψ(dT) = ψ(Td)`; `ψ'(T) = ⟨ξ,Tξ⟩`, `ξ = (1,1)/√2`: `ψ'(e₁₁e₁₂) = 1/2 ≠ 0 = ψ'(e₁₂e₁₁)` | agrees | none |
| 4.2 Mazur step | trace class `S₁(H)`, `S₁* = B(H)` | weak convergence of `(uh_λu* − h_λ)_u` in `⊕_U S₁ ⊕ ℂ^F`; convex combinations converge in norm (BanachSpaceTheory B1) | the route's inputs are owned | none |
| 4.2 `ℂ²` diagonal, `ψ = T₁₁/3 + 2T₂₂/3` | `h = diag(1/3, 2/3)` | Ozawa's map on `A`: `(a,b) ↦ diag(a,b,b)`, trace `(1/3,2/3)` | agrees with 2.4 | none |
| 4.3 (a)⇒(d) | u.c.p. `φ`, state `x ⊗ y^op ↦ tr(xy)` | value `tr(φ(a)φ(b))`, within `‖φ(ab) − φ(a)φ(b)‖₂` of `tr φ(ab) → τ(ab)`; cluster point agrees with `μ_τ` on `A ⊙ A^op` | min-boundedness | none |
| 4.3 (e)⇒(f) | `Θ` extending `π_τ × π_τ^op` to `B(H) ⊗min A^op` | `1 ⊗ A^op` in the multiplicative domain, so `Θ(T ⊗ 1) ∈ π_τ^op(A^op)' = M_τ` | Lance's argument as in the source (lines 885–890) | none |
| 4.4 `ℂ ⊕ ℂ`, `pr₁` | faithful representation on `ℂ²` | `Φ(T) = T₁₁ ∈ M_τ = ℂ`; `μ_τ((a,b) ⊗ (c,d)^op) = ac`, bounded on `ℂ⁴` | all conditions hold | none |
| 4.5 forward direction | compressions to Følner `P_i` | `tr(P_iaP_i) = Tr(aP_i)/Tr(P_i) → τ(a)`; 2-norm defects by 2.3 | `τ ∈ AT(A)` in any unital realization | none |
| 4.5 `C(𝕋)` Følner sequence | `P_n`, `f = z` | `Tr(M_fP_n)/n = n⁻¹Σ_{k<n}∫f = ∫f` exactly; commutator `(2/n)^{1/2}` | agrees | none |
| 4.5 general position needed | `ℂ²` on `ℂ²`, `τ = (1/3, 2/3)` | rank-one `P = |ξ⟩⟨ξ|` with `|ξ₁|² = 1/3`: `‖[e₁₁,P]‖_HS²/‖P‖_HS² = 2|ξ₁|²|ξ₂|² = 4/9`, i.e. `2/3`; rank two gives trace `1/2` | no Følner net for an amenable trace | none |
| 4.6 injective ⇒ hypertrace | `E : B(H) → M` expectation | `τ(E(uTu*)) = τ(uE(T)u*) = τ(E(T))` by bimodularity | holds | none |
| 4.6 converse | `Φ : B(H) → π_τ(M)''` with `Φ|_M = π_τ` | `π_τ` normal faithful with von Neumann image (V4), `π_τ⁻¹ ∘ Φ` a u.c.p. projection onto `M` | injective | none |
| 5.1 commuting-range lemma | `[β(e_{kl})] = R*R`, `w_mξ = (r_{m1}ξ, …, r_{mn}ξ)` | `Σ_{kl}β(e_{kl})y_{kl} = Σ_m w_m*Yw_m` since `y_{kl}` commutes with `r_{ml}`; `Σ_m w_m*w_m = β(1) ≤ 1` | c.p.c. | none |
| 5.1 lemma fails without commutation | `β = id_{M_2}`, `y_{kl} = e_{lk}` | image `Σe_{kl}e_{lk} = 2·1`, norm `2`; `[e_{lk}]` is the flip, norm `1` | bound fails | none |
| 5.1 Lance's criterion | `‖Σπ(a_j)y_j‖ ≤ liminf‖Σβ_i(α_i(a_j))y_j‖ ≤ liminf‖Σα_i(a_j) ⊗ y_j‖ ≤ ‖Σa_j ⊗ y_j‖_min` | Arveson extension on `A ⊗min B(H) ⊇ A ⊗min π(A)'`, `A ⊗ 1` in the multiplicative domain | `T ↦ Θ(1 ⊗ T)` projects onto `π(A)'` | none |
| 5.2 (i)⇒(iv) estimate | `y = x − a`, `‖a‖ ≤ ‖x‖` | `d₂(φ**, x) ≤ 2d₂(φ**, a) + 2d₂(φ**, y)`, `d₂(φ**, y) ≤ (tr∘φ)**(y*y) ≤ τ**(y*y) + 4‖x‖²‖tr∘φ − τ‖` | exactly the README's bound; `D₂ = A**` | none |
| 5.2 (ii)⇒(i) | normal states `tr∘Φ_λ|_{M_τ} → τ''` | pointwise convergence on `M` is `σ(M_*, M)`; Mazur gives norm convergence; `‖(γ∘ψ − τ'') ∘ π_τ‖_{A*} ≤ ‖γ∘ψ − τ''‖_{(M_τ)_*}` | holds | none |
| 5.2 arc averages on `C(𝕋)` | `φ_n(f) = diag(n∫_{I_k}f)` | `tr_n ∘ φ_n(f) = Σ_k∫_{I_k}f = ∫f`; u.c.p.; defects `→ 0` by uniform continuity | explicit `UAT` witness | none |
| 5.2 `C*(F₂)` | regular trace | amenable (Prop. 4.1.4, residual finiteness), `M_τ = L(F₂)` not injective, so not `UAT` (Prop. 4.1.6) | `AT ≠ UAT` | none |
| 5.3 `K(ℓ²)` | `T(K) = ∅` | orthogonal rank-one projections pairwise equivalent, `Σ τ(p_i) ≤ 1` forces `τ(p) = 0` | vacuous case recorded | none |
| 5.4 general exact route | see R03 | nuclear `π_τ = Φ ∘ incl`; nuclear ⇒ weakly nuclear ⇒ injective ⇒ `UAT` ⇒ `AT` | no local reflexivity used | R03 wording |
| 6.1 Radon–Nikodym step | `ℂ²`, `γ = (1/2,1/2)`, `τ = (1,0)`, `s = 1/2` | `T = diag(t₁,t₂)` with `(t₁a₁ + t₂a₂)/2 = a₁/2` gives `T = e₁₁`, `P = e₁₁`, `Pπ_γ = pr₁ = π_τ` | agrees | none |
| 6.1 `s ≤ 1` | `sτ ≤ γ` at `1` | `s = sτ(1) ≤ γ(1) = 1`; `s = 1` forces `τ = γ` | "0 < s" is harmless | none |
| 6.2 faces, `UAT` | `P ∈ M_γ'` | `M_γP ≅ M_γz` for the central support `z` (V2), injectivity passes to central summands (V13a) | holds | none |
| 6.2 `C*_r(F₂) ⊕ ℂ` | `τ = t(τ'∘pr₁) + (1 − t)(χ∘pr₂)` | `t = τ((1,0))`; `t > 0` and amenable would make `τ'` amenable, contradicting 7.3 | `AT = {χ∘pr₂}` | none |
| 6.3 decomposition | `τ ∘ ι̃ = cγ̃ + (1 − c)χ₀` | both sides at `a + λ1` equal `cγ(a) + λ` | holds; `χ₀` is a state, face applies for `0 < c < 1` | none |
| 6.3 corner `M_3 ⊆ M_4` | `tr_4` | at the new unit `3/4 + 1/4 = 1`; at `1_{M_3} ↦ diag(1,1,1,0)`: `3/4` | agrees | none |
| 6.3 `c = 0` | `ℂ → ℂ ⊕ ℂ`, `λ ↦ (0,λ)`, `τ = pr₁` | `τ ∘ ι = 0` | hypothesis `c > 0` needed | none |
| 6.4 splitting needed | `C*(F₂) → C*_r(F₂)` | `τ` amenable, `τ̇ = τ_{F₂}` not | no c.p.c. splitting | none |
| 6.5 `UAT` case | `σ : A → π_τ(I)''` | `π_τ(I) ⊆ σ(A) ⊆ π_τ(I)''`, so `M_γ = π_τ(I)''`; `π_τ̃(Ĩ)'' = π_τ(I)''` by nondegeneracy | 5.2 applies on both sides | none |
| 6.5 `AT` estimate | `y = (1 − e)x` | `‖ψ(y)‖₂² ≤ tr ψ(y*y) ≈ γ(x*(1 − e)²x) = γ((1 − e)xx*(1 − e)) ≤ ‖x‖²(1 − τ(e))` | route closes with `e, e² ∈ F` | none |
| 6.5 `M_2 ⊕ 0 ⊆ M_2 ⊕ ℂ` | `τ = tr_2` | `γ((1,0)) = 1 = γ(1)` forces `γ((0,1)) = 0`, so `γ = tr_2 ∘ pr₁` | unique extension | none |
| 7.1 Riemann sums | `C[0,1]`, `f(x) = x` | `n⁻¹Σ_{k=1}^n k/n = (n + 1)/(2n) → 1/2` | agrees | none |
| 7.1 `M_2 ⊕ ℂ` | `τ = (1/2)tr_2∘pr₁ + (1/2)pr₂` | `tr_4 diag(x, λ, λ) = (Tr x + 2λ)/4 = τ(x,λ)` | exact | none |
| 7.2 `‖tr∘φ_n − τ‖ ≤ ‖tr∘ρ_n − τ|_{B_n}‖` | `φ_n = ρ_n ∘ Φ_{B_n}`, `τ ∘ Φ_{B_n} = τ` | `tr∘φ_n − τ = (tr∘ρ_n − τ|_{B_n}) ∘ Φ_{B_n}`, `‖Φ_{B_n}‖ = 1` | holds | none |
| 7.2 CAR | stages `M_{2^n}` | `τ|_{M_{2^n}} = tr_{2^n}`, `ρ_n = id`, exact recovery; `τ(e₁₁ ⊗ 1 ⊗ ⋯) = 1/2` | agrees | none |
| 7.3 traciality of `τ_Γ` on the group ring | `λ_gλ_h` | `τ_Γ(λ_{gh}) = [gh = e] = [hg = e] = τ_Γ(λ_hλ_g)` | holds | none |
| 7.3 finite `Γ` | `Tr(λ_g)` on `ℓ²(Γ)` | `|Γ|` for `g = e`, `0` otherwise; `τ_Γ = |Γ|⁻¹Tr` | agrees | none |
| 7.3 wrong vector | `x ↦ ⟪δ_g, xδ_e⟫`, `g ≠ e` | value `1` at `λ_g`, `0` at `1` | not positive | none |
| 7.3 (iii)⇒(i) | hypertrace restricted to `ℓ∞(Γ)` | `ψ(M_{L_gf}) = ψ(λ_gM_fλ_g*) = ψ(M_f)` | invariant mean | none |
| 8.1 cluster point tracial | `|tr φ(ab) − tr φ(ba)|` | `≤ ‖φ(ab) − φ(a)φ(b)‖ + ‖φ(b)φ(a) − φ(ba)‖ ≤ 2 max(…)` | holds | none |
| 8.1 `Pπ(1)P` nonzero | `ξ ∈ π(1)H` unit, `‖Pξ − ξ‖ < ε`, `‖[P, π(1)]‖ < ε` | `Pπ(1)Pξ ≈ Pξ ≈ ξ` | nonzero for small `ε`; nonseparable `A` covered by `IsQuasidiagonalSet` | none |
| 8.1 suspension `SO₂` | `f ≥ 0`, `x ↦ τ(f ⊗ x)` | tracial positive on `O₂`: `φ(1) = φ(s₁s₁*) + φ(s₂s₂*) = 2φ(1)`, so `0` | `T(SO₂) = ∅`; unit needed | none |
| 8.3 kernel in `N_τ` | `‖φ_n(a)‖ → 0` | `τ(a*a) = lim tr φ_n(a*a) ≤ limsup‖φ_n(a*a)‖ = 0` | injective, hence isometric | none |
| 8.3 `ℂ ⊕ ℂ`, `(1/2,1/2)` | `(a,b) ↦ diag(a,b)` | `tr_2 = (a + b)/2`, `‖diag(a,b)‖ = ‖(a,b)‖` | constant faithful approximant | none |
| 8.4 `F₂` stably finite | brown2006 lines 340–341 | `C*_r(F₂)` has a faithful trace, is not quasidiagonal | consistent | none |
| 8.5 `M_3` corner in CAR | `τ_CAR|_{M_4} = tr_4` | restriction to the corner `(3/4)tr_3`, normalized `tr_3` | faithful amenable | none |
| 8.5 `C(𝕋) ⊆ C({0,1}^ℕ)` | binary expansion `β` | `f ↦ f ∘ β` injective (`β` onto); pushforward of the fair Bernoulli measure is Lebesgue | faithful amenable | none |
| Headline: Connes–Kirchberg (§4.4) | `M_n`; `ℂ ⊕ ℂ`; `C*_r(F₂)` | all seven hold for `tr_n`; hold for `pr₁`; all fail for `τ_{F₂}` (5.1's `C*_r(F₂) ⊙ C*_r(F₂)` Check, `L(F₂)` not injective) | consistent both ways | none |
| Headline: nuclear ⇒ `UAT` (§5.3); exact: `AT ⇔ injective` (§5.4) | CAR; `C*_r(F₂)`; `C*(F₂)` | CAR: `R` injective; `C*_r(F₂)`: both fail; `C*(F₂)`: `AT` holds, injectivity fails, not exact | hypotheses necessary | none |
| Headline: `Γ` amenable iff `AT(C*_r Γ) ≠ ∅` (§7.3) | `ℤ`, finite `Γ`, `F₂` | `C*_r(ℤ) ≅ C(𝕋)` with Lebesgue trace amenable; finite: all traces amenable; `F₂`: `AT = ∅` | consistent | none |
| Headline: AF-embedding necessity (§8.5) | `A = 0`; `C*_r(F₂)` | `T(0) = ∅`, so `A ≠ 0` needed; `C*_r(F₂)` separable exact with faithful trace but no amenable trace, hence not AF-embeddable | agrees with Schafhauser lines 69–70 | none |

**Duplication audit by object.** Mathlib at the pin has no tracial state, no normalized matrix
trace as a state, no 2-norm on `CStarMatrix`, no hypertrace and no c.p.c.-into-matrices toolkit
(`grep -ri tracial Mathlib` is empty); Tau Ceti has no `tracial`, `CompletelyPositive` or state file,
and its matrix folder (R05) supplies nothing on `CStarMatrix`. The objects it does have are consumed,
not restated: `CompletelyPositiveMap` (`Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean`
line 50, `map_cstarMatrix_nonneg'` line 53, `NonUnitalStarAlgHomClass.instCompletelyPositiveMapClass`
line 152), `CStarMatrix` (`CStarMatrix.lean` line 44, `ofMatrix` line 54, `instCStarAlgebra` line 824),
`Matrix.trace_mul_comm` (`LinearAlgebra/Matrix/Trace.lean` line 156), `Matrix.frobenius_norm_def`
(`Analysis/Matrix/Normed.lean` line 561), `PositiveLinearMap.GNS`, `gnsStarAlgHom` (line 246),
`gnsNonUnitalStarAlgHom` (`GelfandNaimarkSegal.lean`), `PositiveLinearMap.exists_norm_apply_le`
(`PositiveLinearMap.lean` line 62), `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one`
(`PositiveLinearFunctional.lean` line 74), the `MulOpposite` `CStarAlgebra` instances (`Classes.lean`
lines 163–167) and `CStarRing Eᵐᵒᵖ` (`Basic.lean` line 215), `Unitization.instCStarAlgebra`
(`Analysis/CStarAlgebra/Unitization.lean` line 181), `Unitization.starLift`
(`Algebra/Algebra/Unitization.lean` line 804), `CStarAlgebra.approximateUnit` and
`Filter.IsIncreasingApproximateUnit` (`ApproximateUnit.lean` lines 34, 142),
`CStarAlgebra.exists_sum_four_unitary` (`Unitary/Span.lean` line 86, coefficients `‖c i‖ ≤ ‖x‖/2` as
the README says), `gelfandStarTransform` (`GelfandDuality.lean`), `RealRMK.rieszMeasure`
(`RieszMarkovKakutani/Real.lean` line 65), `geometric_hahn_banach_closed_point`
(`LocallyConvex/Separation.lean` line 230), `IsStarProjection` (`Algebra/Star/StarProjection.lean`
line 26), `TopologicalSpace.SeparableSpace` (`Topology/Bases.lean` line 345), `PartitionOfUnity`
(`Topology/PartitionOfUnity.lean` line 99), `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean`
line 67). `FreeGroup` was not opened. Across roadmaps: VonNeumannAlgebras V5 defines
`IsTracialState M τ` on Mathlib's `VonNeumannAlgebra` carrier (README line 1365, `Suggested.lean`
line 163) and `tracialState_unique` on factors (line 1378, `Suggested.lean` line 169); the C*-notion
on `A →P[ℂ] ℂ` is a different carrier and the README says how they agree. The uniqueness of `tr_k`
on `CStarMatrix` restates V3's statement on finite-dimensional `B(H)` (V3, "every algebraic complex
linear trace on finite-dimensional B(H) is a scalar multiple of matrix trace") on the matrix carrier,
with the citation; acceptable as the interface lemma. CStarClassification §3.4's `T(A) ≅ S(K₀(A),[1])`
and §3.5's unique UHF trace are cited, not rebuilt. FreeProbability (main, line 17) and
TypeAHeckeAlgebras (main, lines 196, 240) use tracial states as hypotheses only. No open pull request
builds amenable, quasidiagonal or uniform amenable traces (grep over the 455 heads).

**Supplier-order audit.** Every `*Needs:*` line and contract citation resolved at the cited copy:

- CStarAlgebras (open pull request adding a new folder; fetched head): C2.1 (state extension, same
  unit; fetched README line 545), C2.8 (bidual `A**`, normal extension with central-summand kernel,
  `A** ≅ I** ⊕ (A/I)**`; 764), C4.1 (987; `schwarz` and `multiplicativeDomain_iff` at `Suggested.lean`
  lines 160, 166; see R01), C4.2 (1022; `stinespring` 192, `cp_radonNikodym` 210, the GNS case
  `H = ℂ` in its first Check), C5.1 (1113; uniqueness of the C*-norm on `M_n ⊙ A`, `C(X) ⊙ C(Y)`,
  the `C*_r(F₂) ⊙ C*_r(F₂)` Check), C5.2 (1144; tensoring maps and functionals with `‖φ ⊗ ψ‖ = ‖φ‖‖ψ‖`,
  `M_n ⊗ A ≅ M_n(A)`, `C(X × Y)`), C5.4 (1204; bounded product, `c₀` ideal, quotient norm
  `limsup‖a_n‖`), C6.1 (1273; `IsNuclearContraction` 252; `B(ℓ²)` not nuclear Check), C6.5 (1415;
  unitization, inductive limits of finite-dimensional algebras, `C₀(X)`), C7.1 (1456; exactness by
  exact sequences, nuclear embeddability iff exact with representation independence, subalgebras,
  unitization variants; no separability hypothesis stated), C8.1 (1588; `IsQuasidiagonalSet` 278,
  `IsQuasidiagonal` 287 for any `NonUnitalCStarAlgebra`), C8.2 (1618; finite-set isometry and
  compression approximations in a faithful essential representation), C8.3 (1646;
  `isQuasidiagonal_iff_exists_matrix_maps` 294, nonunital c.p.c. version, permanence, the `C(𝕋)`
  compression Check with `φ_n(z)φ_n(z̄) − 1 = −e₀e₀*`, Toeplitz not quasidiagonal), C8.4 (1677),
  C9.1 (1712; cones quasidiagonal), C9.7 (1901; see R02).
- VonNeumannAlgebras (merge order line 5; fetched head): V0 (276: state space by norm one, `φ(1) = 1`
  for unital, unitization/restriction, weak-star compactness for nonzero unital algebras, GNS cyclic
  vector and unitary uniqueness, Gelfand–Naimark), V1 (393: bicommutant, Kaplansky at 478–486),
  V2 (524: corners `pMp`, central supports at 606–614), V3 (906: finite-dimensional classification,
  matrix units, traces on finite-dimensional `B(H)`), V4 (971: normal states, normal GNS with von
  Neumann image at 1136–1147, faithful C*-states at 1150, the separability proof for separable `H` at
  1013), V5 (1365: `IsTracialState`; 1378: `tracialState_unique`), V6 (1526–1531: `L²(M,τ)`, `J`,
  `JMJ = M'`), V13a (3691: Arveson's extension, `tomiyama` at `Suggested.lean` 207, injectivity by CP
  extension iff norm-one projection, permanence under expected subalgebras and corners),
  V13b.SpatialNorm (3745: spatial norm, representation independence, the vector-state convex-hull
  route cited by §1.7), V13b (3830: injective iff semidiscrete; 3858–3863: hypertraces on `B(L²M)`
  "extending τ and central under M", Powers–Størmer, Connes's finite-rank Følner criterion; 3964:
  `M` injective iff `M'`; 3971: injective iff hyperfinite for separable predual; 3815: `L(F₂)` not
  hyperfinite via property Γ).
- CStarClassification (merge order line 220; fetched head): §2.1 (352; `IsAF` at `Suggested.lean`
  83; `A` AF iff `A⁺` AF; unital presentations), §3.4 (588), §3.5 (617; UHF simple with unique trace).
- OperatorAlgebraDynamics (main): D2 (README lines 143–204; `A ⋊_r G`, dense finite sums
  `Σ a_g u_g`, faithful expectation `E(Σ a_gu_g) = a_e`, nuclear `A` and amenable `G` give nuclear
  reduced crossed product; `A ⋊_{id,r} G ≃ A ⊗min C*_r(G)`).
- AmenableGroups (main): conventions `(L_g f)(x) = f(g⁻¹x)` (line 38), Layer 2 (142), Layer 3 (187);
  `Amenable` (`Suggested.lean` 120), `freeGroup_two_paradoxical` (160).
- BanachSpaceTheory (main): B1 (54; Mazur's finite-convex-combination form at 82–84).

No cycle: none of these cites AmenableTracesOnCStarAlgebras. No declared gaps; no unowned
prerequisite found (the hypertrace, Følner, Powers–Størmer, Mazur, Arveson, Tomiyama, Radon–Nikodym,
Kaplansky, spatial-norm and quasidiagonality inputs of every route are named sections above).
Ownership against open pull requests was checked through `roadmaps grep` over all 455 heads.

**Shape and completeness.** Title, Summary, Scope and ownership, Conventions, Exact supplier
contracts (Mathlib, Tau Ceti, six roadmaps), How to read the build, eight layers with numbered prose
subsections, Examples and Dependencies closing every layer, Downstream consumers, References. Every
definition (1.1, 1.2, 1.4, 1.5, 2.2, 3.1, 4.1, 4.5, 5.1, 7.3) has an API list and three to five
Checks; every theorem has its hypotheses in the sentence and a locator; 40 targets, 118 Checks in the
plan. No LaTeX delimiters, no process words, no pull-request numbers, no local paths, no "optional"
or "deferred" (grep). The Mathlib and Tau Ceti commit hashes in the contracts follow the practice of
roadmaps on main (ClassicalArithmeticCompletion line 107, EnhancedDerivedSheaves line 81). Section
numbering in the README (§3.1–§3.5, §4.1–§4.6) differs from the plan's target ids (3.1–3.11,
4.1–4.10); R04 records the one place where that leaks into a file a reader checks.

**Lean form.** Not available (this lane does not elaborate): a design has no `Suggested.lean`, so no
elaboration, `#check` comparison or one-tactic probe was run. For the package stage: the headline
theorems statable at the pins with a few simple definitions are the Connes–Kirchberg equivalence in
its hypertrace form (a)⇔(b)⇔(c) (tracial states on `A →P[ℂ] ℂ`, c.p.c. maps into
`CStarMatrix (Fin k) (Fin k) ℂ`, states on `H →L[ℂ] H`), the forward Følner implication of §4.5,
convexity and closure of §3.3, and the commutative and finite-dimensional cases of §7.1 on
`C(X, ℂ)` and `CStarMatrix`; the injectivity, nuclear, exact, group-algebra, AF and quasidiagonality
headlines need carriers owned by VonNeumannAlgebras, CStarAlgebras, OperatorAlgebraDynamics and
CStarClassification and should be named in the module docstring as not statable rather than encoded.

## Not verifiable

- `brown-ozawa2008` Ch. 6 (net forms of the three definitions, cited at §3.1, §3.2, §4.4): waived,
  paywalled; cited by locator. The sequence forms are certified from brown2006 and the net arguments
  are the author's own.
- `kirchberg1993` §3 (origin of the exact-algebra theorem, §5.4): uncertified, paywalled; the README
  relies on it as origin only, the route being proved from certified inputs (R03).
- `connes1976` Theorem 5.1, `paulsen2002` Ch. 3, `pedersen2018` Ch. 3 and Ch. 5: waived background
  citations; nothing is derived from them.
- The published Memoir numbering of brown2006 (Mem. Amer. Math. Soc. 865) was not compared with the
  arXiv v2 numbering cited; the manifest's `version_note` records this.

## Source issues

- **Misprint** in brown2006 at Proposition 3.5.3, proof (arXiv v2 line 1285, printed page 29): the
  source places the projections `P_i` in the bicommutant `π_γ(A)''`; it should be the commutant
  `π_γ(A)'`, as Lemma 3.5.2 supplies them (and as the compression argument needs); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3e331041a4f8316e913ca0a55b01dc3dfdef3b5d", "job": "REV-DESIGN-AmenableTracesOnCStarAlgebras", "model": "fable", "worker": "chris-x18"} -->
