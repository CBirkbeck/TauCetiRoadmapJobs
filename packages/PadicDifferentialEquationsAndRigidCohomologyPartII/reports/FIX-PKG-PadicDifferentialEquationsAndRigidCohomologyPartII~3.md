# Repair report: PadicDifferentialEquationsAndRigidCohomologyPartII (package, round 3)

Resolves the twelve findings R01–R12 of `reports/REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~2.md`. Every finding was checked against the parent roadmap PadicDifferentialEquationsAndRigidCohomology (read at its open head with `roadmaps show`), the cached sources and the pinned libraries. All twelve findings are correct. Files edited: `README.md`, `Suggested.lean` (docstring only), `sources.toml`, and the top-level `gaps` list of `design/plan.json`, where one entry was added.

## R01 (P1) — applied

Old: MS.0.4's generic pair was "supplied" by §§RD.0.53, RD.0.54. New: supplier gap `gap:dejong-generic-affine-line-comparison` (PadicDifferentialEquationsAndRigidCohomology §§RD.0.53, RD.1.72), in the README contracts and `plan.json`. It asks for embeddings `E → E_alg`, `E† → E†_alg` and injectivity of `E ⊗_(E†) E†_alg → E_alg` over `k(t)`. The §RD.0.54 line is deleted.

A `k(t)`-versus-`k((t))` Check was added to MS.0.4.

Evidence: parent §RD.0.53 assumes "its complete residue field κ". §RD.5.2 assumes `Γ = Γ^{k((t))}`, and §RD.0.35 is for `k((t))`. §RD.0.54 builds the Fargues–Fontaine rings over a complete perfect `F`. DAD lines 511–514 define the generic `O_E` with residue field `k(t)`. DAD lines 572–573 take the injectivity from [Ked04, Prop. 4.1]. KED04 lines 85–91 and 346 show that Prop. 4.1 is stated for `Γ` over `k((t))` with `k` algebraically closed.

Other places repaired: the supplier paragraph that had said §RD.0.53 applies to "`k((t))` and `k(t)`"; the Scope imports; the MS.0.4 proof route and *Needs*; the MS.5.5 *Needs*; the Layer MS.0 and MS.5 Dependencies; a new entry in "Corrections to the sources" for the proof of DAD Lemma 4.2.7; and a KED04 Reference. KED04 was fetched (arXiv math/0110125v4, certified) and recorded in `sources.toml`.

## R02 (P1) — applied

MS.0.10: "a sum of finitely many PBQ submodules" → "the sum of a nonempty finite family". The route now proves this through `⊕_i N_i`. MS.2.4 gets the same change. Each gains an empty-family Check (rank 0, not PBQ) and the retests "one line: rank 1, slope 0; two lines: rank 2, slope 0".

Other places: MS.1.1 route, "Sums of PBQ submodules" → nonempty families, with the nonempty supply made explicit. While sweeping I also found a false Check in MS.0.10: "the sum of PBQ modules of different maximal slopes is not [PBQ]". Inside the logarithmic module, `E e_1` (slope −1) plus the whole module (slope 0) is the whole module, which is PBQ. The Check now says "direct sum" and records this internal-sum example.

## R03 (P2) — applied

Convention 4 now says that `Top(0) = S_min(0) = 0` and that `λmax`, the minimal slope and `slope(P)` exist only for nonzero objects. Changes:
- MS.0.4: `M† ≠ 0`, so `P ≠ 0`.
- MS.3.3: `N† ≠ 0`.
- MS.4.2: `P ≠ 0`.
- MS.4.1: "nonzero isoclinic `P`".

Zero-source Checks were added to MS.0.4, MS.3.3 and MS.4.2.

Pattern sweep: MS.4.7 (quotients `Q_N`, `Q_M` are now nonzero); the MS.3.5 route (the `N† = 0` case is handled separately); the MS.5.5 and MS.5.7 routes (`N = 0` is trivial, otherwise `N` is nonzero isoclinic); the MS.3.4 Check `Sat(0) = 0` (now via `Top(0) = 0`).

## R04 (P2) — applied

Convention 4 gains the dictionary `λ_here = λ_RD / v_π(q)` for §§RD.1.25–RD.1.41 and RD.1.72, ramified case included, and separates the parent's additive twist `A(c) = L(π^c)` from the Tate twist `O(n)`. MS.0.3 gains the witness Check: raw `(0,2)`, normalised `(0,1)`; after squaring raw `(0,4)`, normalised `(0,1)`; for `e = 2`, raw 4, normalised 1.

Convention 4 also says what the rescaling keeps (orders, isoclinicity, Hom vanishing, step indices) and how `σ^a` changes raw valuations. The additive twist is that of §RD.1.22; the Tate twist, with Frobenius `q^(−n)`, is that of §§RD.3.25 and RD.3.34.

Evidence: parent §RD.1.35 measures slopes "with `w(π) = 1`".

Other places: MS.3.9 "multiplies all slopes by the same positive factor" → raw valuations are multiplied, normalised slopes are unchanged. The MS.0.4 route now states the eigenvector slope in both conventions. The MS.0.3 √p Check now gives raw slope 1 against normalised slope 1/2.

## R05 (P2) — applied

Convention 3: "finite free module …; over a dagger algebra the same notion" → finite free over the local fields and bounded-disc rings, finite projective over a smooth affine dagger algebra (§§RD.3.31, RD.3.32). Added Check (MS.2.2): on `C = Y ∖ {O}`, with `O(P − O)` of order `ℓ`, a rank-one unit-root object is projective, not free.

Convention 3 also says that global arguments use local bases or direct summands.

Evidence: parent §RD.3.31 says "finitely generated (necessarily projective) `A†_K`-modules". MS.2.2(3) already used finite projective modules and needed no change. No curve theorem was restricted.

## R06 (P2) — applied

MS.6.14 route: `π_m^*(h ∘ Top(g′))` → `π_m^*(h ∘ Top(g′)⁻¹)`, an endomorphism `Top(M) → Top(N) → Top(M)`, and then `h = (h ∘ Top(g′)⁻¹) ∘ Top(g′)` is invertible. Added a direction Check: `g′(e_N) = 2e_M`, `h(e_N) = 3e_M` gives multiplication by 3/2 with inverse 2/3, and composing with `Top(g′)` gives back `3e_M`.

Sweep of every reconstruction composite: MS.3.6, MS.3.7, MS.4.4, MS.4.6, MS.4.8 (double dualisation `a^∨ : Top(N^∨) → Top(M^∨)` then `M† → N†`), MS.6.2–MS.6.4, MS.6.10 and MS.6.11 (`π_m^*g′ ∘ τ` with `τ` lifting `Top(g′)⁻¹ ∘ h`) are all well typed. No other change was needed.

## R07 (P3) — applied

MS.0.11 Check: "For `U = 0` the reverse implication fails" → the forward implication fails. With `M` the unit, `M` is PBQ (true) but `M ⊗ 0 = 0` is not (false). The reverse direction holds vacuously (false implies true). The theorem keeps `U ≠ 0`.

## R08 (P3) — applied

MS.5.8 Check: the claim that the unit's endomorphisms are `K` is now made only for geometrically connected `X̄`. Added a Check: for `X̄ = P²_(𝔽_(p²))` over `𝔽_p`, `Z = ∅` and a line `C̄`, both sides are `K_2` of `K`-dimension 2, and restriction `K_2 → K_2` is an isomorphism (`2 = 2`). The theorem and the gap `docile-curve-restriction` are unchanged.

## R09 (P3) — applied

MS.6.8 Check: "all endomorphism algebras are `L`, identities" → for connected `Y`, `End = Q̄_p` and the map is the identity. Added: the fold map `X ⨿ X → X` gives `a ↦ (a, a)`, injective, not surjective. MS.6.12 Check: `End(M†) = Q̄_p`, `c, c′ ≠ 0`; `c = 1`, `c′ = 2` give distinct isomorphisms, `c′ = 0` none.

On a finite model the endomorphism algebra is `L`; `End(M†) = Q̄_p` in MS.6.12 is Schur's lemma.

## R10 (P3) — applied

The pin headings were updated: Mathlib `f6090c70…` → `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `358314d4…` → `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are the revisions in the content checkout's `lake-manifest.json`, and `git rev-parse` in both package checkouts gives the same hashes. All ten cited Mathlib declarations were reopened at the new pin and still exist: `Isomorphisms.lean:39`, `Invariants.lean:126,131,137`, `Trace.lean:75,190`, `PadicNumbers.lean:881`, `Fixed.lean:103`, `Isocrystal.lean:112,179`.

## R11 (P3) — applied

"From Tau Ceti": "Nothing is consumed" → the rings `PowerSeries.HasGaussNorm.subring` and `PowerSeries.OnOpenDisc.subring`, identified with `K[[t]]₀`, `B^τ[[u]]₀` and `B^τ{u}` and marked as rings only. Scope, Convention 2 and MS.0.2 cite them. MS.0.2 gains a Check: `Σ u^n` is bounded, `Σ p^(−n)u^n` is not. The `Suggested.lean` docstring was corrected the same way.

Locators at the Tau Ceti pin: `Bounded.lean:63,81` (`HasGaussNorm.subring`, `mem_subring_one_iff`) and `OpenDisc/Basic.lean:295` (`OnOpenDisc.subring`).

Mathlib's `PowerSeries.derivative` does exist, so the text says that the derivative exists and that no compatible Frobenius lift does. No headline becomes statable.

## R12 (P3) — applied

`sources.toml` `cited_for` updates:
- TSU: `MS.5.10` → `MS.5.7`.
- DAD: `MS.5.1-MS.5.11` → `MS.5.1-MS.5.8`, plus the new supplier request.
- KED05: `MS.5.9` → `MS.5.6`.
- AE: `MS.5.11` → `MS.5.8`.

Keys and retrieval fields are unchanged. All four targets were resolved against README headings: MS.5.6 cites Kedlaya 2005 Theorem 1, MS.5.7 cites Tsuzuki Proposition 6.1, MS.5.8 cites Abe–Esnault Corollary 2.4, and MS.5.1–MS.5.8 all exist.

## Checks run

**Elaboration.** `lake env lean packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`, run from the content checkout after the final edit, exited 0 with no output. No Tau Ceti module is imported, so nothing needed building.

**Signature probe.** The file declares no theorems or definitions, so the `#check @name` comparison has zero cases. No binder or elaborated type could change.

**Dependency check**, run after all edits:

    depcheck: 236 roadmaps, 2134 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The new gap's supplier, PadicDifferentialEquationsAndRigidCohomology, is line 121 of the merge order; this package is line 236.

**Gap consistency.** README "(gap:…)" lines and `plan.json` `gaps` agree on nine slugs, and every `needs` string matches its README line exactly. A script confirmed that only `gaps` changed in `plan.json` and that the first eight entries are unchanged.

**Stale ids.** The README no longer contains `RD.0.54`, `MS.5.9`, `MS.5.10`, `MS.5.11`, the old pin prefixes, "reverse implication fails" or the ill-typed composite `h ∘ Top(g′))`.

## Ownership and overlaps

Before declaring the gap I ran `roadmaps grep` on main and all open heads for `W(k)[t]_(p)`, `E†_alg`, `k(t)^alg`, "Full faithfulness for overconvergent" and "Definition 4.2.5". The only hits are in PadicDifferentialEquationsAndRigidCohomology: §RD.1.72, which defines `E†_alg`, and its Kedlaya citations; the one unrelated hit is ImplicitAtlases, citing Pardon's Definition 4.2.5. So the parent is the single owner of the generic-pair ring comparison and of the fields the gap uses. This package states no new construction.

The overlap report for this roadmap lists no open pull request changing this roadmap, no dropped cited id, and no id defined only by an open revision. No id of this roadmap was renumbered or deleted.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Gap dejong-generic-affine-line-comparison | `k = 𝔽_p`; `Σ t^(n!)` | in `k((t))`: yes; in `k(t)`: no (gaps exceed any recurrence order); KED04 Prop. 4.1 residue field `k^alg((t))` (lines 85–91, 346); §RD.0.53 needs complete `κ` | Generic case not covered by the parent; request is a genuine extension | Gap added; MS.0.4 Check |
| Gap embeddings | standard lift `t ↦ [t]` | `φ([t]) = [t^p] = [t]^p`; units of `W(k)[t]_(p)` reduce into `k(t)^×`, which maps to units of `W(k(t)^alg)` | Embedding `E → E_alg` well defined and equivariant | none |
| MS.0.4 (`M† ≠ 0`) | `M† = 0` into `E(0)`, `E(−1)`; `E† → E`; `E† → E²`; projection `E†(−1) ⊕ E†(0) → E(0)` | zero source would need `λmax(0) = 0` and `1`; `1 = 1`; `0 = 0`, `1 < 2`; kernel rank 1, not injective | Hypothesis needed, theorem holds on the rest | `M† ≠ 0`, `P ≠ 0` |
| MS.0.4 route eigenvectors | generic pair, slope `s/r`; local pair, `K = ℚ_p(√p)`, `q = p` | generic: `v_π(q) = 1`, eigenvalue `p^(s/r)`; local: raw `v_π(√p) = 1`, normalised 1/2 | Convention explicit in both cases | route rewritten |
| Convention 4 dictionary | `K = ℚ_p`, `q = p²`, eigenvalues `1, p²`; `σ²`; `e = 2`, eigenvalue `p²` | raw `(0,2)` / normalised `(0,1)`; raw `(0,4)` / `(0,1)`; raw 4 / normalised 1 | Normalised slopes invariant under `σ ↦ σ^a` | Check in MS.0.3 |
| Convention 4 twists | `O(1)`; parent `A(1) = L(π)` with `K = ℚ_p`, `q = p²` | `O(1)`: Frobenius `p^(−2)`, slope −1; `A(1)`: Frobenius `p`, slope `1/2` here | Two notations differ in sign and scale | distinction stated |
| Convention 4 zero object | `M = 0` | `m = 0`, `Top(0) = S_min(0) = 0`, no numerical slope | Matches `B(0) = 0`, `Sat(0) = 0`, `Hull(0) = 0` | convention added |
| Convention 3 | `C = Y ∖ {O}`, `y² = x³ − x` over `𝔽_5`, `P = (0,0)`, `ℓ = 2`, `ℓ \| 4` | `Pic(C) ≅ Y(𝔽_5) ∋ [P − O] ≠ 0` of order 2; integral form reduces to `O(P − O)^(±1)`; free would force reduction trivial (lattice `π^n A†`) | Projective, not free; local rank 1 | Convention and Check |
| MS.0.10 sum | empty family; one and two lines in `E(0)²`; `E e_1` + log module | rank 0, not PBQ; rank 1 slope 0; rank 2 slope 0; sum = log module, PBQ | Nonempty needed; internal sums of different slopes can be PBQ | nonempty; Check corrected |
| MS.0.10 converse route | `N_1 = N_2 = E(0)` | `B(N_1 ⊕ N_2) = E(0)²`, isoclinic slope 0; sum nonzero since `N_1 ≠ 0` | Proof of the sum claim complete | sentence added |
| MS.1.1 route | `M = 0`; `M = L_1 ⊕ L_0` | empty filtration; first step `L_1` exists, rank 1 | Nonempty supply explicit | wording |
| MS.0.11 Check | `M` = unit, `U = 0`; `U` = unit | PBQ values `(true, false)`, `(true, true)` | Forward fails, reverse vacuous | "reverse" → "forward" |
| MS.2.4 | empty; `O(0)²` lines | rank 0 not PBQ; ranks 1, 2, slope 0 | as MS.0.10 | nonempty; Check |
| MS.3.3 | `N† = 0` into `E(0)`, `E(−1)`; second assertion with `P = 0` | `λmax(0)` would be 0 and 1; `0 ≥ 0`, equality, `L† = 0` saturated | First part needs `N† ≠ 0`; second holds with `Top(0) = 0` | `N† ≠ 0`; Check |
| MS.3.5 route | `N† = 0` | quasi-saturated forces `P = 0`; `Top(0) = 0 ≅ 0` | Trivial case separated | wording |
| MS.3.9 iteration | rank one, eigenvalue `c = p²`, `q = p²`, `a = 2` | raw `2 → 4`, normalised `1 → 1`; top quotient unchanged | Saturation invariant | wording |
| MS.4.2 / MS.4.1 | `P = 0`; identity on isoclinic `P†`; projection `O(−1) ⊕ O(0) → O(0)` | `N† = 0`, ranks `0 = 0`, no slope; `1 = 1`; kernel rank 1 | `P ≠ 0` needed for the slope claim | `P ≠ 0`; Check |
| MS.4.7 | `Q = 0` | "slope of the quotient" undefined | Nonzero needed | "nonzero isoclinic" |
| MS.5.5 / MS.5.7 routes | `N = 0`; ordinary line in rank-two hull | `S_min(0) = 0` both sides; hull rank 2, `S_min` rank 1 = N | Zero case separated | wording; MS.5.5 *Needs* |
| MS.5.8 Check | `X̄ = P²_(𝔽_(p²))` over `𝔽_p`, `Z = ∅`, line `C̄` | `End(1) = K_2` on both, `dim_K = 2 = 2`, restriction iso | Theorem holds; "both sides are `K`" false | Check scoped; new Check |
| MS.6.8 Check | unit, connected `Y`; `Y = X ⨿ X` | `Q̄_p → Q̄_p` identity; `Q̄_p → Q̄_p²`, `1 ↦ (1,1)`, `(1,0)` not in image | Identity only for connected `Y` | Checks rewritten |
| MS.6.12 Check | line, `c = 1`, `c′ = 2`, `c′ = 0` | two isomorphisms, one induces `h`; `0` not invertible | Needs `c, c′ ≠ 0` | Check rewritten |
| MS.6.14 route | labelled lines, `g′ = 2`, `h = 3` | `h ∘ Top(g′)⁻¹ = 3/2`, inverse `2/3`, `(3/2)·2 = 3` | Corrected composite typed and invertible | route; Check |
| Tau Ceti carriers | `Σ X^n`, `Σ p^(−n)X^n`, `log(1+u)` | sup norms 1, `∞`, `∞`; open disc: yes, no (`r < 1/p` only), yes | Bounded ring is `K[[t]]₀`; open-disc ring is `B^τ{u}` | contracts; Check |

## Notes for the maintainer

- **New supplier request on the parent.** PadicDifferentialEquationsAndRigidCohomology is asked for a ninth contract, `dejong-generic-affine-line-comparison`, at §§RD.0.53 and RD.1.72. As written, §RD.1.72's proof points to §RD.0.54(c) for its ring comparison, but §RD.0.54 builds Fargues–Fontaine rings over a complete perfect `F`. The parent may want to repair that pointer when it fulfils this request.
- **Unproved supplier input.** The injectivity for residue field `k(t)` is used by D'Addezio but not stated in KED04, which treats `k^alg((t))` only. Whoever discharges the gap must prove it in that setting.
- **Citations from other roadmaps.** No id of this roadmap changed. No roadmap on main or at an open head cites the deleted §RD.0.54 line or the renumbered manifest targets.
- **Sources.** One new source was fetched: KED04, arXiv math/0110125v4, open repository, certified. No text was missing, so no `needs-references.toml` was written.
- **Untrusted text.** No instruction-like text was found in the review, the sources or the sibling roadmaps.
