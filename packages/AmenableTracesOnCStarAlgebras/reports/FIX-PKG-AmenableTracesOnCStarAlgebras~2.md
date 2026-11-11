# FIX-PKG-AmenableTracesOnCStarAlgebras~2

Repair of the six findings of `REV-PKG-AmenableTracesOnCStarAlgebras`. Files changed:
`packages/AmenableTracesOnCStarAlgebras/README.md`, `packages/AmenableTracesOnCStarAlgebras/Suggested.lean`,
`packages/AmenableTracesOnCStarAlgebras/sources.toml`. `metadata.toml` and `design/plan.json` are
unchanged (no supplier gap is needed).

## REV-PKG-AmenableTracesOnCStarAlgebras/F01 (P2) — applied

Added `isAmenableTrace_unitization_iff` (Layer 3, README §3.2), `isAmenableTrace_of_normalized_comp`
and `isAmenableTrace_of_comp_ideal` (Layer 6, README §6.3, §6.5), as the review proposed. Each is
named in its README section and in the docstring's "Stated here". New Checks: the factor-2 bound
is attained, `c` is pinned, `hι` is needed. The Summary no longer lists closure among end theorems.

## REV-PKG-AmenableTracesOnCStarAlgebras/F02 (P3) — applied differently

Extension-form docstring: "(1) ⇔ (3)" → "(2) ⇔ (5), with footnote 2". Tensor form: "(1) ⇔ (4)" →
"(2) ⇔ (3)". The bimodule bullet now cites "(4)". Verified at brown2006 lines 810, 812 and 815.
The left item is (2), not (1): `IsAmenableTrace` takes item (2)'s form, as the hypertrace
docstring's "(1) ⇔ (2)" already does.

## REV-PKG-AmenableTracesOnCStarAlgebras/F03 (P3) — applied differently

§8.1 and its docstring: Proposition 1.4 dropped, and "8.1" removed from `cited_for`. §8.3 and its
docstring: "Proposition 1.4, line 431, for separable unital nuclear `A`, footnote 3, line 471, for
non-nuclear `A`, Remark 1.5 (iii), line 461, for nonunital `A`". Not "nuclear only": footnote 3
(lines 471–472) extends the assertion to non-nuclear algebras.

## REV-PKG-AmenableTracesOnCStarAlgebras/F04 (P3) — applied

All six uses of "the acceptance file" (Scope ×2, Conventions, §4.4, §5.4, §7.2) became
"`Suggested.lean`", or "this roadmap's `Suggested.lean`" in Scope. The Conventions bullet was
reflowed. No other occurrence remains in the README or in `Suggested.lean`.

## REV-PKG-AmenableTracesOnCStarAlgebras/F05 (P3) — applied

`connes1976` title: now "Classification of injective factors. Cases II₁, II∞, III_λ, λ ≠ 1".
`pedersen2018` title: now "C*-Algebras and Their Automorphism Groups", with
`version_note = "2nd edition (2018)"`. Pattern: `kirchberg1993` "groupC *-algebras" → "group
C*-algebras"; `brown-ozawa2008` "𝐶*" → "C*". No other field changed.

## REV-PKG-AmenableTracesOnCStarAlgebras/F06 (P3) — applied

§5.4: "kirchberg1993, §3, … as the origin" removed. Added a closing background sentence citing
kirchberg1993 Theorem 7.5 and Proposition 7.1 for the factorization-property group case (brown2006
Corollary 4.3.5, lines 1910–1915). References and manifest: `locator_scheme = "theorem"`,
`locator = "Theorem 7.5; Proposition 7.1"`. The entry stays `uncertified`.

## Details of the repairs

- **F01.** All three statements are true; the adversarial table below has the computed instances.
  The README states each Lean form: `c > 0` together with `c⁻¹·τ ∘ ι` a tracial state forces
  `c = ‖τ ∘ ι‖`, and the ideal is the range of an injective star homomorphism (closed, the map
  being isometric). Brown's Proposition 3.5.10 covers nonunital `A`; the README argument and the
  Lean statement cover every `A`. The Lean section comment is now "Layer 6: faces, normalized
  restrictions, quotients and ideals". The Mathlib contract, the §3.2 *Needs:* line and the
  Layer 3 dependencies name `Unitization.inl`, `Unitization.instPartialOrder`,
  `Unitization.instStarOrderedRing` and `Unitization.inr_le_inr_iff`
  (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Order.lean`, lines 90, 93 and 109).
  Pattern: closure of `AT`/`AT_QD` in `T(A)` and of `UAT` in `A*` takes one approximant of a
  nearby trace (a diagonal argument), so it stays a README target (§3.3) and is not stated in Lean.
  The Summary therefore lists closure with convexity among the properties of the three classes,
  and the end-theorem list names the face property and permanence. No other headline in the
  Summary is missing from `Suggested.lean` or from the docstring's list of non-statable headlines.
- **F02.** brown2006 numbers item (3) as min-continuity of `μ_τ` (line 810), item (4) as the
  bimodule homomorphism (line 812) and item (5) as the u.c.p. extension (line 815), with footnote 2
  at line 819. Pattern search: no other text cites an item number of Theorem 3.1.6 wrongly. README
  §4.4 uses its own labels (a)–(g), and §1.5, §1.7, §2.2, §4.2 and §4.3 cite line ranges of the
  proof, not items.
- **F03.** tikuisis-white-winter2017 line 418 assumes separable, unital and nuclear. Line 431 is
  the final assertion, footnote 3 (lines 471–472) drops nuclearity, and Remark 1.5 (iii)
  (lines 461–464) passes to nonunital `A` through `Ã`. Existence of a quasidiagonal trace (§8.1)
  is in none of these, and brown2006 Proposition 3.3.2 carries it.
- **F06.** [45] at brown2006 line 4741 is `kirchberg1993`. Amenable traces are credited to [47],
  Kirchberg's Math. Ann. paper (lines 804 and 4745–4746). The proof of Corollary 4.3.6
  (lines 1933–1941) uses [46] (exact implies locally reflexive) and [81], not [45]. Nothing
  readable supports "§3 of [45]". The sentence went at the end of the §5.4 route, as related
  background, not into the opening citation of §5.4's statement.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `isAmenableTrace_unitization_iff` | `A = 0` | no state of `0` (norm-one clause), `hτ` false | vacuous, correct | none |
| same | `A = ℂ` (unital) | `Ã ≅ ℂ ⊕ ℂ` via `a + λ1 ↦ (a + λ, λ)`; `τ̃ = pr₁`; approximants `id`, `pr₁` into `M_1`, defect `0`, error `0` | true ↔ true | Check added (§3.2) |
| same | `A = c₀`, `τ = δ_1` | `τ̃ = ev_1` on `c`; `x ↦ x_1` approximates both | true ↔ true | existing Check |
| same | `A = C*_r(F₂)`, `τ_{F₂}` | `τ̃ = τ ∘ p`, `p(a + λ1) = a + λ1_A`; `τ̃|_A = τ` has norm `1`, so `τ̃` amenable would make `τ` amenable | false ↔ false | none |
| same, factor 2 for `UAT` | `A = ℂ`, `φ(a) = (1 − δ)a` | `‖tr∘φ − τ‖_{A*} = δ`; value `−δ` at `a = 1, λ = −1/2`, `‖a + λ1‖ = 1/2`, so norm `2δ` | bound `2·δ` attained | Check added |
| same, `k = 0` junk | `φ` into `M_0` | `tr_0 = 0` cannot match `τ̃(1) = 1`; for `ε < 1/2` and `a ∈ F` with `|τ(a)| > 1/2`, the approximant has `k ≥ 1` | harmless | none |
| `isAmenableTrace_of_normalized_comp` | corner `M_3 → M_4`, `tr_4` | `c = 3/4`: `γ = tr_3`, `γ(1) = 1`; `c = 1/2`: `(3/2)tr_3`, value `3/2` at `1` | `hγ` pins `c = 3/4` | Check added (§6.3) |
| same | `λ ↦ (0, λ)` into `ℂ ⊕ ℂ`, `τ = pr₁` | `τ ∘ ι = 0`, no `c > 0` makes `0` a state | vacuous | existing Check |
| same | `c₀ ⊆ c`, `τ = (δ_1 + lim)/2` | `c = 1/2`, `γ = δ_1` | amenable ✓ | existing Check |
| same, `c = 1` quotient | `q : C(𝕋) → ℂ`, `f ↦ f(1)`, `τ = id` | `γ = δ_1`, `q` into `M_1` is exact | amenable ✓ | none |
| same, faces | `B = C*_r(F₂) ⊕ ℂ`, `ι(x) = (x, 0)`, `τ = χ ∘ pr₂` | `τ ∘ ι = 0` | vacuous; consistent with `AT(B) = {χ∘pr₂}` (§6.2) | none |
| same, route | `τ ∘ ι̃ = c·γ̃ + (1 − c)χ₀` on `Ã` | at `a + λ1`: `cγ(a) + λ` on both sides; at the corner unit: `3/4` | identity holds | none |
| `isAmenableTrace_of_comp_ideal` | `M_2 ⊕ 0 ⊆ M_2 ⊕ ℂ`, `tr_2` | `γ = tr_2 ∘ pr₁`, `γ(1) = 1`, `γ(0, 1) = 0` | amenable ✓ | existing Check |
| same | `K(ℓ²) ⊆ B(ℓ²)` | `T(K(ℓ²)) = ∅` | vacuous | existing Check |
| same | `c₀ ⊆ c`, `Σ2^{-n}δ_n` | `γ = Σ2^{-n}δ_n` on `c`, truncation error `2^{-m}` | amenable ✓ | existing Check |
| same, uniqueness | `c₀ ⊆ c`, `τ = δ_1`, candidate `(δ_1 + lim)/2` | restriction `δ_1/2 ≠ δ_1` | `hτγ` excludes it | none |
| same, `hι` needed | `q : C*(F₂) → C*_r(F₂)` surjective | `τ_{F₂} ∘ q` = regular trace (amenable, §5.2); `τ_{F₂}` not amenable (§7.3) | false without `hι` | Check added (§6.5) |
| same | zero ideal | no state on `0` | vacuous | none |
| §8.3 citation (F03) | separable, nonunital, non-nuclear `A` | line 431: sep. unital nuclear; line 471: non-nuclear; lines 461–464: nonunital via `τ̃` faithful | covered by the three locators | locator changed |
| §8.1 citation (F03) | `C(𝕋)`; `SO₂` | Lebesgue cluster point quasidiagonal; `SO₂` traceless (unit needed) | brown2006 Prop. 3.3.2 carries it | TWW dropped |
| Tensor form (F02) | `M_n`, `a = e₁₂`, `b = e₂₁` | `μ_τ(e₁₂ ⊗ e₂₁ᵒᵖ) = tr_n(e₁₁) = 1/n ≤ 1 = ‖e₁₂ ⊗ e₂₁‖` | item (3) is `μ_τ` | locator changed |
| Extension form (F02) | `ℂ ⊕ ℂ`, `pr₁`, on `ℂ²` | `Φ(T) = T₁₁`, `Φ(1) = 1`, `Φ(π(a, b)) = a` | item (5), u.c.p. into `π_τ(A)''` | locator changed |

## Checks run

- **Elaboration.** `lake env lean packages/AmenableTracesOnCStarAlgebras/Suggested.lean` from the
  content checkout: exit 0; 21 warnings, all "declaration uses `sorry`" (18 before, plus the three
  new theorems); no other message. No `TauCeti.*` module needed building.
- **Signatures.** A scratch copy with `#check @name` for all 44 declarations elaborated once with
  no error. The three new theorems keep every binder: both algebras with their `PartialOrder` and
  `StarOrderedRing`, the instances on `Unitization ℂ A`, `hι`, `hideal`, `hc`, `hγ` and `hτγ`. Each
  matches its README statement. The 41 existing declarations are unchanged (docstrings only). The
  four definitions that omit an order binder their bodies do not use (`IsFaithfulTrace`,
  `IsHypertrace`, `IsFoelnerTrace`, `IsAF`) are as before.
- **One-tactic probe** on the new theorems
  (`first | rfl | (simp; done) | infer_instance | trivial | tauto | fail`): none of the three
  closes.
- **Name agreement.** Every declaration of `Suggested.lean` occurs backticked in the README; no
  `lemma`, `set_option`, `#eval`, `#print` or `#synth`; no line over 100 characters in the Lean
  file.
- **Dependency check** (`gate --depcheck … --movable`), output:

      depcheck: 227 roadmaps, 2055 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve` on the README): cross-roadmap citations found nowhere: none;
  Lean names found nowhere: none.
- **Ownership.** `roadmaps grep` for amenable traces, `AmenableTrace` and hypertraces over main and
  the open heads finds only von Neumann hypertraces (VonNeumannAlgebras V13b, Subfactors,
  FactorRigidity), already deferred in the Scope. No other roadmap owns the C*-algebraic permanence
  theorems added here, so this roadmap remains their owner. No notion moved from a later roadmap.
- `sources.toml` parses as TOML. No source was fetched and `needs-references.toml` was not written:
  every locator used is in the cached `brown2006` and `tikuisis-white-winter2017` texts or in a
  settled entry.

## For the maintainer

- New `Suggested.lean` names: `isAmenableTrace_unitization_iff`,
  `isAmenableTrace_of_normalized_comp` and `isAmenableTrace_of_comp_ideal`. No name was renamed or
  removed, and no section, layer or target id changed.
- `design/plan.json` (outside this job's editable scope apart from `gaps`) still records the old
  locators: target 5.4 has "kirchberg1993 §3 (uncertified)" (line 467), and target 8.1 has
  "tikuisis-white-winter2017 Proposition 1.4, line 418" (line 571). The README and the manifest
  are corrected.
- The review text contained no instruction to act outside the job.
