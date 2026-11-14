# FIX-PKG-HigherHidaAndColemanTheory~14

Findings of `REV-PKG-HigherHidaAndColemanTheory~13` (one finding). The review's "For the human reviewers" section lists no finding and changed nothing.

## F01 (P2) — applied

Old → new: §6.7 said "the two proved analytic lower bounds" with Needs §6.6, §1.2 only. Now two targets precede it: §6.6a (coefficient-field analytic pairing, BP-Coleman Theorems 6.7.1–6.7.2) and §6.6b (analytic slope bounds, Theorem 6.8.3). §§6.7, 6.8 and 6.9 cite them in statement, route and Needs. No section is renumbered.

Verified. BP-Coleman line 7690–7705 is a separate theorem for every continuous character, and README §5.5 covers M-dominant algebraic κ only. The reviewer's witness is correct: κ_1(ν_v)=(2,6;−8) for ν_v=(−3,1;8), recomputed with ρ=(−1,−2) and w0M the coordinate swap.

The repair differs from the suggested one in three ways.

- **Both signs are stated.** The review asked for the + bounds only. §6.6b states the − bounds too, since the source theorem has them and §6.7's − condition is their twist.
- **The second − bound is corrected (new source issue E17).** BP-Coleman line 7694 prints `v(λ) ≤ −w⁻¹ρ + w⁻¹2ρ_nc`. The transpose of the first + bound under the duality is `−w⁻¹ρ+ρ+w⁻¹2ρ_nc = w⁻¹w0Mρ+ρ`, using `w0Mρ=2ρ_nc−ρ` (line 5796–5797). The same form comes from Theorem 5.9.6(2) (line 5698–5699) after the ν_alg twist, which Remark 6.8.2 (line 7685–7688) requires. The other three printed bounds pass both tests. §6.6b states the corrected form.
- **The coefficient field is scoped by what the route supplies.** The source proves the second pair of bounds from the first by duality (line 5704–5711, and "identical" at line 7704–7705). The support-duality contract (`gap:banach-support-duality`, AdicSpacesPartIV §F1.10) covers finite extensions of ℚ_p and spherically complete fields, and ℂ_p is not spherically complete. So §6.6b(1), the direct bounds, is stated for every complete extension of F including ℂ_p, and §6.6b(2), the transposed bounds, for finite extensions L/F. §6.6a is stated over finite L/F for the same reason. This is narrower than the source's ℂ_p statement for part (2); every consumer in this roadmap (§§6.7–6.9) uses only F-valued locally algebraic weights and rigid points.

Changes in `packages/HigherHidaAndColemanTheory/README.md`:

- New §6.6a: pairing `H_w,an^i(ν_L,1)^±,fs × H_w,an^(d−i)(ν_L,0)^∓,fs→L`; independence of choices; adjointness t ↔ t⁻¹; nondegeneracy and perfectness on η / η⁻¹ blocks; compatibility with the BGG spectral sequences of §6.6 and the algebraic pairing of §5.6(b). Route, Needs, four Checks.
- New §6.6b: the four bounds with `a_an(w)=−w⁻¹w0Mρ−ρ`, `b_an(w)=−w⁻¹ρ+ρ`, and the identities `a_an+w⁻¹2ρ_nc=−b_an`, `b_an+w⁻¹2ρ_nc=−a_an`. Route (power-bounded lattice, projected-lattice lemma, then §6.6a for the transposed pair), Needs, four Checks including the reviewer's GSp₄ test.
- §6.7: the sentence on "proved bounds" now derives the two inequalities from §6.6b at weight ν_vχ. The − condition is derived from §6.6a(3) and agrees with the − bounds of §6.6b. The API bullet "Under the proved bounds…" now states its quantifiers (every v≠1, q, ε). Needs gains §6.6a and §6.6b.
- §6.8: route and Needs cite §6.6a and §6.6b.
- §6.9: the family pairing's field instances are those of §6.6a; Needs gains §6.6a. The family vanishing and torsion-freeness target is otherwise unchanged.
- Source issues: E3 now points to §6.6b; E17 added.

Pattern sweep. "Proved bounds" used without an owning target: §5.5 is itself the owner of the algebraic bounds, and §§1.2, 5.8, 7.6 and 8.5 cite §5.5 or their own targets. No other section used the analytic bounds or the analytic pairing. The Layer 6 Dependencies list needs no change: every external supplier in the new Needs lines was already listed there.

`packages/HigherHidaAndColemanTheory/sources.toml`: the BP-Coleman entry gains `6.6a`, `6.6b` and `Source issues/E17` in `cited_for`, and §5.9.8, Remarks 5.9.3 and 6.8.2 and the proofs of Theorems 6.7.1–6.7.2, 6.8.3 and Proposition 5.10.2 in `locator`. No new source.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `a_an+w⁻¹2ρ_nc=−b_an` (§6.6b) | C₂, w=1, ρ=(−1,−2), w0M=swap | a_an=(3,3); 2ρ_nc=w0Mρ+ρ=(−3,−3); b_an=0; sum 0=−b_an | Holds | Check added |
| Printed − second bound vs transpose (E17) | same | printed (1,2)+(−3,−3)=(−2,−1); transpose −a_an=(−3,−3) | Printed form is not the transpose | E17; corrected bound stated |
| Twist of §5.5 gives §6.6b | general w, ν_alg=−w⁻¹w0M(κ+ρ)−ρ | +: w⁻¹w0Mκ+ν_alg=a_an. −, κ∨: w⁻¹κ∨−ν_alg=ρ−w⁻¹ρ=b_an; second: b_an+w⁻¹2ρ_nc | Three printed bounds match; fourth is E17 | none |
| §6.6b, torus datum | ρ=0, ρ_nc=0, T^+=T^−=T(ℚ_p) | all four bounds give v(η)=0; rescaling t by p gives −1 on t⁻¹ | Holds; rescaling excluded | Check added |
| §6.6b, GL₂ | w=1 and w=s, w0M=1 | bounds (−2ρ, 0) and (0, −2ρ); both amount to v(η(t))≥0 on T^+ | Holds; equals the conjectural bound | Check added |
| §6.6b excludes a column §5.5 cannot | GSp₄, w=1, κ=(5,3;−8), v=s0, t₂ | ν_v=(−3,1;8); κ_1(ν_v)=(2,6;−8), 2<6; bounds −3, 0; after −ν_v: 0, 3 | Slope 2 excluded by second bound only; slope 3 not excluded | Check added |
| §6.7 − condition | η on −, λ−=v(η)+ν_v | pairing: −λ−+ν_v≥a_an and ≥a_an+w⁻¹2ρ_nc; direct − bounds give the same two | Both routes agree with BGGsafe+(w,κ,−λ−) | text added |
| §6.6a adjointness on units | d=0, unit u | + acts by ν(u), − by ν(u)⁻¹; ν(u)·1=1·ν(u⁻¹)⁻¹ | Holds; t ↔ t would need ν(u)²=1 | Check added |
| §6.6a slope sign | η(t)=p² on + | η⁻¹(t⁻¹)=p²; v(η⁻¹)=−v(η), value −2 on v(t) | Matches the reviewer's 2 ↦ −2 | Check added |
| §6.6a boundary variants | proper curve, D≠∅ | H¹(ω)=F; H¹(ω(D))=H⁰(O(−D))^∨=0; H⁰(O(−D))=0 against H¹(ω(−D))=H⁰(O(D))^∨≠0 | Only cusp × canonical is perfect | Check added |
| §6.6a whole finite-slope union | blocks L in slopes 0,1,2,… | sum has countable dimension, product uncountable | Not a full dual; perfect only blockwise | Check added |

## Checks

- `lake env lean` on `packages/HigherHidaAndColemanTheory/Suggested.lean`: exit 0, no output. The file is unchanged; it declares nothing, so the `#check @name` comparison has no declaration to compare.
- Dependency check: `depcheck: 244 roadmaps, 2217 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: "Lean names found nowhere: None."

## For the maintainer

- No gap, supplier or Lean name changed; `design/plan.json` and `metadata.toml` are untouched. §§6.6a and 6.6b are new ids; no existing id moved.
- Ownership: no roadmap on main or in the open pull requests states BP-Coleman Theorems 6.7.2 or 6.8.3 (searched by theorem with `roadmaps grep`), so both targets are owned here, as the review also concluded.
- The ℂ_p form of the transposed bounds (§6.6b(2)) would need support duality over a field that is not spherically complete. That is outside the current `gap:banach-support-duality` contract and no consumer needs it; widening it is a scope decision, not made here.
- E17 is my reading of a source misprint, supported by two independent derivations; it has not been checked against the journal version.
