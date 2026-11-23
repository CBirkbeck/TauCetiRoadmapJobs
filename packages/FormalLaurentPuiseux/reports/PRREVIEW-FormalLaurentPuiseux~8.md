# Review of FormalLaurentPuiseux (pull request #2558 at 32d88de)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example was recomputed and holds; every layer and item of the README on main is kept under its id with its statement; the source locators agree with the texts; and `Suggested.lean` elaborates without a warning. There are four small corrections (one Check, one source locator, two sentences of the description) and two format notes, none blocking; four facts are left for the human reviewers.

## C01 — The second Check of §2.3 uses `δ(exp t) ≠ 0`, which the derivation of §2.2 need not satisfy

The Check (lines 367–370) takes "the derivation `δ` of the Checks of §2.2" and concludes that `dg − Dg · dt` is nonzero for `g = exp t` "since `δ` sends it to `δ(g) ≠ 0`". The Check of §2.2 only provides some nonzero `K`-derivation of `F` vanishing on `K(t)`; such a derivation can vanish at `exp t` (extend `{exp t}` to a transcendence basis of `F` over `K(t)` and take the derivation that is `0` at `exp t` and `1` at another basis element). The conclusion is right, the step is not justified for that `δ`.

Smallest change: choose the derivation in the Check itself, "a `K`-derivation `δ` of `F` vanishing on `K(t)` with `δ(exp t) = 1`", which exists because `exp t` is transcendental over `K(t)` and `F` is separable over the purely transcendental subfield on a transcendence basis containing it.

## C02 — Mannaa–Coquand, Lemma 1.7 is cited after "uniquely", and the source proves existence only

In §5.2 (lines 719–723) the locator closes a sentence saying the corrections are determined "uniquely by Bézout and polynomial division", after the statement that the factors are unique over every commutative ring. The source constructs the corrections and, directly after the proof (MannaaCoquand2013 line 166), says that uniqueness may fail when the ring is not a domain. A reader who opens the locator finds the opposite of what the sentence says.

The README is right: if `g H + h G = 0` with `g` monic, `a g + b h = 1` and `deg G < deg g`, then `g` divides `G = a g G + b h G`, so `G = 0`; the pinned `Polynomial.Monic.eq_and_eq_of_mul_eq_mul_of_isCoprime` (`TauCeti/RingTheory/PowerSeries/Hensel.lean`, line 248) is stated over a commutative ring. Smallest change: attach the locator to the existence of the lifting ("… converge (existence: Mannaa–Coquand, Lemma 1.7, pp. 4–5; uniqueness for monic factors is proved here)").

## C03 — The description lists as "statements main did not make explicit" targets that the README on main states

Under "What it adds" the description gives, as "statements main did not make explicit", the lattices of `V((t))` as `K[[t]]`-submodules, completeness of `V((t))` and the lattice and finite-jet comparisons, continuity of the derivative of `L((t))` and functoriality, the fixed fields inside a level, the compatibility of the `θₙ`, and that the whole Galois group is inertia. The README at the merge base has each of them: "these are `K[[t]]`-submodules", "completeness and the power-series lattice/finite-jet comparisons" (L3); "prove continuity" and "functoriality" (L3); "fixed fields" (L6); "Prove compatibility in n" and "The whole absolute Galois group is inertia here" (L7). Only the statement that `t^(−j)` has no limit at all is new.

What these items have in common at the head is that they are the targets the pinned Tau Ceti does not realise, written with "Prove". Text that would be right: "Checks …; worked examples in every layer; the new statement that `t^(−j)` has no limit in `F`; and, written out as explicit targets, the items of main that the pinned Tau Ceti does not yet realise: …".

## C04 — "Statements whose content changed" omits three generalisations

The list reads as complete, and the head also widens: residue duality of §3.4 (and the antisymmetry of §3.1 and the bracket formula of §2.2) from the field `K` to a commutative ring `R`; the lattice topology and the continuous dual of `V((t))` in §3.5 from finite-dimensional `V` (main: "For finite-dimensional K-vector spaces V use `HahnModule ℤ K V`") to every `V`, finiteness kept only for `F ⊗_K V ≃ V((t))`; and the Newton polygons of §5.1 from `F` to `R((t))` for a domain `R`. Adding one bullet for these makes the list what its title says.

## N01 — The targets not yet realised still carry no source locator

The no-limit statement of §1.2, the Hasse–Leibniz rule of §2.1, the three targets of §3.5, the two of §3.6, the fixed fields of §6.1 and the three targets of §7.3 have a route but no locator. Carried from the previous review.

## N02 — The splitting sentence of §5.2 can be read with the wrong subject

"… a monic polynomial over `K[[t]]` whose reduction splits, has degree invertible in `K`, has zero coefficient in degree one below the top and is not a power of `Y` factors …" (lines 725–727) is true when all four conditions are read of the reduction, as the pinned statement has them; read of the polynomial, `Y² − t` of the next Check would contradict it. Would "whose reduction splits, has zero coefficient one below the top and is not `Y^m`, and whose degree `m` is invertible in `K`" be acceptable?

## Previous findings

The previous review (of `104d04c`) had no finding and no small correction open.

- N01 (four remaining targets without a source locator) — not repaired: the targets written with "Prove" at this head still have no locator; carried as N01 above (a format note; it does not block).

<details><summary>What was checked</summary>

Full review of the rewritten folder (1602 lines changed since the head the previous review read). The automatic checks all pass on this head. `Suggested.lean` elaborates with its eight `#check` outputs, no error, no warning, no `sorry`, no `set_option`; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe. The supplier-order check, which requires every roadmap this one consumes to be on main or earlier in the merge order so that no supply runs upward or in a cycle, reports 133 roadmaps, 1474 edges and no problem: no upward supplier and no cycle. No file outside the folder changes.

The record: the README at the merge base was read beside the head, layer by layer. L1–L7 keep their ids, subjects and order; every item of main's seven layers, of its "Carriers, scope and suppliers" section (ramification indices, the level colimit, the Cureton paragraph) and of its "Order and boundaries" section is present at the head with its statement; the heading slugs of L1–L7 are unchanged, so the one inbound link (ClassicalArithmeticCompletion line 5263, to the L5 heading) resolves.

Sources: all 14 in-text locators (11 distinct) were read in the two texts. Mathematics: every Check and example recomputed (table in the report on the board). Description: read sentence by sentence against the head and the base; two sentences are corrected in C03 and C04, the rest holds (seven layers kept, anchors kept, `RamificationIndex` a one-field structure, `embDomain`, `rootsOfUnity`, the `#check` file, the Tau Ceti contract limited to `ℤ̂`).

Not verifiable: Dean Cureton's repository and the Zulip thread were not opened. No automatic check was set aside.

</details>

## Verified sound

| Statement | Instances tried | Computed values (README side) | Library or source side | Result |
|---|---|---|---|---|
| §1.1 carriers, valuation ring | `T⁻¹ + 1`; `f = t⁻¹` | order `−1` = least exponent; `ord t⁻¹ = −1 < 0`, not integral; `v(t) = exp(−1)` | `powerSeries_as_subring_eq_integer`, `valuation_eq_exp_neg_order` named at the pin | sound |
| §1.2 convergence | `∑ tʲ`; `t^(−j)` | partial sums: supports ≥ 0, coefficients stabilise at 1; `t^(−j)`: each coefficient eventually 0, `ord = −j` unbounded, no limit | `laurentSeries_not_tendsto_single_neg_succ`, `Convergence.lean` line 141 | sound |
| §1.3 substitution | `φ = t² + t³`, `f = t⁻¹`; `φ = t + t²`, `ψ = 2t` | `ord f(φ) = −2 = 2·(−1)`; `ψ(φ) = 2t + 2t²`, `φ(ψ) = 2t + 4t²`; index bound `j ≤ ⌊n/e⌋` from `ord φʲ = ej` | Frenkel §3.5.3, pp. 90–91 (FrenkelLoop lines 4059–4084): `a₀ = 0`, `a₁ ≠ 0`, composition | sound |
| §1.4 coordinates | inverse of `t + t²`; `1 + t` | `ψ + ψ² = t` gives `t − t² + 2t³ − 5t⁴ + 14t⁵`; `∑(1 + t)ⁿ` diverges | `FormalCoordinate`: constant coefficient 0, `IsUnit (coeff 1)`, over `CommRing` (`Coordinate/Basic.lean` line 86) | sound |
| §1.5 jets | `N = 0`; `(a,0)`, `(1,1)` | `0`-jets trivial; `(a,0)(1,1) = (a,a)`, `(1,1)(a,0) = (a,a²)`; equal iff `a = 1`; `𝔽₂` commutative | product rule `(a₁b₁, a₁b₂ + a₂b₁²)` from `φ(ψ(t))` | sound |
| §1.6 infinitesimal substitutions | `a = t`, `b = t²` | `aDb − bDa = 2t² − t² = t²`; operator commutator `1 + e₁e₂[aD, bD]`; `δ(Iⁿ⁺¹) ⊆ IⁿM` | Frenkel §3.5.4, p. 92 (line 4118): `Der₀ = tℂ[[t]]∂ₜ`; `Derivation.apply_eq_derivative_smul` needs `IsHausdorff` target, satisfied by `K[[t]]` | sound |
| §1.7 change of coefficients | `σ : ℚ → ℂ`, `φ = t + t²` | image of inverse series is inverse of image (integer coefficients fixed) | `PowerSeries.map_subst` cited; names at the pin | sound |
| §2.1 derivative orders | char `p`, `f = tᵖ + tᵖ⁺¹` | `Df = tᵖ`, order `p ≠ p − 1`; `D(1 − t)⁻¹ = (1 − t)⁻²` | hypothesis "`r` nonzero in `K`" present | sound |
| §2.3 one-forms (headline) | `M = F`; `d(t⁻¹)`; non-continuous `δ` | `ℓ(f dt) = f·δ(t)` unique as `dt` generates; `d(t⁻¹) = −t⁻² dt`; class `dg − Dg dt ↦ δ(g)` | `existsUnique_compDer_eq`: `[ContinuousSMul F M] [T2Space M]`, `Continuous δ → ∃! ℓ`; `equivLaurentSeries : … ≃L[F] F` | sound; C01 on the Check's `δ` |
| §3.1 finite-map formula (headline) | `φ = t²`, `f = t⁻¹`; `φ = t² + t³`, `f = t⁻¹, t⁻², t⁻³`; char `p`, `φ = tᵖ` | residues `2`; `2, 0, 0`; `0 = p·1` | pinned: `constantCoeff φ = 0`, `φ ≠ 0`, value `φ.order.toNat • f.coeff (-1)`, `[Field K]` only; Frenkel §3.5.2, p. 90 (line 4042) | sound |
| §3.2 coefficient identity | `u = 1 + t`: `(e,k) = (1,1), (2,1)` | `−1 + 1 = 0`; `2·1 + (−2) = 0`; `φ^(−k−1)φ′ = e t^(−ek−1)u^(−k) + t^(−ek)u^(−k−1)u′` | names at the pin; over `CommRing` | sound |
| §3.3 primitives | `t⁻³ + 2t⁻² + t`; char `p`, `t^(p−1)` | primitive `−t⁻²/2 − 2t⁻¹ + t²/2`; coefficient of `t^(p−1)` in `Dg` is `p g_p = 0` | characteristic zero stated | sound |
| §3.4 residue duality | `a = 0`; `a = 0, b = 2` | `U₀^⊥`: `g_m = 0` for `m < 0`, so `U₀`; `n ∈ [a,b) ↔ −1−n ∈ [−b,−a)`; dimensions 2 and 2 | `residueForm_nondegenerate` (`CoefficientDuality.lean` line 91); Frenkel §3.5.5, pp. 94–95 (lines 4279–4286) | sound |
| §3.5–3.6 vector-valued and loop | `V = K²`, `[0,3)`; `g = v*t⁰`; `v t`, `w t⁻¹` | dimension 6; vanishes on `U_a` iff `a ≥ 0`; `Res(Φ(vt, D(wt⁻¹))) = −Φ(v,w)`, other order `+Φ(v,w)` | `HahnModule.residueDualEquiv` over `CommRing R`, no finiteness (line 200); Frenkel p. 27 footnote 3, Lemma 1.3.2 (1.3-3), p. 28 | sound |
| §4.1 ramified embeddings | `ι₂(u + u³)`, `ι₄(u² + u⁶)` | both `t^(1/2) + t^(3/2)`; `t^(1/2) = ι₄(u²)`; images meet in `gcd` | names at the pin | sound |
| §4.3 Puiseux field | `t^(1/2) + t^(1/3)` | lies in level 6, denominators 2 and 3 force `6 ∣ n` | Frenkel §1.2.1, p. 9 (line 658): inductive limit of `ℂ((t^(1/n)))` | sound |
| §4.4 levels | levels 4, 6 | meet level 2, compositum 12; `t^(5/12) = t^(1/4)t^(1/6)`; `Xⁿ − t` Eisenstein at `t` in every characteristic | `level_finrank`, `level_inf_level`, `level_sup_level` named | sound |
| §4.5 valuation, non-completeness | `∑ t^(j + 1/(j+1))` | exponents `3/2, 7/3, 13/4`; `j² + j + 1 = j(j+1) + 1`, gcd 1; denominators unbounded | `not_completeSpace` named | sound |
| §4.6 Puiseux calculus | `t^(1/2)`; `t⁻¹ dt` on level `n` | `(1/2)u⁻¹ = (1/2)t^(−1/2)`; `Res_u = n`, `Res_t = 1`; `ρ(t) = c t^e ⋯` gives residue `e` | `residue_map_mul_derivation_eq_mul`: continuous `ρ`, factor the rational order of `ρ t` (`Puiseux/Residue.lean` line 276) | sound |
| §5.1 polygons | `Y² − t`; `(Y − t)(Y − t²)` | slope `−1/2`, initial polynomial `Y² − 1`; points `(0,3),(1,1),(2,0)`, slopes `−2, −1` | NewtonPolygons §§2.1, 3.2 own the general geometry | sound |
| §5.2 Hensel factor lifting | `Y² − (1 + t)`; `Y² − t`; uniqueness over a non-domain | `s = 1 + t/2 − t²/8 + t³/16`; reduction `Y²` not coprime; `gH + hG = 0` forces `G = 0` | `exists_monic_mul_eq_of_isCoprime`, `eq_and_eq_of_mul_eq_mul_of_isCoprime` over `CommRing` (`Hensel.lean` lines 223, 248); Mannaa–Coquand Lemma 1.7, pp. 4–5 | sound; C02, N02 |
| §5.3 root theorem | `Y² − t`; char `p`, `Yᵖ − Y − t⁻¹` | root `u` at level 2; `y = ∑ t^(−1/pⁱ)`, `yᵖ = t⁻¹ + y`, denominators unbounded | Mannaa–Coquand Lemma 1.8 (p. 5), Theorem 1.9 (pp. 6–7): monic over `K[[X]]`, separable, as the README says | sound |
| §5.4 algebraic closure (headline) | `K = ℝ`: `Y² + 1`; char `p` as above | both hypotheses needed | `instIsAlgClosure : [IsAlgClosed K] [CharZero K] → IsAlgClosure (LaurentSeries K) ↥(puiseuxField K)`; Corollary 1.10, p. 7: separably closed | sound |
| §6.1 Kummer theory | level 4, `η = −1`, `η = i` | `(−1)ᵏ = 1` iff `k` even: level 2; `iᵏ = 1` iff `4 ∣ k`: `F`; `(iu)² = −t` | `kummer_surjective` under `[Field K]` only (`Level/Kummer.lean` line 119) | sound |
| §6.2 classification (headline) | `e = 1`; `t^(1/2) + t^(1/3)`; `Y³ − t` | degree 6, minimal level 6; level 3 divides `3!` | `nonempty_algEquiv_iff`: `Nonempty (L ≃ₐ Level K e) ↔ finrank = e`; `eq_level_of_finrank_eq` under `HasEnoughRootsOfUnity` for all `n` | sound |
| §6.4 trace and residues (headline) | level 2: `u⁻¹ du`; `Tr(uᵏ)` | `u⁻¹du = (1/2)t⁻¹dt`, trace `t⁻¹dt`, residues 1 and 1; `Tr(u) = 0`, `Tr(1) = 2`; `η^(−d) = 1` | pinned: `[NeZero (d : K)]`, coefficient `−1` of trace equals coefficient `−1` in `u` | sound |
| §6.5–6.6 roots of unity, action | `ζ₈ = exp(−2πi/8)`; `ζⁿ` on `t^(k/m)` | square `−i ≠ i`; `ζ_m^(nk) = 1` iff `m ∣ n` in lowest terms | `exists_forall_isPrimitiveRoot` (`TateModule.lean` line 387) | sound |
| §7.2 Galois group (headline) | `n = 2`; `ζ′ = ζ⁻¹` | generator: `t^(1/2) ↦ −t^(1/2)`; coordinate `2` fixes level 2; coordinate `1/(−1) = −1` | `absoluteGaloisGroupEquivZHat : … ≃ₜ* zHat`; `_eq_gen_iff` with `order π = 1`; Frenkel §1.2.1, pp. 9–10 (lines 656–664) | sound |
| §7.3 uniformizers, inertia | `π = t(1 + t)`; `t ↦ t + t²` | `α = t^(1/2)(1 + t)^(1/2)`, `σ(α)/α = −1`; `θₙ(ρσρ⁻¹) = θₙ(σ)` since `ρ` is `K`-linear | `commute_restrictScalars_of_apply_algebraMap` (`ParameterChange.lean` line 92); inertia not at the pin, as the README says | sound |

- Source locators checked against the text: 11 distinct (7 in FrenkelLoop, 4 in MannaaCoquand2013), covering all 14 in-text citations; all agree in section, page and content.
- Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): the 8 pinned types elaborated; 16 further declarations read with file and line; of the 400 names on the *In Tau Ceti:* lines the automatic checks report none missing.
- Cross-roadmap citations resolved: AlgebraicCurves §5.7 (line 750) and §9.2 (line 1436); NewtonPolygons §§1.2, 2.1, 3.2; ProfiniteArithmetic Layer 0 (the ring structure, line 223); 1 inbound anchor.
- Record: 7 layers and all items of the base README found at the head; 0 removed, 0 with a changed subject.
- Supplier-order check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`. Automatic checks: all passed.
- Elaboration: no error, no warning; no declaration, so no `#check @name` comparison and no padding probe.
- Checks recomputed: 28 `**Checks.**` lists and the examples of the seven layers; all true, each separates a named wrong variant.
- Change outside the folder: none.

Overlap check: read NewtonPolygons (main, and its open revision), AffineLieAlgebras and RamificationOfCompleteDiscretelyValuedFields (main); the third list is empty. NewtonPolygons owns the general polygon geometry (its §§2.1, 3.2) and this roadmap its Laurent specialization, initial polynomials, Hensel lifting and Newton–Puiseux, as both texts say; the formal loop algebra on `HahnModule ℤ K L` is owned here and consumed by AffineLieAlgebras; RamificationOfCompleteDiscretelyValuedFields treats general complete discretely valued fields and uses Laurent series only in Checks, while the invariants of the explicit levels (§6.3) are computed here from Mathlib's `Ideal.ramificationIdx`. Nothing has two owners.

Source independence: 12 passages compared with 2 sources, none shared (longest common run about six words, "the inductive limit of the fields"); largest share FrenkelLoop, 10 of 14 locators; contents compared with FrenkelLoop: independent (L7 ↔ §1.2.1, L3 ↔ §1.3.5 and §3.5.5, L1 ↔ §3.5.3–3.5.4, in a different order and with different scope).

Research link: L1–L3 and L7 are the formal-disc calculus (coordinate changes, the residue cocycle, `Gal(ℂ((t))) ≅ ℤ̂`) that Frenkel (2007) uses for local Langlands for loop groups (§§1.2.1, 1.3.5, 3.5); L5 is the Newton–Puiseux theorem as in Mannaa–Coquand (2013). Rests on the README's References and both texts read.

## Not verifiable

- Dean Cureton's Puiseux repository: not opened, so the name `PuiseuxSeries.isAlgClosure` and its licence were not checked.
- The Zulip discussion cited in the References: not opened.

## Source issues

- **Error** in MannaaCoquand2013 at Lemma 1.7, remark after the proof, p. 5 (line 166): the source says uniqueness of the two factors may fail when the base ring is not a domain; it should be that monic factors with the given coprime reductions are unique over every commutative ring; affects nothing.
- **Misprint** in MannaaCoquand2013 at Lemma 1.7, proof, p. 5 (line 146): the source bounds the degree of the second family of corrections by naming `G_ℓ` again; it should be `H_ℓ`, of degree less than `s`; affects nothing.
- **Misprint** in MannaaCoquand2013 at Lemma 1.8, proof, p. 5 (line 176): after removing the second coefficient, the source writes the reduction with `d₂` on `Y^(n−1)`; it should be on `Y^(n−2)`; affects nothing.

## For the human reviewers

- The pinned Tau Ceti is `2fd255d`. The folder's generated `PROGRESS.md` reports later work (to `385ec2d`), for example completeness of `V((t))`, which the README still writes as a target; at the pin that is correct.
- `Suggested.lean` declares nothing: every headline theorem is proved in the pinned Tau Ceti, and the file pins eight declarations with `#check`.
- FrenkelLoop was read from the author's page at the URL in the References; its page numbers are those of that copy.
- Dean Cureton's repository (README lines 1103–1106, 1183) was not opened; its licence, should code be ported, is not checked here.
