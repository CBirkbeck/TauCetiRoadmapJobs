# FIX-RT-MotivesAndAlgebraicCyclesPartII~1

Repair of red-team round 1 (passes a and b). All fifteen findings were checked against the cited sources, the sibling roadmaps and the pins; none was disputed. Overlaps settled once: a/F02 with b/F06, a/F04 with b/F05, a/F05 with b/F02.

## RT-MotivesAndAlgebraicCyclesPartII~1a/F01 (P2) — applied

README contracts and `plan.json` `gaps`: `animated-group-completion` → itself + `breen-deligne-resolution` + `augmentation-ideal-filtration` (EnhancedDerivedSheaves §E5:animation); `kh-excision-cdh-descent` → `kh-simplicial-model` (SchemeKTheoryOperations §5.2, GeneralAlgebraicKTheoryPartII's slug) + `kh-excision` + `kh-cdh-descent` (Layer 5). Needs/Dependencies of §§5.4, 6.1, 6.3, 7.4, 7.5 and Layers 5–7 repointed; §6.1 keeps group completion too (its route sheafifies one).

## RT-MotivesAndAlgebraicCyclesPartII~1a/F02, RT-MotivesAndAlgebraicCyclesPartII~1b/F06 (P3) — applied

§9.6 third Check: "bounded product of `ℂ⟨T⟩₁`" → `Cont([0,1]^ℕ, ℂ)`, Hilbert cube, `H^n(i_{n*} j_{n!} ℤ) = H^n_c((0,1)^n, ℤ) = ℤ` for all `n`, so `d = ∞`; plus the negative control `∏^b Cont(D, ℂ) = Cont(β(ℕ × D), ℂ)`, dimension `2`. a/F02's witness used (b/F06's polydisc is equally valid).

## RT-MotivesAndAlgebraicCyclesPartII~1a/F03 (P3) — applied

"MorseNovikov (the Lefschetz fixed-point formula)" → "MorseNovikov §6.5 (`lefschetz_fixed_point_formula`)" with its hypotheses, at the scope bullet, the supplier contract, §6.2 *Needs* and Layer 6 Dependencies; §6.2 *Needs* notes that each `w ≠ 1` acts smoothly and freely on `U(n)/T`. Checked against MorseNovikov README §6.5 and its `Suggested.lean` on main.

## RT-MotivesAndAlgebraicCyclesPartII~1a/F04, RT-MotivesAndAlgebraicCyclesPartII~1b/F05 (P3) — applied

"Remark 1.8, p. 6" → "p. 5" (Scholze line 198); §0.5 "pp. 16–18" → "pp. 17–18" (line 708); `sources.toml` `cited_for` "1.1-1.7" → "1.1-1.8", locator now lists every cited Scholze item (Remarks 1.4, 1.8 included); References [Scholze] gains the cited Remarks and Definition 1.11, and "Propositions 4.12–4.16" → "4.12–4.13, 4.15–4.16, Theorem 4.14".

## RT-MotivesAndAlgebraicCyclesPartII~1a/F05, RT-MotivesAndAlgebraicCyclesPartII~1b/F02 (P2) — applied differently

Conventions define rational localization `A⟨f/g⟩`, analytic cover and sheaf for the analytic topology (b/F02's form), with a `C × C′` Check; §0.3 drops "analytic covers are arc-covers"; §§0.3, 0.5, E9 say "arc-cover … by an analytic ring"; §0.6 bullet → `A → A_Z`, `C → C′` a Check; §§7.3–7.4 cite it. a/F05's definition rejected: it admits `A → A^u`-type non-localizations.

## RT-MotivesAndAlgebraicCyclesPartII~1a/F06 (P3) — applied

§1.7 defines a quasi-pro-étale map of small arc-stacks: every geometric fibre is `Marc(Cont(S, C))`, `S` profinite (Scholze line 1021); shows that §0.6 ring maps give such maps; adds three Checks (fold map; `ℙ¹_C`, not qpe, Example 4.26; `{0} → Marc(Cont([0,1], ℂ))`, qpe but not finitary). §§9.3 and 9.6 cite "(§1.7)".

## RT-MotivesAndAlgebraicCyclesPartII~1a/F07 (P3) — applied

Conventions: the two-sentence proof → "For nonzero `A` the equivalence is TropicalAndBerkovichArithmetic §0.27 (free of trivial spectrum); the zero ring satisfies both conditions". TBA §0.27 (head, README line 774) assumes nonzero separated complete rings, as Banach rings are here (Scholze line 299). Supplier contract entry for §0.27 now names the equivalence.

## RT-MotivesAndAlgebraicCyclesPartII~1a/F08 (P3) — applied differently

§2.1 third Check → `ℤ/ℓ` (`ℓ ≠ p`) étale hence ball-invariant (§2.4), `Hom(L_B ℤ, ℤ/ℓ) = Hom_{Dfin}(ℤ, ℤ/ℓ) = ℤ/ℓ ≠ 0` though `ℤ/ℓ ⊗ ℚ = 0`; `L_B(ℤ/p) = 0` (§4.8). Changed from the suggestion: the constant `ℤ` is not effective at such a point (its `ℤ/p` part fails ball invariance, §4.6), so maps run from the unit `L_B ℤ`.

## RT-MotivesAndAlgebraicCyclesPartII~1b/F01 (P2) — applied

§7.4 statement, first API bullet and §7.5: "analytic nonarchimedean"/"Banach `C`-algebra" → uniform ones, with the reason (§3.1; Scholze §5.2, line 1366, p. 32) and that `Marc(A) = Marc(A^u)`; new Check with the sum-norm `ℚ₂[T]`, `|2 + 2T| = 1`, against Gauss norm `1/2`. Not entered as a source correction: Scholze's Definition 2.5 (line 329) makes "nonarchimedean" ultrametric.

## RT-MotivesAndAlgebraicCyclesPartII~1b/F03 (P3) — applied

§2.4 *Needs*: DiamondEtaleCohomology §C6.1 → ProfiniteCohomology §9.6 with Tau Ceti `TauCeti.kummerIso` (`IsUnit (n : K)`, Kummer.lean:384), also in Layer 2 Dependencies, a new "From Tau Ceti" bullet and the scope bullets; §C6.1 deleted from the contract and scope. Scholze lines 1216–1268 use only Galois cohomology of `K(x)` and Kummer covers.

## RT-MotivesAndAlgebraicCyclesPartII~1b/F04 (P3) — applied

§10.2: "(Cisinski–Déglise Theorem 5.2.2 and Corollary 5.5.5)" → "Proposition 2.2.10, p. 27" (CD line 1258; lines 2048 and 2521 confirm that 5.2.2 is Beilinson motives and 5.5.5 h-motives), added to the §10.2 locator list, References [CD] and the `CD` locator in `sources.toml`.

## RT-MotivesAndAlgebraicCyclesPartII~1b/F07 (P3) — applied

§4.6 second Check: "forces nonzero coefficients at every `T^{1/ℓ^m}`" → the recursion `c_{1/ℓ}^ℓ = 1 + c_1`, `c_{ℓ^m} = c_1^{ℓ^m}`, `c_{1/ℓ^{m+1}}^ℓ = c_{1/ℓ^m}`; if `c_1 ≠ 0` all `c_{ℓ^m} ≠ 0`, if `c_1 = 0` all `c_{1/ℓ^m} = 1`; the formal solution `−Σ T^{ℓ^m}` is the first case.

## Checks run

- **Elaboration.** `lake env lean packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean` was run from the content checkout: exit 0, no output. `Suggested.lean` was not changed. It has one `import Mathlib` and declares nothing, so the `#check @name` audit had no declaration to inspect.
- **Dependency check:**

      depcheck: 258 roadmaps, 2462 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`** on the edited README finds no unresolved cross-roadmap citations and no unresolved Lean names.
- **Gaps.** The 12 slugs under "Exact supplier contracts" equal the 12 slugs in `design/plan.json` `gaps` (checked with `diff`). Nothing else in `plan.json` changed (`jq 'del(.gaps)'` gives identical output before and after).
- **Sources.** No new source was needed; CD Proposition 2.2.10 was read in the cached text. `needs-references.toml` was not written.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values | Result |
|---|---|---|---|
| `A⟨f/g⟩` universal property and spectrum | `x` with `|g|_x = 0` | `1 = Σa_i f_i + bg` gives `1 ≤ 0`, impossible; `t_i = f_i/g`, `K(y) = K(x)` | holds |
| two-member sheaf condition | `C × C′`, `e = (1,0)` | `{|1−e| ≤ |e|}` = point of `C`; `{|e| ≤ |1−e|}` = point of `C′`; `A₁₂ = 0` | `F(C×C′) = F(C)×F(C′)`, matches §7.4 Check 3 |
| degenerate localizations | `f = g = 1`; `A = 0`; `n = 0` | `A^u`; empty cover with `F(0) = 0`; `g` a unit, so `A^u` | holds |
| §0.6 `A → A_Z` qpe | `x ∈ Z`, `x ∉ Z` | `colim_U` gives `C`; some `U ∌ x` gives `0` | `Cont(pt, C)`, `Cont(∅, C)` |
| §0.6 Check `C → C′` | Gauss point | `|T − c| = max(1, |c|) ≥ 1`, so `T ∉ C` | not qpe |
| §1.7 stack qpe | fold; `ℙ¹_C`; `{0} ⊂ [0,1]` | `Marc(C×C)`, `S` = two points; connected infinite fibre; point or empty | qpe / not qpe / qpe |
| §2.1 Check 3 | `ℓ ≠ p`, `ℓ = p` | `Hom(L_Bℤ, ℤ/ℓ) = ℤ/ℓ`, `ℤ/ℓ ⊗ ℚ = 0`; `p` invertible, so `L_B(ℤ/p) = 0` | holds |
| §2.4 Kummer input | `n = 2` over residue field of characteristic 3; characteristic `0` | `IsUnit 2` holds in both | applies; §C6.1 was not needed |
| §4.6 Check recursion | `c_1 = −1`; `c_1 = 0` | `c_{ℓ^m} = (−1)^{ℓ^m} ≠ 0`; `c_{1/ℓ^m} = 1` | infinitely many nonzero coefficients |
| §7.4 uniformity | sum-norm `ℚ₂[T]` vs `ℚ₂⟨T⟩` | `|2+2T| = 1` vs `1/2`; `A_{<1} = 2ℤ₂⟨T⟩` | non-uniform excluded |
| §7.4 Checks after restriction | `ℚ_p`; `C`; `C × C′`; `0` | all uniform; `π₀ = ℤ, ℤ, ℤ², 0` | unchanged |
| §7.5 uniform hypothesis | `A = C`; `C⟨T⟩₁` | both uniform (spectral norms) | Checks unchanged |
| gap:kh-excision use | `ℤ ⊕ A_{<1} → B` | carries `I = A_{<1}` isomorphically onto the ideal `A_{<1} ⊂ B` | canonical identification |
| §9.6 Check | Hilbert cube; `β(ℕ×D)` | `H^n = ℤ` for all `n`; `dim = 2` (`dim βX = dim X` for normal `X`) | `d = ∞`; finite |
| §6.2 Lefschetz input | `w ≠ 1` on `U(n)/T` | `gṅT = gT ⇔ ṅ ∈ T`, so the action is free; sum over the empty set is `0` | trace `0` |
| §10.2 CD locator | CD lines 1258, 2048, 2521 | Prop. 2.2.10 is Nis/ét with transfers over `ℚ`; 5.2.2 is Beilinson; 5.5.5 is h-motives | relocated |
| Conventions via TBA §0.27 | zero ring; trivially normed `k` | both conditions hold; neither holds (`K(x) = k` discrete) | holds |

## For the maintainer

- **Ownership.** I searched (`roadmaps grep`, main and open heads) for rational localizations of general Banach rings and for an analytic topology on Banach rings, and found no other owner. TropicalAndBerkovichArithmetic §0.19 treats rational domains of affinoid algebras only and is cross-referenced from the new convention.
- **New gap slugs** for the suppliers:
  - SchemeKTheoryOperations: `kh-simplicial-model` (§5.2), `kh-excision` and `kh-cdh-descent` (Layer 5).
  - EnhancedDerivedSheaves: `breen-deligne-resolution` and `augmentation-ideal-filtration` (§E5:animation).
  - `kh-simplicial-model` is the slug GeneralAlgebraicKTheoryPartII (open head) already asks of the same section for unital rings. This roadmap's contract extends it to qcqs schemes, and the ring case is the same.
- **Removed slug.** `kh-excision-cdh-descent` no longer exists; no other roadmap cites it.
- **Names cited by other roadmaps.** None of this roadmap's section ids or names changed.
- **Not adopted as corrections to the source.** b's "gap in Theorem 8.13" (see b/F01 above). a/F05 and b/F02 also read Scholze as leaving "analytic topology" undefined; the README now defines it, without recording an erratum.
