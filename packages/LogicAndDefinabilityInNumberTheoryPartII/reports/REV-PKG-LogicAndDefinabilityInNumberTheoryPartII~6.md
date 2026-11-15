<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6898965777 -->
Review (claude) of f532021

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The route of the adapted-fibration gap picks `g` by a condition that does not make `C` dominate `B`

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:103`: "some degree-`d` form `g` over `k` restricts to `C` as no `k`-multiple of the restriction of `f` … the strict transform of `C` dominates `B` because `f/g` is not constant on `C`."

   **Claim.** If `g|_C` is not a `k`-multiple of `f|_C`, then `f/g` is nonconstant on `C`, so `C` maps dominantly to `B = ℙ¹_k`.

   **Witness.** `k = 𝔽₂`, `X = ℙ²`, `C = {x² + xy + y² = 0}` (integral; `κ(C) = 𝔽₄(z/y)`), `f = y`, `g = x`. `f` is smooth and nonzero at `(ω:1:0) ∈ C`; `g|_C = ω·f|_C` with `ω ∉ 𝔽₂`; `C` maps to the closed point `t² + t + 1 = 0`.

   Computed: on `C`, `(x/y)² + (x/y) + 1 = 0`, so `x/y = ω ∈ 𝔽₄ ∖ 𝔽₂`. Hence `g|_C ≠ c·f|_C` for `c ∈ {0, 1}`, and every stated condition on `f` and `g` holds. But `f/g = ω²` on `C` is algebraic over `k`: with `t = y/x` the valuation `v` of `C` has `v(t² + t + 1) > 0`, so `v` is nontrivial on `k₁ = 𝔽₂(t)`, which is what §5.4 must exclude. The case arises in §5.4: `O_{X,C}` is a geometric prime divisor of `𝔽₂(s, t)` with residue field `𝔽₄(z/y)`, of Kronecker dimension one. It is not special to `d = 1`: for every `d`, any admissible `f = y·f₁ + (x² + xy + y²)·e₁` and `g = x·f₁` give `g|_C = ω·f|_C`. The contract's requirement itself is not refuted (Dittmann–Pop assert the adapted subfield, `dittmann_pop line 681`); the defect is the step of the route, which the repair report lists as checked ("the restrictions … span at least two dimensions").

   **Exact repair.**

   - In the route at README line 103, replace "Since `C` is not a point, some degree-`d` form `g` over `k` restricts to `C` as no `k`-multiple of the restriction of `f`" by: "The ratios `g/f` of degree-`d` forms, restricted to `C`, generate `κ(C)`, of transcendence degree one over `k`; so some degree-`d` form `g` over `k` has `(g/f)|_C` transcendental over `k`".
   - Keep the next clause: a constant `g/f = c ∈ k` on `X` would make `(g/f)|_C = c` algebraic, contrary to the choice.
   - Replace the last clause by: "the strict transform of `C` dominates `B` because `f/g` restricted to `C` is transcendental over `k`, so the image of `C` is not a closed point of `ℙ¹_k`".
   - Add to the Checks of §5.4 the negative control: for `K = 𝔽₂(s, t)` and `v` the valuation of `s² + s + 1`, the pencil of lines through the origin has base field `𝔽₂(s)`, on which `v` is nontrivial, although `s` is not in the constant field `𝔽₂`; the residue field `𝔽₄(t)` has constants larger than `κ`, and the pencil of lines `t = const` works.

   **Repair tested on the witness.** `g = z`: `(g/f)|_C = z/y` is transcendental over `𝔽₂`. The pencil `y − τz` consists of the lines through `(1:0:0)`, which is not on `C` (`1 ≠ 0`); `C → ℙ¹` has degree two; the generic member is `ℙ¹` over `𝔽₂(τ)`; `v(y/z) = 0` and the residue of `y/z` is transcendental, so `v` is trivial on `k₁ = 𝔽₂(y/z)`. The old choice `g = x` now fails the condition, as it must.

2. **F02** (P3) The requirement sentence of the gap attaches "onto which" to the generic fibre

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:103` and `:1021`, and `design/plan.json:3542`: "a dominant `k`-morphism `X′ → B` with smooth geometrically integral generic fibre onto which the strict transform of `C` maps dominantly".

   **Claim.** The contract a supplier will read asks that the strict transform of `C` map dominantly onto the generic fibre.

   **Witness.** In the README's own Check (`README.md:1025`), `C = {t = 0} ⊂ ℙ¹_s × ℙ¹_t` maps isomorphically onto `B = ℙ¹_s`; it does not map to the generic fibre `ℙ¹_{𝔽_p(s)}` at all. §5.4 then uses "`C` dominates `B`".

   **Exact repair.** In the three places write: "a dominant `k`-morphism `X′ → B` whose generic fibre is smooth and geometrically integral over `k(B)` and under which the strict transform of `C` maps dominantly onto `B`". The slug, supplier and section stay as they are. Tested on the Check: `C → B` has degree one, dominant.

3. **F03** (P3) Four page locators are off by one

   **Location and witness.**

   | README line | Printed locator | Text |
   |---|---|---|
   | 422 (§0.15) | "Poonen, Proposition 4.10, p. 11" | `poonen_uniform line 482`, page 10 (page 11 starts at line 496) |
   | 370 (§0.12) | "Lemmas 4.7–4.9 and Proposition 4.10, pp. 9–11" | lines 420–487, pages 9–10 |
   | 947 (§4.8) | "Dittmann–Pop, Theorem 4.2(2), p. 15" | statement at `dittmann_pop line 622`, page 14; its proof at line 652, page 15 |
   | 988 (§5.2) | "Dittmann–Pop, Recipe 4.3, pp. 14–15" | `dittmann_pop line 665`, page 15 only (§5.1 already has "p. 15") |

   **Exact repair.** Line 422: "p. 10". Line 370: "pp. 9–10". Line 947: "pp. 14–15". Line 988: "p. 15". The theorem numbers are right and the manifest entries carry no pages for these items, so `sources.toml` needs no change.

Three findings, one blocking. The previous round's single finding (F01) is repaired in substance: §5.4 and §1.3 no longer rest on a pencil that exists only over a finite extension of the constant field, and the two new gaps are declared in the README and in `design/plan.json`. The proof route written into the new contract `gap:finite-field-divisor-adapted-fibration` has one false step (R01), its requirement sentence has a misattached clause (R02), and four page locators are off by one (R03). No author file was changed by this review.

## Verified sound

### Previous finding, repaired passage and pattern check

| Previous finding | Repaired passage | Status |
|---|---|---|
| F01 (P2): the adapted fibration of §5.4 needs a supplier over the original finite field | `README.md:1021`: "gap:finite-field-divisor-adapted-fibration supplies, over `κ` itself, a birational `X′ → X` … Put `k₁ = κ(B) ⊆ K`"; `README.md:103` and `design/plan.json` carry the same slug, supplier LefschetzPencilsAndVanishingCycles §3.5 | **Repaired** as to the supplier and the statement; the added route has the defect R01 and the sentence the defect R02 |

The same pattern in §1.3 was repaired with `gap:snc-bertini-over-base`. I compared its sentence with Kerz–Saito's text: Definitions 2.1–2.5 (`kerz_saito lines 498–525`, pp. 10–11), Definition 3.1 and Theorem 3.2 (`lines 687–702`, p. 14), and the use in the proof of Theorem 6.2 (`line 1685`, p. 33). The requirement matches: irreducible regular `X` projective over `S`, positive relative dimension over its image, admissible simple normal crossings `Y`, a section of `L^{⊗N}` for large `N` whose support makes the pair ample. The README restricts the base to a finite field or an excellent henselian discrete valuation ring with finite residue field, which is what §1.3 uses.

§1.4: Jannsen's finite-field step is read at `jannsen_hasse lines 2186–2206` (pp. 46–47): hyperplane sections after extensions of degree `p^r` for each prime `p`, then `Tr∘Res = [k′:k]`. SchemeAndStackFoundations §4.13 on main states `bertini_smoothness` for a smooth `X ⊆ ℙⁿ_k` over an infinite field (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:6951`). The citation resolves.

Other pencil or Bertini steps over a finite base: none found in §§0.11, 0.12, 0.14, 2.7, 6.6, 6.7 (they take closed points over extensions on purpose).

### Principles and shape

I read the whole README (9 layers, 74 numbered subsections), `Suggested.lean`, `metadata.toml`, `sources.toml` and the gaps of `design/plan.json`. No route-specific shortcut, re-planned roadmap, computational algorithm, sorry'd data, `set_option`, LaTeX delimiter, pull-request number, date, machine path or HTML anchor. Each layer ends with Examples and Dependencies; the two definitions the Lean file declares (§§0.1, 0.2) have API and four Checks each. The layer order is forced by the Needs lines (0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8; e.g. 3.1 needs 1.2–1.4 and 2.1, 4.6 needs 3.8, 5.2 needs 4.7, 6.4 needs 5.7, 7.6 needs 6.9, 8.5 needs 7.6).

### Seeded source sample (15 targets)

| Target | Text read | Result |
|---|---|---|
| 0.9 | `poonen_uniform lines 142–152`, Lemmas 3.2–3.3, p. 4 | Supports (a) and (b); (a) rests on the uncertified `moret_bailly` Lemma 11.1(i), as Poonen's proof does |
| 0.10 | `poonen_uniform lines 153–210`, Lemmas 3.4–3.7, pp. 4–5; `lines 489–492`, p. 10; Theorem 1.1 at `line 47`, p. 2 | Supports; the sentence (closed under addition, `S ≠ 2S`, `2 ≠ 0`) agrees |
| 0.12 | `poonen_uniform lines 415–487`, pp. 9–10 | Supports with the README's two recorded corrections; page range R03 |
| 0.15 | `dittmann_pop lines 593–596`, p. 13; `poonen_uniform line 482` | Supports; page R03 |
| 1.1 | `dittmann_pop lines 140–144` (§2 b, p. 4), `lines 162–181` (complex and (∗), pp. 4–5) | Supports |
| 1.5 | `pop_eei2 lines 256–268`, Theorem 2.1, p. 2097 | Supports: "no orderings, e.g. `μ_{2n} ⊂ K`", same four-term sequence; Kato's page is uncertified |
| 2.7 | `dittmann_pop lines 467–476`, pp. 10–11 | Supports |
| 3.5 | `dittmann_pop lines 543–552`, Claim 2, p. 12 | Supports |
| 4.6 | `dittmann_pop lines 619–640`, p. 14 | Supports both inclusions |
| 4.8 | `dittmann_pop lines 622–624, 652–664` | Supports; page R03 |
| 5.2 | `dittmann_pop lines 665–673`, p. 15 | Supports; page R03 |
| 5.7 | `dittmann_pop lines 71–75` (p. 2), `674–683` (p. 15); `pop_eei2 line 120`, Theorem 1.2, p. 2093 | Supports |
| 6.5 | `dittmann_pop lines 715–732`, Case 2, p. 16 | Supports; the README's reading of the index set as the full flags is the right correction |
| 7.2 | `akns lines 1031–1062`, Lemmas 3.7–3.8, pp. 22–23 | Supports, both characteristics |
| 8.3 | `dittmann_pop lines 44–46`, Theorem 1.1, p. 2 | Supports (the finite case is elementary) |

New locators of the repair: `poonen_bertini line 90` (Theorem 1.2, p. 2), `line 474` (Theorem 3.1, p. 9), `lines 517–526` (Theorem 3.3 and Remarks 1–2, p. 10): all three agree with the README.

### Adversarial table

Rows cover the sampled targets, the headline theorems, the passages the repair changed and the findings. For unchanged text with computed rows in the previous round I recomputed only what is listed.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Gap route, choice of `g` (README 103) | `𝔽₂`, `ℙ²`, `C: x²+xy+y²`, `f = y`, `g = x` | `x/y = ω`, `ω²+ω+1 = 0`; `g|_C = ω f|_C`, not `0·f` or `1·f`; image of `C` is the degree-2 point | **R01** |
| Same, repaired choice | `g = z` | `z/y` transcendental; `(1:0:0) ∉ C` since `1 ≠ 0`; `deg(C → ℙ¹) = 2` | holds |
| Gap route, density | `X = ℙ²_{𝔽₂}`, `Z = {P}` rational, `T` = units | `(1 − 1/8)(1 − 1/4)(1 − 1/2) = 21/64`; divided by `7/8` gives `3/8`; times `1/2` gives `3/16 > 0` | sections exist in all large degrees |
| Gap route, `g` not vanishing on `{f = 0}` | `g/f = c` on `X` | then `(g/f)|_C = c ∈ k`, algebraic | contradiction stands after R01's repair |
| 5.4, `k₁ = κ(B)` | `𝔽_p(s,t)`, `C = {t = 0}`, `B = ℙ¹_s` | `v(s) = 0`; `C → B` degree 1; `𝔽_p(s)` relatively closed, trdeg 1 | member of 0.15 |
| 5.4, model step | `A′ = 𝔽₂[s,t]`, `v` = `t`-adic | `𝔪_v ∩ A′ = (t)`, height 1, `A′_(t) = O_v`; residue of `s` transcendental | holds |
| 5.4, char 0 | `ℚ(t)`, `t`-adic | `κ = ℚ`, residue `ℚ`, `δ = 1 = 2 − 1` | `k₁ = κ` works |
| 1.3 new Check | Poonen Thm 3.1 with `n = 3` | hypersurface in `ℙ³`, sections of degree `≤ e` not smooth of dimension `n − 2 = 1` | agrees with the source |
| 1.3 gap, small case | `ℙ¹_{𝔽₂}`, `Y = {0, 1, ∞}`, `L = O(1)` | all 3 linear forms vanish on `Y`; `x²+xy+y²` has values `1, 1, 1` at the three points | large `N` needed and sufficient here |
| 1.4 trace step | degrees `2^a`, `3^b` | `gcd = 1`, e.g. `−1·2 + 1·3 = 1` | only infinite-field Bertini enters |
| 0.9(b) | finite subgroup | torsion of `E(ℚ_p)` finite, closed, empty interior | "infinite" needed |
| 0.10(e); `exists_sentence_charZero` | `ℚ`; char 3; char 2; `Z = ∅` | `ℤ ≠ 2ℤ`; `s = 2·(2s)`, so `Z = 2Z`; `2 = 0`; `∅ = 2∅` | true in `ℚ`, false in every field of positive characteristic, as the Lean second conjunct (no `Field.FG`) says |
| 0.10(d) | `ℚ(t)`, `𝔽₅(t)` | number-field fibres lie in `κ = ℚ`; no fibre passes the number-field sentence | `ℚ`, `∅` |
| 0.12(b), residue degree | `c` a non-cube in `𝔽₄`, extension degree `ℓ = 5` | `(4⁵ − 1)/3 = 341 = 1·341`, `341 ≡ 2 mod 3`, `ω² ≠ 1` | `c` stays a non-cube when `3 ∤ ℓ` |
| 0.13; `exists_formula_isAlgebraic_primeField` | `𝔽₉`, `𝔽₉(t)` | empty family gives `K = 𝔽₉`; members all have constants `𝔽₉` | agrees |
| 0.14(b); `exists_formula_not_algebraicIndependent` | `n = 0`; `n = 1`; `(s, s²)`; `(s, t)` in `𝔽₂(s,t)` | false; `t₁ ∈ κ`; `L ∋ s`, `s²` algebraic over `L`: true; `t` transcendental over closure of `𝔽₂(s)`: false | both directions hold |
| 0.14(a), dependent tuple | number-field case, `n` slots plus `a` | subfield of trdeg `≤ n − 1`, `ε = 2`: `n + 1 ≥ (n − 1) + 2` | 0.6(c) applies with equality |
| 0.8; `exists_sentence_kroneckerDimension_eq` | `𝔽₄`, `ℚ`, `ℚ(t)` | `δ = 0, 1, 2`; slot counts `m = δ + 1 ≥ r + ε`: `0+1 ≥ 0+1`, `1+1 ≥ 0+2`, `2+1 ≥ 1+2` | thresholds meet with equality |
| 0.15 | `𝔽₂(s,t)` | `𝔽₂(s²)`: closure contains `s`, not a member; `𝔽₂(s)` member | agrees |
| 1.1 Check | `ℚ(√5)`, `(−1,−1)` | invariants `1/2, 1/2` at the two real places, `2·(1/2) = 0` at the inert prime `2` | nonzero class, zero at all finite places |
| 1.5 | `n = 2`, `μ₄`; `n = 3`, `μ₆` | `−1 = i²`; `ζ₃ ∈ K` | no orderings in both cases |
| 2.1 Check | `(21, −1)`, `(7/3, −1)` over `ℚ` | `21 ≡ 1 mod 4`: norm from `ℚ₂(i)`; `v₃(7/3) = −1` odd: not a norm from unramified `ℚ₃(i)` | niceness depends on the presentation |
| 2.4 Check | `a₀ = 3`, `a₁ = 145` | `145 = 2·72 + 1`; squares mod 5 are `1, 4`, so `3` is a nonsquare; `v₅(145) = 1` | anisotropic at 5, nice |
| 2.7 | `y² = t₂ − 1` over `ℚ` | derivative `2y = 0` at `t₂ = 1` | étale only on a dense open |
| 3.5 | `N = 1`, values `(w(a₃), w(a₂), w(a₁)) = (5, 2, 0)` | `5 ≥ 2·1·(2 + 0) = 4`; `5 > 2`, `5 > 0` | strict inequalities follow |
| 3.5, all lower values zero | `(w(a_d), 0, …, 0)` | `w(a_d) ≥ 0` and some slot value nonzero, so `w(a_d) > 0 = N·0` | holds |
| 4.6, identity for `a_d` | `β² − β = τ²/a_d` | `(a_dβ/τ)²(1 − 1/β) = a_d²(β² − β)/τ² = a_d` | formula right |
| 4.6, ball | `w(a_d) = 3` | `τ = π`: `2 ≤ 3` out; `τ = π²`: `4 > 3` in; `τ = 0` in | `b_a = 𝔪²` |
| 4.6, ramification | `[L:K] ≤ 2`, `w_L(a_d)` odd | `e = 2` would give an even value | `e = 1`, so `w` is normalized on `K` |
| 4.8 | odd `m ≥ max(1, 2g)`, `a_d = 1/f` | `w(a_d) = m`, no other zero | `V_a = {w}` |
| 5.2 | `O_P ∩ O_Q`; `K` | `x` with orders `(−1, 1)`: `x ∉ O_P`, `1/x ∉ O_Q`; `K` omits nothing | both rejected by `V` |
| 5.7; `exists_formula_isGeometricPrimeDivisor` | `d = 0`; `ℚ`; `𝔽_q(t)`; `ℚ(t)` with `ℤ_(p)[t]_{(p)}` | no discrete valuation ring; residue `𝔽_p` has char `p ≠ 0`; residue `δ = 0`, `0 + 1 = 1`; residue `𝔽_p(t)` char `p ≠ 0` | none; none; all places; excluded |
| 5.7, `d = 2`, non-smooth base | fibre = proper valuation ring containing `k₁` | residue finite over `k₁`, `δ = 1 = 2 − 1`, same characteristic | soundness needs no smoothness; 5.4 gives exhaustion |
| 6.5 | `ℚ`, `e = 0`; `ℚ(s,t)` | `⋂_p ℤ_(p) = ℤ`; flag of rank 2 with residue `ℚ`, rank 3 after the 3-adic place | agrees |
| 6.9; `exists_formula_arithmeticNormalization` | `(d,e) = (0,0)` `𝔽₄`; `(1,0)` `ℚ`; `(1,1)` `𝔽₂(t)`, `T = (t²)` | all of `𝔽₄`; `ℤ`; `𝔽₂[t]` via `X² − t²` | `IsIntegral` over `Subring.closure (range T)` is `R_T` |
| 7.2 | `ℤ[1/6]`; `𝔽₂[t, t⁻¹]` | code `(6^ν a, ν)`; `t² − st + 1 = 0`, `t⁻¹ = s − t`, rank 2 over `𝔽₂[s]` | agrees |
| 8.3 | `𝔽₂`, `𝔽₄`, `ℤ/4`, zero ring | cardinalities `2, 4, 4, 1`; `ℤ/4`: `2·2 = 0`; zero ring: `0 = 1` | only `𝔽₄` realizes `θ₄` |
| 8.4; `…_of_isDomain` | `B = 𝔽₉`, `S` the zero ring | fails `0 ≠ 1` | `S` ranges over all finitely generated commutative rings |
| 8.5; `exists_sentence_realize_iff_nonempty_ringEquiv` | `K = 𝔽₄` vs `𝔽₂`, `𝔽₄(t)` | cardinalities `4`, `2`, infinite | `L` carries no hypothesis beyond `Field.FG` |
| `kroneckerDimension` vs supplier | QuadraticFormInvariantsPartII `Suggested.lean:309` | same body; `ℚ ↦ 0 + 1`, `𝔽₂(s,t) ↦ 2 + 0` on both | conventions agree |

### Lean acceptance test

- `lake env lean` on `packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean`, run from the content checkout: exit 0; the only output is eight "declaration uses `sorry`" warnings (lines 54, 62, 73, 81, 93, 113, 128, 139). The import header is the single `import Mathlib`.
- `#check @name` for all ten declarations in a scratch copy: the elaborated types equal those listed by the worker; none lost a binder. Each agrees with its README statement (§§0.1, 0.2, 0.8, 0.10(e), 0.13, 0.14(b), 5.7, 6.9, 8.4, 8.5).
- One-tactic probe on all eight sorried theorems, each with `simp`, `rfl`, `infer_instance`, `exact?` and `trivial` under `fail_if_success`: all 40 failed to close. `aesop` reported "failed to prove the goal" on each. No padding; no declaration mirrors a Check or treats a boundary case.
- Headlines of the Summary: uniform geometric prime divisors (stated), finite normalizations (stated), bi-interpretability with ℤ (named in the docstring as not statable: no interpretations at the pin), the single sentence (stated for fields and for domains), and the Layer 0 results of Pop and Poonen (four stated). The characteristic-two cases above dimension three are named in the docstring. All ten Lean names appear in the README, and every backticked name the README attributes to this roadmap is one of the ten.

### Pinned declarations opened

`Field.FG` (`Mathlib/Algebra/Field/Subfield/Basic.lean:458`), `FiniteField.ringEquivOfCardEq` (`Mathlib/FieldTheory/Finite/GaloisField.lean:260`), `LocalSubring.exists_le_valuationSubring` (`Mathlib/RingTheory/Valuation/LocalSubring.lean:117`), `QuadraticMap.Anisotropic` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054`); Tau Ceti `Scheme.Hom.exists_finite_isSeparable_comp_eq` (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43`), `patchTopology`, `compactSpace_patchTopology`, `isClopen_patchTopology_basicOpen` (`TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean:96, 196, 209`), `Place` (`TauCeti/FieldTheory/FunctionField/Place/Basic.lean:103`), `Place.exists_ne_zero_forall_mem_ord_eq` (`…/Place/Approximation.lean:145`), `Place.exists_ord_eq_neg_and_forall_ne_ord_nonneg` (`…/Consequences/HighDegree.lean:247`: any place, `2g ≤ n`, hypotheses `IsFunctionField` and `IsIntegrallyClosedIn`, as §4.8 uses it), `Place.exists_forall_mem_valuation_sub_le_and_forall_mem_integers` (`…/Consequences/StrongApproximation.lean:88`). The five names the citation resolver listed (`root_coefficient_descent`, `valuation_prolongation_integrality`, `polarizedDescentComparison`, `properAlbanese_exists`, `lang_weil_uniform`) are supplier-planned names cited with their roadmap sections, not pinned declarations; the README presents them so.

### Duplication, suppliers and merge order

- LefschetzPencilsAndVanishingCycles §3.5 exists at its open head ("Characteristic two, low dimension and finite fields", with the descent theorem that gives an axis over `𝔽_{q^r}` and says the open set need not have an `𝔽_q`-point). It is earlier in the merge order (line 69; this roadmap is at line 392).
- Bertini over finite fields has no owner: searched main, the open heads and the board packages. LefschetzPencilsAndVanishingCyclesPartII excludes it in its scope ("Not in this roadmap … Bertini theorems over finite fields"). The two requests are therefore gaps, not duplicates.
- QuadraticFormInvariantsPartII §§1.2, 2.5, 3.9, 4.3, 5.7, 6.3, 6.5, 7.2 exist at its head (lines 726, 912, 1397, 1504, 1642, 1830, 1907, 1989). Its `Suggested.lean` declares `kroneckerDimension` in its own namespace with the same body; this package says in its scope that it restates that notion, and the fully qualified names differ.
- No other `Suggested.lean` declares `IsGeometricPrimeDivisor` or any of the eight theorem names.
- The four gaps have the same slug, supplier and section in `design/plan.json` and in the README's Exact supplier contracts. Each names an earlier supplier and asks for what no pin or roadmap provides. `gap:snc-bertini-over-base` is precise. `gap:finite-field-divisor-adapted-fibration` is precise once R02 is applied.
- Overlap facts: no other pull request changes this roadmap, no cited id is dropped, none is defined only by a revision.

Dependency check:

```text
depcheck: 246 roadmaps, 2260 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Overlap check: read QuadraticFormInvariantsPartII, AdicCoefficientsAndComparisonsPartII, LogicAndDefinabilityInNumberTheory, LocalFieldsRamificationPartII, MotivesAndAlgebraicCycles; one object shared: the Kronecker dimension, owner QuadraticFormInvariantsPartII §5.7 (restated here on pinned carriers and cited); nothing else shared.

### Copyright, licences and scope

Wording: I set 20 passages beside the sources (the 15 sampled statements, the two new contract sentences, the new Check of §1.3, and the routes of §§4.6 and 7.2). The longest shared run is the statement of §0.9(b) with `poonen_uniform line 149` (about 11 words, a one-line theorem that admits little variation). The proof plans of §§4.6 and 7.2 follow the same mathematical steps as the sources in compressed, different wording. Nothing reproduces a source sentence, list or table.

Arrangement: Dittmann–Pop has the largest share (about 60 of 154 parenthetical locators). Its contents are §1 introduction, §2 local–global principles, §3 A/B/C, §4 uniform definability, §5 main theorem. The README does not map onto them one to one: Layer 0 comes from Poonen, Rumely and Pop 2002; Layer 2 takes §3 B with the definition from §3 A, and Layer 3 takes §3 A with §3 C, in the opposite order to the source; Layer 5 adds Pop 2017; Layers 7–8 come from AKNS. The order is the one the Needs lines force.

Reuse: no table, figure or list of examples is taken over. I know of no public formalisation that `Suggested.lean` resembles.

Source independence: 20 passages compared with 6 sources, none shared; largest share dittmann_pop, about 60 of 154 locators; contents compared with dittmann_pop: independent.

## Not verifiable

- `kato_hasse` (Corollary, p. 145; p. 149), `merkurjev_suslin` (Theorem 12.2), `moret_bailly` (Lemma 11.1(i)) and `lenstra_cm` (Theorem 1(a)) are settled as uncertified; I read only the papers that cite them (`pop_eei2 line 257`, `dittmann_pop line 182`, `poonen_uniform line 144`).
- Jannsen is cited by arXiv v2 numbering; the crosswalk to the published numbering was not checked against the published typesetting.
- Sections of the unchanged text outside the sample were read in full but not compared line by line with their sources this round (§§0.6, 0.11, 2.3, 5.5, 5.6, 6.7, 7.1, 7.3, 7.4); for those I relied on the previous round's computed rows where they exist.
- Ownership against open pull requests was checked through the roadmap service's index (477 open pull requests) and the board packages; nothing outside that index was checked.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, p. 9: the source says sums of the coordinate function taken in `K` detect the subfield; it should take them in the quadratic extension `K_u` and test the form there; affects a stated result.
- **Error** in poonen_uniform at proof of Lemma 4.8, p. 10: the source says `x` composed with a separable endomorphism has a simple pole at the point; it should use `z = y/x`, since `x` has a double pole; affects the proof.
- **Misprint** in dittmann_pop at Proposition 5.1, Case 2, p. 16: the source says the composites `v ∘ w` are indexed by the rank-one family; it should index them by the full geometric flags just defined; affects a stated result.
- **Misprint** in dittmann_pop at Notations/Remarks 4.1(2) and proof of Theorem 4.2, p. 14: the source says the divisor set is taken over `k_a`; it should be over `k_t`; affects nothing.

## For the human reviewers

- Licence: `achter_casalaina_vial` is recorded with venue Annales de l'Institut Fourier 76 (2026) and read as arXiv v3; I did not confirm the published volume (`packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1458`).
- Scope: two gaps of this roadmap and one of the board package ShimuraVarietiesPartII rest on Poonen's Bertini theorem over finite fields, which no roadmap owns; whether one supplier should state it once is a maintainer's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f5320218257a5c908192e7f62017e34ef21c68ed", "job": "REV-PKG-LogicAndDefinabilityInNumberTheoryPartII~6", "model": "fable", "worker": "chris-x79"} -->
