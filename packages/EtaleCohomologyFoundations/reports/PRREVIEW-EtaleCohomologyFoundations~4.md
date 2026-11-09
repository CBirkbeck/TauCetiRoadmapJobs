# Review of EtaleCohomologyFoundations (pull request #1891 at d9c5089)

**Verdict:** needs changes

Incremental re-review of the 18 lines changed since 39f37e1 (nine lines of the README; `Suggested.lean` is unchanged). Three findings: two blocking (P2), one P3. The gate passes, the dependency check is clean, the Lean file elaborates with six `sorry` warnings only. The two blocking findings are the two ownership conflicts of the previous report, which this head leaves exactly as they were: the comparison morphism `ν` is still built both here and in the open SchemeAndStackFoundations revision, and the pull-request description still says consumers are unaffected while WeilConjectures defines its own point count. The two P3 findings of the previous report (undeclared own names in backticks, cited works missing from the manifest) are repaired. The one changed locator (Milne's notes for the Künneth formula) points at a theorem that does not state the formula.

## R01 (P2) — The comparison morphism `ν` still has two open owners (previous R01, not repaired)

**Location.** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` line 11: "the comparison morphism `ν` from the small pro-étale to the small étale site, with the single change of coefficient universe, is constructed here in §F.4.3"; lines 1446–1460 (the `ν` block of §F.4.3). Pull-request description, merge-order paragraph: "depends on no open roadmap PR".

**Claim.** The open SchemeAndStackFoundations revision still builds the same object in its §2.10 at its current head: the inclusion `X.Etale ⥤ X.ProEt`, its continuity for the two Mathlib topologies, `ν_*` as `Functor.sheafPushforwardContinuous`, `ν^*` as `Functor.sheafPullback`, the adjunction, and the change of universe. Neither roadmap cites the other, and this description does not say which merges first or which drops its block. The revision's head moved since the previous review (16d66b3 → e053553) without removing the block, and nothing in this head's diff touches §F.4.3 or line 11.

**Witness.** SchemeAndStackFoundations at the #1656 head (e053553): `README.md` line 548 (supplier row "§2.10 / `Scheme.toProEt`, *Scheme.proetalePushforward* | `ν^* ⊣ ν_*`"), lines 4035–4075 ("The étale and pro-étale sites" block), `Suggested.lean` lines 515–524 (`Scheme.toProEt`, `Scheme.toProEt_isContinuous`). SchemeAndStackFoundations on main: `toProEt` occurs 0 times, so §2.10 on main cannot be cited for `ν` today.

**Repair.** Settle one owner, as before:
- **(a)** Delete the `ν` block of §F.4.3 (lines 1448–1470) and the clause of line 11; cite SchemeAndStackFoundations §2.10 (`Scheme.toProEt`, *Scheme.proetalePushforward*) for `ν`, `ν^* ⊣ ν_*` and the universe change, keeping here only the comparison of realizations through it (lines 1472–1478 and the `*Needs:*` lines 1518, 1554 then read "SchemeAndStackFoundations §2.10"); name that revision in the description's merge-order paragraph as one this pull request merges after.
- **(b)** Keep `ν` here and state in the merge-order paragraph that the SchemeAndStackFoundations revision drops its §2.10 `ν` block before merging, so that one owner remains.

Option (a) follows the earlier owner and this roadmap's own Scope sentence (line 11) that scheme sites belong to SchemeAndStackFoundations.

## R02 (P2) — The point count over `k_r` still has two owners, and the description says consumers are unaffected (previous R02, not repaired)

**Location.** README line 13 ("the count of points over the degree-`r` extension … is Scheme.Hom.pointCount of §F.10.1"); lines 1319–1340; line 39 (the row mapping `VanishingCycles.numberOfRationalPoints` to Tau Ceti's declaration). Pull-request description: "roadmaps citing EtaleCohomologyFoundations labels are unaffected, since no label changes".

**Claim.** WeilConjectures at its unchanged head still defines its own count on a universe-zero finite field and builds its zeta series from it, and its supplier row still cites `VanishingCycles.numberOfRationalPoints`, a name this pull request drops. This roadmap is the earlier owner (merge order line 42 against WeilConjectures' later position), so the README content is right; the description must say what the consumer changes instead of "unaffected". Nothing in this head's diff touches the description or §F.10.1.

**Witness.** WeilConjectures (#1208, head 029d8c2): `Suggested.lean` line 55 `def extensionPointCount {k : Type} [Field k] [Finite k] (p : ℕ) …`, line 63 `zetaSeries` built from it; `README.md` line 115 cites `VanishingCycles.numberOfRationalPoints`.

**Repair.** Replace "unaffected" in the description by the three changes WeilConjectures makes when it consumes this head: its `extensionPointCount` becomes Scheme.Hom.pointCount of §F.10.1; its model-independence statement becomes Scheme.Hom.pointCount_eq_numberOfRationalPoints; its citation of `VanishingCycles.numberOfRationalPoints` becomes Tau Ceti's `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints`, as line 39 already records. No README change is needed.

## R03 (P3) — The new Milne locator names a theorem that does not state the Künneth formula

**Location.** README line 1006 (§F.2.6): "(Stacks §59.97, Lemmas 59.97.6–59.97.9; SGA 4 XVII §5; Milne, Abelian Varieties, §12, Theorem 12.1.)", the one locator this head changes (from "§15").

**Claim.** Theorem 12.1 of Milne's notes states that `H¹(A_ét, ℤ_ℓ) ≅ Hom(T_ℓA, ℤ_ℓ)` and that cup product makes `H^r(A, ℤ_ℓ)` the exterior power of `H¹`, for an abelian variety over a separably closed field. The Künneth formula is not stated there; it is invoked once inside the proof, for coefficients `R` that are a field (`𝔽_ℓ` or `ℚ_ℓ`), to identify `H^*(A × A)` with `H^*(A) ⊗ H^*(A)`. The target of §F.2.6 is the derived Künneth isomorphism for all `K ∈ D(X,Λ)`, `L ∈ D(Y,Λ)` over a finite ring `Λ` killed by an invertible `n`, with Tor terms retained, so the only thing Milne's page supports is the field-coefficient special case as an application, and a reader opening Theorem 12.1 finds no Künneth statement. The two primary locators (Stacks 0F1P, SGA 4 XVII §5) carry the target.

**Witness.** `milne-av` lines 2290–2297 (the statement of Theorem 12.1, p. 55), line 2308 (the proof's sentence "which the Künneth formula shows to be an isomorphism when R is a field"); `milne-av` line 552 is the only Künneth statement in the notes, for singular cohomology of topological spaces (§2.2(b)).

**Repair.** Write "Milne, Abelian Varieties, §12, proof of Theorem 12.1, p. 55, which uses the formula with field coefficients for `A × A`" or drop the Milne locator; and align the manifest entry `milne-av` (`locator = "§12, Theorem 12.1, p. 55"`) with whichever is kept.

## Previous findings

- R01 — not repaired: README line 11 still reads "is constructed here in §F.4.3", the block at lines 1446–1470 still defines `ν`, `ν_*`, `ν^*` and the adjunction; SchemeAndStackFoundations #1656 at e053553 still builds them in §2.10.
- R02 — not repaired: the description still says "roadmaps citing EtaleCohomologyFoundations labels are unaffected"; WeilConjectures #1208 at 029d8c2 still has `extensionPointCount` (line 55) and cites `VanishingCycles.numberOfRationalPoints` (README line 115).
- R03 — repaired: lines 187, 409, 411, 1774 write "Scheme.IsInvertibleOn N X" / "n X" / "N X" / "n S" and lines 328, 330, 353, 371 write "EtalePath x y" / "x x" / "x y" without backticks; the only backticked own names left are the eight declarations (`nagataCompactification` ×5, `EtaleFundamentalGroup` ×10, `EtaleFundamentalGroup.map` ×9, `arithmeticExactSequence` ×3, the four `VanishingCycles.*` theorems); the gate's readme-ids check passes. No new problem introduced: the sentences read the same with the names in prose, as line 44 prescribes.
- R04 — repaired: `packages/EtaleCohomologyFoundations/sources.toml` now has 31 entries, 19 added since the previous head: stacks-0F41, stacks-0BND, stacks-0BMY, ddt-flt, bhkt, deligne-weil-i, deligne-weil-ii, juteau-2009, illusie-2006-vanishing, milne-av, bbd-faisceaux-pervers, ilo-travaux-de-gabber, sga7-ii, illusie-1994-monodromie (certified, in the cache) and ribet-1976, sga4, sga4-et-demi, sga5, huber-1996-etale, fujiwara-2002-purity (uncertified by locator). Every work the README cites by author now has a key; the `milne-av` locator follows the README's new locator (R03 above).

## Verified sound

### Scope of this re-review

The diff adds or changes nine README lines: 187 (§F.0.1 invertibility class), 328, 330, 353, 371 (§F.0.2 paths), 409, 411 (§F.0.3 twists), 1006 (§F.2.6 Künneth locator), 1774 (§0.11 smooth trace). Eight are formatting changes to names (previous R03) and leave the mathematics unchanged; one changes a locator. `Suggested.lean` is byte-identical to the file the previous review read (`git diff 39f37e1..d9c5089 -- TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` is empty), so its signatures, the one-tactic probe and the headline list of the previous report stand. No file outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder: empty). None of the fifteen seeded sample targets lies in a changed passage; their rows are carried from the previous report below. Ownership against open pull requests was re-checked for the two objects the previous findings name (`ν`, the point count) at the current heads of #1656 and #1208; the other open roadmaps of the previous report's ownership paragraph were not re-read, since no changed passage touches what they cite.

### Gate, dependency check, elaboration

- **Gate**, re-run at d9c5089: `gate EtaleCohomologyFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- **Dependency check** (`--movable`): `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean`: exit 0, six `declaration uses sorry` warnings (lines 76, 120, 138, 153, 166, 180), nothing else.
- **Signatures.** The worker's elaborated types of the eight declarations agree with the previous report's `#check` pass; no section binder dropped (quasi-compact, separably closed, invertibility, affine, connected geometric fibre and algebraic-closure hypotheses all present in the elaborated types). The file is unchanged, so no new `#check` run was needed.
- **Overlaps tool**: no other open pull request changes this roadmap; no cited id dropped by an open pull request; no id this pull request drops is cited elsewhere (the dropped `VanishingCycles.numberOfRationalPoints` is a Lean name, mapped at line 39, and is R02's subject).

### Adversarial table

New rows for the changed statements, then the previous report's rows for the untouched statements (marked "r3").

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| §F.2.6 Künneth, with the Milne locator (line 1006) | abelian variety `A` of dimension `g` over `k̄`, `R = 𝔽_ℓ`; `𝔸¹ × 𝔸¹` over `k̄` of characteristic `p`, `Λ = ℤ/p`; `Λ = ℤ/ℓ²` | `dim H^*(A) = 2^{2g}`, `dim H^*(A×A) = 2^{4g} = (2^{2g})²`, Milne's field-coefficient use (`milne-av` line 2308) agrees; `H¹(𝔸¹, ℤ/p) = k[t]/℘` infinite, so `H¹ ⊗ H¹ ≠ 0`, while `H²(𝔸², ℤ/p) = 0` (affine, `cd_p ≤ 1`): Künneth fails, and the hypothesis `n` invertible in `k` of line 988 excludes it; `ℤ/ℓ²` is a finite non-field ring the target admits with Tor terms and Milne's sentence does not | true; locator imprecise | R03 |
| §F.0.1 invertibility class (line 187) | `Spec ℤ[1/N]`; `Spec ℤ` with `p ∣ N`; `∅` | `N` a unit in every residue field `𝔽_p` (`p ∤ N`) and `ℚ`: holds; `N = 0` in `𝔽_p`: fails; vacuously true on `∅`. Same content as lines 50 and 54 | true | none (formatting only) |
| §F.0.2 paths (lines 328–371) | `X = Spec 𝔽_p`, `x = y = Spec 𝔽̄_p`; `S₁ ⊔ S₂` with `x ∈ S₁`, `y ∈ S₂` | EtalePath x x = underlying set of `Ẑ`, both actions simply transitive; no path (`isEmpty_fiber_iso_of_isClopen`) | true | none (formatting only) |
| §F.0.3 twists (lines 409–411) | `Λ = ℤ/12`, `N = 24`; `Λ = ℤ/p` on `Spec 𝔽_p` | `ℤ/12 ⊗_{ℤ/24} μ_24 = μ_24/μ_2 ≅ μ_12` by squaring, needing `6` invertible; `μ_p = 0` so `Λ(1) = 0` and the invertibility theorems do not apply | true | none (formatting only) |
| §0.11 smooth trace (line 1774) | `𝔸¹_ℂ ⊔ 𝔸¹_ℂ → Spec ℂ` | `R²f_!μ_n = (ℤ/n)²`, trace `= +`, kernel `≠ 0`; LRZ 6.1.1 (`lrz-relative-poincare` line 4217) | true | none (formatting only) |
| `nagataCompactification` (r3) | `A¹_k → Spec k`; line with doubled origin; `⊔_ℕ Spec k → Spec k`; identity | `P¹_k` exists; not separated, `[IsSeparated f]` fails; not quasi-compact, `[QuasiCompact f]` fails; identity compactification. Stacks 0F41: qcqs `S`, separated finite type `X → S` | true | none |
| `EtaleFundamentalGroup`, `.map` (r3) | `S = Spec K`, `x = Spec K^sep`; `S₁ ⊔ S₂`; `f = 𝟙 S` | `Aut(fiber x) ≃ₜ* Gal(K^sep/K)` (`galContinuousMulEquivAutFiber`); `FEt(S) ≃ FEt(S₁) × FEt(S₂)`, `map` an isomorphism; whiskering by `pullback (𝟙 S) ≅ 𝟭` is the identity | true | none |
| `arithmeticExactSequence` (r3) | `X = Spec k`; `𝔾_{m,ℚ}`; `Spec 𝔽_{p²}` over `𝔽_p` | `π₁(Spec k̄) = 1`, `π₁(Spec k) → Γ_k` iso; `Ẑ(1) → π₁ → Γ_ℚ` with section at `1`; two geometric points, not connected, excluded (`2Ẑ ↛ Ẑ`). SGA 1 IX 6.1 (`sga1` line 7736) | true | none |
| `etaleCohomologicalDimension` (r3) | `Spec k̄`; `P¹`, `ℤ/ℓ`; `∅`; `Spec 𝔽_q`; `A¹` char `p`, `ℤ/p` | `H^{≥1} = 0`; `H² = ℤ/ℓ` at `q = 2`, allowed, `H³ = 0`; `dim = ⊥`, `F(∅) = 0`; `H¹ = ℤ/ℓ` excluded by `IsSepClosed`; `(p : k) = 0` excludes | true | none |
| `affineArtinVanishing` (r3) | `A¹` char `p`, `ℤ/p`; `P¹`; `Spec ℝ`, `ℤ/2` | `H¹ = k[t]/℘ ≠ 0` at `q = 1 = dim`, `H² = 0`; `P¹` not affine, `H² ≠ 0`; `Spec ℝ` not separably closed, `Hⁱ = ℤ/2` for all `i`. Stacks 0F0V (`stacks-0F1P` line 9332) | true | none |
| `finite_H_constantSheaf` (r3) | `A¹` char `p`, `ℤ/p`; `𝔾_m/k̄`, `ℤ/ℓ`; `Spec ℚ`, `ℤ/2` | `H¹` infinite, excluded by `(p : k) = 0`; `H⁰ = H¹ = ℤ/ℓ`; `ℚ^×/ℚ^{×2}` infinite, excluded by `IsSepClosed` | true | none |
| `subsingleton_ellAdicCohomology` (r3) | `P¹`, `q = 2, 3`; `Spec 𝔽_p`; `∅` | `H² = ℤ_ℓ` allowed; `H³ = 0` (`lim¹` of finite groups `= 0`); `H¹ = ℤ_ℓ` excluded by `IsSepClosed`; `[IsEmpty X]` instance. BS 5.6.2 (`bhatt-scholze-proetale` line 1924) | true | none |
| §F.0.1 stalk Frobenius (r3) | `μ_5` over `𝔽_2` | geometric `ζ ↦ ζ³` (`2·3 ≡ 1 (5)`), arithmetic `ζ ↦ ζ²`; lines 294–298, 654–655 agree; Stacks 64.3 (`stacks-03SW` lines 154–184) | consistent | none |
| §F.0.1 toPointFunctor direction, Galois left action (r3) | `φ : (Ω₁,s₁) → (Ω₂,s₂)`; `σ, τ` | `P(s₂).fiber ⟶ P(s₁).fiber`, stalk `F_{s₂} → F_{s₁}`, contravariant as line 262; `Spec.map (σ∘τ) = Spec σ ≫ Spec τ` | true | none |
| §F.0.2 paths versus field isomorphisms (r3) | `Spec 𝔽̄_p`, `Spec Ω` with `Ω ⊃ 𝔽_p(t)` | fibre functors isomorphic; no field isomorphism (transcendence degree `0` vs `1`) | true | none |
| §F.0.A0 coordinates (r3) | `u ≡ 2 (5)` | `(ζ_5²)³ = ζ_5`, new coordinate `3 = 2⁻¹`; `c_{ζ^u} = [u⁻¹] ∘ c_ζ` | true | none |
| §F.0.A1 defect example (r3) | `A = 𝔽_2(u)[[t]]`, `α² − tα − u = 0` | other root `α + t`; residue `ᾱ² = u` inseparable degree 2; `e = 1`, `ef = 2`; `I = C₂`, orbit length `2 ≠ e` | true | none |
| §F.0.A2 sections and Weil group (r3) | `𝔾_{m,ℚ}`, `z² = t`; `Spec ℤ[i,1/2] → Spec ℤ[1/2]`, `p = 5, 7` | `s_1` trivial, `s_2` the character of `ℚ(√2)`, not conjugate; `5` splits, class trivial, `7` inert, class nontrivial | true | none |
| §0.6, §0.7, §0.8 (r3) | finitely many Postnikov maps; `P¹ = U ∪ V` swapped; `A¹_k`, `ℤ/ℓ` | 09YQ descent; `(1, −1)` sign negated; `H²_c = Λ(−1)` vs naive `⊕_{a∈k} Λ(−1)`; finite trace `T ↦ T²` at `0` is `2·value`, `r = 0` gives `0`. Stacks 0F7I–0F7L, 0G2A | true | none |
| §F.2.2 smooth base change (r3) | hypotheses | Stacks 0EYU (`stacks-0F1P` line 8188): `f` smooth, `g` qcqs, torsion orders invertible; line 850 identical | true | none |
| §F.2.3 ULA tensor (r3) | `f : 𝔸² → 𝔸¹`, `i_*𝔽_ℓ ⊗^L j_*𝔽_ℓ` | `Tor₁ = 0`, skyscraper at `(0,0)`, not locally acyclic; `j_*𝔽_ℓ` not locally constant, excluded | true | none |
| §F.2.6 Künneth, remaining Checks (r3) | geometric point; `K = ⊕_{i≥0} Λ[i]` | tensor unit; both sides `⊕ RΓ(Y,L)[i]` since `cd(Y) < ∞` (0F12 line 9514; 0F1P line 9935) | true | none |
| §F.2.7 projection formula (r3) | hypotheses | Stacks 0GL5 (`stacks-0F7H` line 2079): separated finite type `f`, qcqs, torsion `Λ`, no invertibility; line 1121 identical | true | none |
| §F.3, §F.3a (r3) | non-separated finite type `X`; `ℤ_(p)^h`; `𝔽_p(x)[t]^h`; `R[π^{1/2}]`, `p ≠ 2`; `𝔽̄_p[t]^h` | Čech induction; 09ED (`stacks-09ED` line 15538) surjectivity; `k(s̄) ⊋ k(s)^sep` algebraically closed; `t_ℓ|_{I′} = 2t′_ℓ`; `P ≠ 0`, `t_ℓ(P) = 0`; 0BU4–0BU8 (lines 15626–15764) | true | none |
| §F.4.0 lattices (r3) | `𝔽_q((t))`, `𝔽_q[[t]]ⁿ`; `⟨ℓ⟩ ⊂ GL_1(ℚ_ℓ)`; `[[1,a],[0,1]]` | stabilizer `GL_n(𝔽_q[[t]])` compact open; `ℓ·ℓᵃℤ_ℓ ≠ ℓᵃℤ_ℓ`, no stable lattice; dual lattice `ℤ_ℓe₁^∨ ⊕ ℓ⁻¹ℤ_ℓe₂^∨` stable under the transpose inverse. DDT p. 53 (`ddt-flt` lines 2022–2025), BHKT 4.8(ii) (`bhkt` lines 742–743) | true | none |
| §F.4.1, §F.4.3, §F.4.5 (r3) | `(𝒪_E, 𝔪_E)` with `E = ℚ_ℓ(√ℓ)`; `D⁺` vs unbounded; `Spec ℚ`, `μ_{ℓⁿ}`; `Spec 𝔽̄_p`; nodal `P¹/(0∼∞)` | `Λ_2 = 𝒪_E/ℓ` of length 2; 5.1.6 (`bhatt-scholze-proetale` line 1635) on `D⁺`, 5.1.8 (line 1658) fails unbounded; étale limit `0` vs `ℤ_ℓ(1)`; `Γ(ℚ̄_{ℓ,X}) = PadicAlgCl ℓ`; `π₁^proét = ℤ`, `1 ↦ ℓ`, no stable lattice, BS 6.8.13 (line 2892), 7.4.10 (line 3346) | true | none |
| §F.10.1, §F.10.2b, §F.10.3, §F.10.4 (r3) | `Spec k_m`; `A¹`; `P¹`; `Spec 𝔽_{q²}`; `r = 0`; `P = Λ[G]`; `C₂` on a point, `A = 𝔽_2` | `m ∣ r`; `qʳ`; `qʳ + 1`; `2`/`0`; fixed field of the identity infinite; `H²_c(A¹) = E(−1)`, trace `q`; `Tr_Λ = #G · Tr^G` (`stacks-03SW` lines 752, 805, 809); `𝔽_2[ε]/ε²` not perfect | true | none |
| §0.9, §0.11, §F.5, §F.6, §F.7, §F.8 (r3) | `r = 0, 1`; `P¹`; `A¹_ℂ ⊔ A¹_ℂ`; dualizable `K`; étale `a`; `Λ ⊕ Λ`; `P²`; `P¹ × P¹`; blow-up of a degree-2 point; cubic `C ⊂ P²`; `ℤ_ℓ/ℓ` on a point; `Spec ℝ`, `𝔽_2` | `c₁(O(1))` trace `+1` (0F1P line 1410); `(ℤ/n)²`, trace `+`; `DDK = K`, `a^! = a^*`; rank 2 not invertible; `deg c_2 = 3 = χ`; `4 = 4`; `E² = −2`; `H¹(P²) = 0 → Λ²` injective not surjective; `(ℤ_ℓ/ℓ)[−1]` in the `p⁺` heart; `Λ[0]` perverse with `Hⁱ = 𝔽_2` for all `i`. Stacks 0FFP/0FFQ (`stacks-0FFP` lines 4748, 4771), 0G2C/0GLD/0GLE (`stacks-0F7H` lines 2136, 2189, 2201); LRZ 6.1.1 (`lrz-relative-poincare` line 4217) | true | none |

Unused-hypothesis note carried from the previous report (not a finding): `etaleCohomologicalDimension` keeps the prime-to-characteristic hypothesis of SGA 4 X, although the bound `2 dim X` also holds for `p`-torsion.

### Sources opened this round

- `milne-av` (Milne, Abelian Varieties v2.00): table of contents lines 40–60 (§12 "The Etale Cohomology of an Abelian Variety", p. 54; §15 "Geometric Finiteness Theorems", p. 63, the previous locator, which has no Künneth statement either); lines 2270–2370 (§12 in full: Theorem 12.1, Lemma 12.2, the proof, Remarks 12.3–12.5); line 552 (the topological Künneth formula of §2.2(b)). This is the only source a changed passage cites; the other locators of the changed lines (Stacks §59.97, SGA 4 XVII §5, XVIII §§1–3, SGA 4½ Cycle §2, LRZ 6.1.1) are unchanged and were checked by the previous report.
- Manifest `packages/EtaleCohomologyFoundations/sources.toml`: 31 entries read for R04; every author-cited work of the README (SGA 1, 4, 4½, 5, 7 II; Deligne Weil I and II; Illusie 1994 and 2006; Bhatt–Scholze; BBD; ILO; Juteau; Huber; Fujiwara; LRZ; DDT; Ribet; BHKT; Milne; the Stacks chapters) has a key.

### Library declarations and cross-roadmap citations

The changed lines name `Scheme.IsInvertibleOn`, EtalePath, `EtaleFundamentalGroup`, `fiber`, `TauCeti.Compactification`, ClassicalAlgebraic.smoothTrace, ClassicalAlgebraic.lciCycleClass, `Rf!`, SchemeAndStackFoundations §§0.8, 2.11, EnhancedDerivedSheaves §§0.1–0.4 and §§F.1, F.2.2, F.3.0, G.1 of this roadmap: all resolved by the previous report (SchemeAndStackFoundations §§0.8 and 2.11 and `muEtale` on main; EnhancedDerivedSheaves §§0.1–0.4 on main; `TauCeti.Compactification` at `Compactification/Basic.lean:49–77`; `fiber` at `FiniteEtale/Fiber.lean:117`), and none of them moved: the citations tool lists no cross-roadmap citation found nowhere, and its 11 Lean-name leads are this file's four declared `VanishingCycles.*` theorems and supplier names of EnhancedDerivedSheaves and SchemeAndStackFoundations, all present where cited.

Remark on untouched text (no change requested): the Check at line 353 still writes the group as the backticked formula `EtaleFundamentalGroup x ≅ Gal(𝔽̄_p/𝔽_p)`; the name is one `Suggested.lean` declares, so this is a formula, not a claim of a Lean counterpart for the Check.

## Not verifiable

- **SGA 4 XVII §5** (Künneth) and **SGA 4 XVIII §§1–3, SGA 4½ Cycle §2** (smooth trace), cited on the two changed content lines 1006 and 1774: uncertified in the manifest (Springer, no legal copy); the Stacks parallels 0F1P and 0F12 and LRZ 6.1.1 were read by the previous report, and the mathematics is in the table above.
- **Huber (1996), BBD, ILO, Illusie (1994), Fujiwara, Ribet (1976)**: uncertified, not needed for any changed passage.
- **Bhatt–Scholze** was read as arXiv 1309.1198v2; numbering not compared with the Astérisque print (carried from the previous report).

## Source issues

- none
