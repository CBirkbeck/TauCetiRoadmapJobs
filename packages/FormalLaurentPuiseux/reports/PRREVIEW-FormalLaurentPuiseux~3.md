# Review of FormalLaurentPuiseux (pull request #2558 at d8a98b4)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The one finding of the previous review is repaired: the Check of §1.5 now says that the `2`-jet group is commutative exactly when `1` is the only unit of `R`, which I recomputed in both directions, and the relocated Frenkel and Mannaa–Coquand locators all match the texts at the pages given. There is one small correction (Lemma 1.13 of Mannaa–Coquand, cited in §5.4, is about a different field) and one format note, neither blocking. The broken link in ClassicalArithmeticCompletion can only be mended in that roadmap and is on record; three facts are left for the human reviewers.

## C01 — Lemma 1.13 of Mannaa–Coquand, cited in §5.4 for the Puiseux field, is a statement about the subfield of series algebraic over `K(X)`

In §5.4 (line 935) the sentence "Hence the Puiseux field is algebraically closed" carries "Mannaa–Coquand, Corollary 1.10 and Lemma 1.13, pp. 7–8", and the References entry (line 1692) repeats the pair "for algebraic closedness". A reader who opens Lemma 1.13 (MannaaCoquand2013 lines 254–255, p. 8) finds that the field of fractional power series that are algebraic over `K(X)` is algebraically closed; that is a proper subfield of the Puiseux field, and the lemma says nothing about the Puiseux field itself. The statement that fits is Corollary 1.10 (lines 219–220, p. 7): for `K` algebraically closed of characteristic zero the field of fractional power series is separably algebraically closed, which in characteristic zero is the claim of §5.4. The pair was proposed by a format note of the previous review; the second half of it was wrong. No result depends on the pointer, since the statement rests on `TauCeti.puiseuxField.instIsAlgClosed`.

Smallest change: cite "Mannaa–Coquand, Corollary 1.10, p. 7 (separably closed, hence algebraically closed in characteristic zero)" in §5.4, and in the References either drop Lemma 1.13 or say what it is: "Lemma 1.13 (p. 8) for the subfield algebraic over `K(X)`".

## N01 — Four of the remaining targets still carry no source locator

§1.2 (no limit of `t^(−j)`), the Hasse–Leibniz rule of §2.1, the fixed fields of §6.1 and §7.3 are the statements no named declaration backs, and none has a locator; §§3.5, 3.6 and 7.2 now have theirs.

## Previous findings

- R01 — repaired: "the `2`-jet group is commutative exactly when `1` is the only unit of `R`: a unit `a ≠ 1` gives `(a, 0)(1, 1) = (a, a)` and `(1, 1)(a, 0) = (a, a²)`" (line 264); recomputed, true.
- C01 (earlier) — repaired: the eight Frenkel locators now read §3.5.2 p. 90, §3.5.3 pp. 90–91, §3.5.4 p. 92, §3.5.5 pp. 94–95, §1.3.5 footnote 3 p. 27 and Lemma 1.3.2 p. 28, §1.2.1 pp. 9–10; the one at §1.1 is dropped. All read at the text.
- C02 (earlier) — partly repaired: "Other roadmaps cite these layers by the labels L1, L2, L3, L4, L5, L6 and L7, which resolve to Layers 1 to 7 below" (line 44) settles the prose citations; the link anchor is not repaired: deferred (D01).
- C03 (earlier) — repaired: "Hausdorff `F`-modules with continuous scalar multiplication" (line 19); the docstring of `Suggested.lean` now reads "Over every field `K`, when `e` is nonzero in `K`, the trace of one-forms …".
- N01 (earlier) — partly repaired: N01 above.
- N02 (earlier) — repaired, with the slip of C01 above: Lemma 1.7 pp. 4–5; Lemma 1.8 and Theorem 1.9 pp. 5–7, with their separability hypothesis stated; Corollary 1.10 and Lemma 1.13 pp. 7–8.
- N03 (earlier) — repaired: "It records the roadmap's headline theorems … by pinning the declarations that prove them", "this file restates none of them".
- N04 (earlier) — repaired: both Mathlib links use commit `1b1ccf4`, the pin of `lake-manifest.json`.
- N05 (earlier) — repaired: "`σ(u)/u` is a root of unity of `K((u))`, hence a constant" (line 967).

## Deferred findings

- D01 — stands

<details><summary>What was checked</summary>

Incremental re-review of the 125 lines changed since `234a7fd`. The automatic checks passed on this head; `Suggested.lean` elaborates with its eight `#check` outputs and no error or warning; the check that every supplier is earlier in the merge order reports 200 roadmaps, 2197 edges and no problem: no upward supplier and no cycle. Every changed locator was read in the source at its page, the changed Check of §1.5 was recomputed, the changed hypotheses of the summary, of §4.6 and of the docstring were compared with the pinned declarations, and the description was read against the head: it states the label sentence, the unresolved link, the new locators and the pinned Mathlib links, and nothing in it contradicts the head. No file outside the folder changes. Not verifiable: as before, Dean Cureton's repository and the Zulip thread were not opened. No automatic check was set aside.

</details>

## Verified sound

| Statement | Instances tried | Computed values (README side) | Library or source side | Result |
|---|---|---|---|---|
| §1.5 jet Check (changed; sampled) | unit `a ≠ 1`; `Rˣ = {1}`; `𝔽₂`; `ℚ`, `a = 2`; zero ring | `(a,0)(1,1) = (a, a·1+0·1) = (a,a)`; `(1,1)(a,0) = (a, 0+a²)`; equal iff `a(a−1) = 0` iff `a = 1`. `Rˣ={1}`: `(1,a₂)(1,b₂) = (1, a₂+b₂)` both orders. `ℚ`: `(2,4)` vs `(2,2)` | law recomputed from `φ(ψ)` mod `t³`: `a₁b₁t + (a₁b₂ + a₂b₁²)t²`; zero ring: trivial group, `1` the only unit | sound; R01 repaired |
| §§1.3–1.4 locator (changed) | automorphism of `ℂ[[t]]` | coordinate: `a₀ = 0`, `a₁` a unit; automorphism = substitution of `σ(t)` | FrenkelLoop lines 4059–4074, §3.5.3 pp. 90–91: continuous automorphisms, `a₀ = 0`, `a₁ ≠ 0`, composition formula | sound |
| §1.6 locator (changed) | Lie algebra of the coordinate group | vector fields `t K[[t]] D` | FrenkelLoop lines 4116–4118, §3.5.4 p. 92: `Der₀ O = t ℂ[[t]] ∂_t` | sound |
| §2.3 / summary universal property (changed; headline) | target without continuous scalar multiplication | summary now assumes Hausdorff and continuous scalar multiplication | `TauCeti.ContinuousKaehlerDifferential.existsUnique_compDer_eq`: `[ContinuousSMul …] [T2Space M]`, as elaborated | sound |
| §3.1 locator (changed; headline) | `e = 1` | coordinate change preserves `Res` | FrenkelLoop lines 4041–4042, §3.5.2 p. 90: residue of `f dg` is coordinate-independent | sound |
| §3.4 locator (changed) | `tⁿ ↔ t^(−1−n)` | dual bases under `Res(g f dt)` | FrenkelLoop lines 4279–4280, §3.5.5 p. 94: `{tⁿ}`, `{t^(−n−1)dt}`, `n < 0`, dual bases | sound |
| §3.5 locators (changed; sampled) | basis of neighbourhoods; `ord φ = 1` | lattices `U_a(V)`; pairing multiplied by `ord φ = 1` | FrenkelLoop lines 1386–1387, footnote 3 p. 27: `g ⊗ t^N ℂ[[t]]`; line 4286, p. 95: pairing invariant under coordinate changes | sound |
| §3.6 locator (changed) | `(v tᵐ, w tⁿ)`, `m + n = 0` | `n Φ(v,w)`; `Res(tᵐ d tⁿ) = n` | FrenkelLoop lines 1412–1417, Lemma 1.3.2, (1.3-3), p. 28: `κ(A,B) Res f dg`, simple `g` | sound |
| §4.3 locator (changed) | union of levels | common denominator `n` | FrenkelLoop lines 656–659, §1.2.1 p. 9: inductive limit of `ℂ((t^(1/n)))` | sound |
| §4.6 one-forms of the Puiseux field (changed; sampled) | hypotheses on the target | Hausdorff, continuous scalar multiplication | `TauCeti.puiseuxField.ContinuousKaehlerDifferential.existsUnique_compDer_eq`: `[CharZero K] [ContinuousSMul …] [T2Space M]`, as elaborated | sound |
| §5.2 locator (changed) | hypotheses of the source | monic, coprime reduction, factors of degrees `r, s` | MannaaCoquand2013 lines 132–136, Lemma 1.7 pp. 4–5: any ring, monic, Bézout for `G₀, H₀` | sound |
| §5.3 locator (changed; sampled) | separability | README: "monic over `K[[t]]` and separable over `F`; the descent below needs no separability" | MannaaCoquand2013 lines 170–173, 207–213: Lemma 1.8 (`n ≥ 2`) and Theorem 1.9 assume separable over `K((X))`, pp. 5–7 | sound |
| §5.4 locator (changed; sampled) | which field each result is about | README: the Puiseux field is algebraically closed | Corollary 1.10 (lines 219–220): fractional power series separably closed; Lemma 1.13 (lines 254–255): the subfield algebraic over `K(X)` | Lemma 1.13 misattributed: C01 |
| §6.1 wording (changed) | level 4, `σ(u) = iu` | `σ(u)/u = i ∈ K((u))`, fourth power `1`, a constant | `K` algebraically closed in `K((u))` | sound |
| §6.4 docstring (changed; headline, sampled) | `K` not algebraically closed | "Over every field `K`, when `e` is nonzero in `K`" | pinned type: `[Field K] {d : ℕ+} [NeZero ↑↑d]`, no other hypothesis | sound |
| §7.2 locator (changed; headline) | `ζₙ = exp(2πi/n)`, `k ∈ ℤ/n` | generator acts by `t^(1/n) ↦ ζₙ t^(1/n)` | FrenkelLoop lines 660–664, §1.2.1 pp. 9–10: `k ↦ (t^(1/n) ↦ e^(2πik/n) t^(1/n))`, limit `ℤ̂` | sound |

The rows for the statements the change does not touch stand as in the previous review, of `234a7fd`; the sampled sections 1.2, 1.7, 2.2, 3.2, 4.2, 4.5, 6.2, 6.5 and 7.1 contain no changed passage.

- Source locators: all 13 inline locators at this head read at the text (10 FrenkelLoop, 3 MannaaCoquand2013), with the section starts (§3.5.2 p. 89, §3.5.3 p. 90, §3.5.4 p. 91, §3.5.5 p. 93) that the References entry "pp. 89–95" relies on.
- Library declarations opened at the pins: Tau Ceti `RingTheory/LaurentSeries/KaehlerDifferential/Basic.lean` (262–274), `RingTheory/LaurentSeries/Puiseux/KaehlerDifferential.lean` (241–253); the eight pinned types and the Puiseux universal property elaborated with `#check`.
- Cross-roadmap citations resolved on main: ClassicalArithmeticCompletion line 5499 (still the old anchor, D01), AffineLieAlgebras lines 33, 111, 162, 202, 216, 293, 366, 411 and NewtonPolygons line 75 (labels L1–L5, now mapped by line 44).
- Supplier-order check: 200 roadmaps, 2197 edges, no problem (no upward supplier, no cycle). Automatic checks: all passed.
- Elaboration: `Suggested.lean` elaborates, eight `#check` outputs, no error, no warning, no `sorry`, no `set_option`; it declares nothing, so no declaration can lose a section variable and the one-tactic probe has nothing to test.
- Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. Change outside the folder: none.

Overlap check: read AffineLieAlgebras (open revision and main) and NewtonPolygons (main); the third list is empty. NewtonPolygons owns the general polygon geometry and consumes the Laurent specialisation, Hensel lifting and Newton–Puiseux owned here; `HahnModule ℤ K L` with its bracket and residue pairing is owned here and AffineLieAlgebras consumes it. Nothing has two owners; the change moves no ownership.

Source independence: changed passages only: 14 passages compared with 2 sources, none shared beyond forced formulas; largest share FrenkelLoop, 10 of 13 locators; no layer added, removed or reordered, so the contents comparison of the previous review (independent) stands.

Research link: Layers 1–3 and 7 are the formal-disc calculus (coordinate changes, the residue cocycle, `Gal(ℂ((t))) ≅ ℤ̂`) that Frenkel (2007) uses for the local Langlands correspondence for loop groups (FrenkelLoop §§1.2.1, 1.3.5, 3.5); Layer 5 is the Newton–Puiseux theorem as in Mannaa–Coquand (2013, after Abhyankar). Rests on the README's References and both texts read.

## Not verifiable

- Dean Cureton's Puiseux repository: not opened, so the name `PuiseuxSeries.isAlgClosure` and its licence were not checked.
- The Zulip discussion cited in the References: not opened.

## Source issues

- **Misprint** in MannaaCoquand2013 at Lemma 1.7, proof, p. 5 (line 146): the source bounds the degree of the second family of corrections by naming `G_ℓ` again; it should be `H_ℓ`, of degree less than `s`; affects nothing.
- **Misprint** in MannaaCoquand2013 at Lemma 1.8, proof, p. 5 (line 176): after removing the second coefficient, the source writes the reduction with `d₂` on `Y^(n−1)`; it should be on `Y^(n−2)`; affects nothing.

## For the human reviewers

- The pinned Tau Ceti is `2fd255d`. The folder's generated `PROGRESS.md` (lines 21–32) reports work up to `385ec2d` that proves targets the README still lists as remaining, for example completeness of `V((t))` and `inertiaSubgroup_eq_top`.
- `Suggested.lean` declares nothing: every headline theorem is already proved in the pinned Tau Ceti, and the file only pins eight declarations with `#check`.
- FrenkelLoop was read from the author's page at the URL in the References; its page numbers are those of that copy.
