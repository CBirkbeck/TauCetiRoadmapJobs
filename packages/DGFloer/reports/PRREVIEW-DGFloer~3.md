# Review of DGFloer (pull request #963 at b60bf24)

**Verdict:** needs changes

Incremental re-review of the 101 lines changed since `5adf0f9` (62 in `README.md`, 39 in `Suggested.lean`; nothing outside the folder). The diff repairs six of the thirteen r2 findings and introduces one new defect: the Lean form of Lemma 3.41 is false as stated. The gate still fails (31 commit-pinned links, four `UPWARD` lines and a `CYCLE`), so the folder cannot be accepted at this head whatever the text says. Findings marked *carried* are r2 findings this head leaves unrepaired; they are restated briefly with their r2 number, and the r2 report holds the full witnesses.

## R01 (P1) — The Lean statement of Lemma 3.41 is false: it omits `H₀` and puts path-connectedness on one side only

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:58–64`: "(PathConnectedSpace Q ∧ ∀ n, Subsingleton (π_ (n + 2) Q q)) ↔ ∀ i, Subsingleton (H_{i+1}(LoopSpace (LoopSpace Q q) (Path.refl q); ℤ))"; docstring :56–57 "has the homology of a point". README :1583 ("`Ω²Q` has the homology of a point if and only if `Q` is a `K(π,1)`").

**Claim:** For every space `Q` and point `q`, `Q` is path-connected and aspherical iff `H_n(Ω²Q; ℤ) = 0` for all `n ≥ 1`.

**Witness:** The right side says nothing about `H₀`, and `Ω²Q` only sees the component of `q`. Take `Q = K(ℤ, 2)` (`ℂP^∞`, a CW complex in `Type`): `Ω²Q ≃ ΩK(ℤ,1) ≃ ℤ` discrete, so `H_{i+1}(Ω²Q) = 0` for every `i` and the right side holds, while `π₂(Q) = ℤ`, so the left side fails. Simpler still, `Q = Bool` with the discrete topology: `LoopSpace Q q` and `Ω²Q` are one point, the right side holds, and `PathConnectedSpace Bool` fails. The source needs `H₀`: `bdho-floer` (arXiv 2404.07953v3) lines 2753–2766, printed p. 62, states `H_*(Ω²Q) ≅ H_*(pt)` for a closed manifold `Q` and its `j = 2` case argues precisely that `π₂Q ≠ 0` makes `Ω²Q` disconnected so `H₀ ≠ H₀(pt)`. The README's "homology of a point" is the source's statement; the Lean dropped `H₀`.

**Repair:** Put path-connectedness of `Q` on both sides (as a hypothesis) and restore `H₀` through path-connectedness of `Ω²Q`. The following elaborates at the pin with one `sorry` warning (probe file, line 195) and is true for every path-connected `Q`, not only closed manifolds: forward, `π_k(Ω²Q) = π_{k+2}(Q) = 0` for `k ≥ 0` makes `Ω²Q` weakly contractible, hence acyclic; backward, `Ω²Q` is a path-connected H-space, so `π₁` is abelian and `π₁ ≅ H₁ = 0`, and Hurewicz then kills every `π_k`, i.e. every `π_{k+2}(Q)`.

```lean
theorem aspherical_iff_homology_loopSpace_loopSpace (Q : Type) [TopologicalSpace Q]
    [PathConnectedSpace Q] (q : Q) :
    (∀ n : ℕ, Subsingleton (π_ (n + 2) Q q)) ↔
      (PathConnectedSpace (LoopSpace (LoopSpace Q q) (Path.refl q)) ∧
        ∀ i : ℕ, Subsingleton
          (((AlgebraicTopology.singularHomologyFunctor.{0, 0, 1} (ModuleCat.{0} ℤ) (i + 1)).obj
            (ModuleCat.of ℤ ℤ)).obj
              (TopCat.of (LoopSpace (LoopSpace Q q) (Path.refl q))))) := by
  sorry
```

Tests: `Q = ℂP^∞` is now rejected on both sides (`π₀(Ω²Q) = ℤ`); `Q = T²` passes both (`Ω²T²` has contractible components and one component); `Q = S²` fails both (`π₂ = ℤ`, `π₀(Ω²S²) = ℤ`); `Q = S³` fails both (`H₁(Ω²S³) = π₃(S³) = ℤ`). The left side is definitionally `TauCeti.IsAspherical Q q` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59–60` at the pin, `PathConnectedSpace X ∧ ∀ n, Subsingleton (π_ (n + 2) X x)`); if the module is imported (its object file is not built in this checkout and would need `lake build TauCeti.AlgebraicTopology.EilenbergMacLane.Basic`), state the left side as `TauCeti.IsAspherical Q q` and drop the separate `[PathConnectedSpace Q]`, keeping path-connectedness of `Ω²Q` on the right. Correct the docstring to say what is stated.

## R02 (P1) — Supplier cycle DGFloer → TangentialBordism → StringOrientation → DGFloer, and through HomotopySpheres

*Carried: r2 R01, not repaired.* **Location:** `TauCetiRoadmap/DGFloer/README.md:92`, :170 (TangentialBordism B5/B6.3), :55, :93 (HomotopySpheres 4A–4B).

**Witness:** The dependency check at this head prints `CYCLE among: DGFloer, HomotopySpheres, StringOrientation, TangentialBordism`. `TangentialBordism/README.md:142` at its open head consumes DGFloer Layer 1 items 2–3 and `:141` consumes StringOrientation S1.3–S5.3; `StringOrientation/README.md:208`, `:308` at its open head consume DGFloer Layer 1 item 2 and Layer 11 item 3; `HomotopySpheres/README.md:1203` consumes TangentialBordism B3.2. This README consumes TangentialBordism and HomotopySpheres, closing two cycles.

**Repair:** As in r2: move the Layer 10 item 5, Layer 11.2–11.3 and Layer 1 item 5 applications that consume TB and HS into a "DGFloer Part II" placed after TangentialBordism, StringOrientation and HomotopySpheres, so the base roadmap names neither. Test: the check prints no `CYCLE` line and TB B4.2's citation of Layer 1 items 2–3 still resolves.

## R03 (P2) — `UPWARD` lines for ImplicitAtlases and, new at this head, SmoothBundlesConnections

*Carried: r2 R02, not repaired; the SBC line is new.* **Location:** `TauCetiRoadmap/DGFloer/README.md:154` ("**SmoothBundlesConnections B1.4.**"), :1862 (ImplicitAtlases V0–V6).

**Witness:** The check prints `UPWARD: DGFloer (on main) -> SmoothBundlesConnections (#6) at README lines [154]` and `UPWARD: DGFloer (on main) -> ImplicitAtlases (#199) at README lines [1862]`. The SBC line did not appear at `5adf0f9`: there the citation was a pull-request URL the check does not parse; replacing it by the roadmap's name (the repair of r2 R09) made the edge visible. Neither roadmap cites DGFloer upward (`SmoothBundlesConnections/README.md:59` at its open head lists DGFloer as a consumer of B1.4; ImplicitAtlases `:25`, `:848` likewise), so there is no cycle; the lines arise because a roadmap on main is placed before every open pull request. I read both as placement artifacts the board must settle, and record them because the gate rule makes every `UPWARD` line a finding.

**Repair:** None in the text if the board confirms the placement reading; otherwise Layer 1 item 7's homogeneous examples and 7.C.5c's virtual application move with R02's Part II.

## R04 (P2) — Supplier labels that exist only at revision pull-request heads, not on main

*Carried: r2 R04, not repaired.* **Location:** `TauCetiRoadmap/DGFloer/README.md:84` (HeegaardFloer F2.6c1), :309–312 (F1.5), :1149–1153 (F1.4, F1.5), :1183 (F0, F1.1–5), :854 (GeometricTopology Layer 3 restriction bundle).

**Witness:** `grep -c -E 'F1\.5|F2\.6c|F1\.4'` on main's `TauCetiRoadmap/HeegaardFloer/README.md` returns 0 at this review's main (`9c6e95d`); the labels exist only at the revision head of HeegaardFloer. HeegaardFloer is on main, so it is cited as on main.

**Repair:** As in r2: cite main's lanes (F1, F2, M), and for each item main does not state declare a supplier gap `What HeegaardFloer must provide (gap:<slug>)` with a matching `gaps` entry, or own it here.

## R05 (P2) — End theorems still named by source number only

*Carried: r2 R07, not repaired; re-raised from r1 R11.* **Location:** `TauCetiRoadmap/DGFloer/README.md:1519`, :1575–1579, :1605–1607, :1673. **Witness and repair:** as in r2 R07 (state Theorem 3.49's existence and convergence with its boundedness hypotheses, Theorems L and M with `j_!(α) ≠ 0` and `i_{W*}(α) = 0`, Theorem H with the definition of abundance, Theorem G with its hypotheses; test on `α = 0`).

## R06 (P2) — The Cayley plane is still excluded from Proposition 6.39

*Carried: r2 R08, not repaired; re-raised from r1 R12.* **Location:** `TauCetiRoadmap/DGFloer/README.md:49–50`. **Witness and repair:** as in r2 R08 (`bdho-floer` line 5247 includes it; no owner anywhere; own `𝕆P² = F₄/Spin(9)` with its Morse–Bott data, test `H₁₄(Ω𝕆P²) = ℤ`).

## R07 (P3) — Commit-pinned links remain

*Carried: r2 R09, partly repaired.* **Location:** `TauCetiRoadmap/DGFloer/README.md:22`, :84–93, :109–178, :309, :1183, :1401 (24 links `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…`, 31 gate hits), :476–477 (two links into the TauCeti repository at snapshot `720bf8c…`, beyond the pin `358314d4`).

**Witness:** Gate `blob = 31`. The pull-request URLs, the "snapshot … beyond this repository's pinned a91d3aaf" sentence and the unexpanded "CC" are gone (repaired); the roadmap-repository links pinned to commits and the two TauCeti snapshot links remain.

**Repair:** Replace each by a path on main (`../<Roadmap>/README.md`) or the roadmap's name and section; for lines 476–477 name the modules (`TauCeti.Topology.Homotopy.SerreFibration.Basic`, `….FiberBundle`) without a link, as the Inventory sentence now does.

## R08 (P3) — README shape: no target subsections, `*Needs:*` lines, Checks, Examples or Dependencies

*Carried: r2 R11, not repaired; re-raised from r1 R14.* `grep -c 'Needs:'` = 0, `grep -c 'Checks'` = 0, no `### Examples` heading. Repair as in r2 R11.

## R09 (P3) — No `sources.toml`

*Carried: r2 R12, not repaired; re-raised from r1 R17.* The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and main's generated `PROGRESS.md`, `STATUS.md`. Repair as in r2 R12.

## Previous findings

- R01 — not repaired: the check prints `CYCLE among: DGFloer, HomotopySpheres, StringOrientation, TangentialBordism`; lines 55, 92–93, 170 still consume HS and TB (this report's R02).
- R02 — not repaired: `UPWARD … ImplicitAtlases` at line 1862 remains, and the new name citation at line 154 adds `UPWARD … SmoothBundlesConnections` (R03).
- R03 — repaired: Layer 0 item 3 (:440–442, :451–460), Layer 1 item 3 (:676–678), Layer 8 item 6 Theorem J (:1512) and the coordination note (:217–220) all read "Serre fibration over a path-connected base"; Layer 3 item 2 (:975–979) is stated for a map, with `F → F'` a weak equivalence for Serre and a homotopy equivalence for Hurewicz fibrations.
- R04 — not repaired: HeegaardFloer F1.4, F1.5, F2.6c1 and the GT restriction bundle are still cited and still absent from main (R04).
- R05 — repaired: F0–F4 deleted; line 87 cites HamiltonianReduction R1a.0–R1a.4, which exist on main (`HamiltonianReduction/README.md:75`, :89, :97, :105, :109) and state exactly the flux, kernel, quotient, torus lattice and compact-support items the line attributes to them; no flux construction remains in 7.T or G0–G7 (7.T.1 "retain its flux", :1405).
- R06 — repaired, with a new defect introduced: `mod2Vanishing`, `aspherical_iff_homology_loopSpace_loopSpace` and `exists_eilenbergMacLane` are stated (:48–71) and the docstring names the missing carriers (:21–22); the second statement is false as written (R01).
- R07 — not repaired: ":1519 The spectral sequence (Theorem 3.49)", ":1579 Theorem M (= Theorem 6.4)" unchanged (R05).
- R08 — not repaired: ":49 The Cayley plane in Proposition 6.39. It needs the octonionic projective plane" unchanged (R06).
- R09 — partly repaired: no `pull/NNN` URL remains, the snapshot sentence is replaced (:376), "CC" is expanded (:492); 24 commit-pinned roadmap links and two TauCeti snapshot links remain (R07).
- R10 — repaired: `⊕_{x∈P} R[ind x]` (:1030), `⊗_{C_*(Ω_p B)}` (:1087) and `m^(η₀^−1)_{x,y}=…` (:1537) are in code spans; gate `tex = 0`.
- R11 — not repaired: no `*Needs:*`, Checks, Examples or Dependencies (R08).
- R12 — not repaired: no `sources.toml` (R09).
- R13 — repaired: ":1085 within-level gap 3 and successive-level gap 4d−1" (values below).

## Verified sound

**Gate.** My rerun of the dependency check printed exactly:

```text
UPWARD: DGFloer (on main) -> HomotopySpheres (#63) at README lines [55, 93]
UPWARD: DGFloer (on main) -> ImplicitAtlases (#199) at README lines [1862]
UPWARD: DGFloer (on main) -> SmoothBundlesConnections (#6) at README lines [154]
UPWARD: DGFloer (on main) -> TangentialBordism (#8) at README lines [92, 170]
CYCLE among: DGFloer, HomotopySpheres, StringOrientation, TangentialBordism
depcheck: 209 roadmaps, 1476 edges, 5 problem(s)
```

The worker's gate: `blob = 31`, `depcheck = 5`, `build = 1`, every other scanner zero (`set_option`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `imports`, `stray-files`, `outside-folder` all 0). The `build` entry is the toolchain's "imports `Mathlib` … consider adding `module`" notice, as in r2: `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` from the worktree prints only the five `sorry` warnings (lines 39, 48, 58, 68, 141), nothing else. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.

**Elaboration and signatures.** A scratch copy with `#check @name` for all nine declarations elaborated; every type agrees with the worker's `signatures.md`. The three "dropped" binders (`IsScalarTower R Aᵐᵒᵖ M`, `DecidableEq P`, `GradedSMul`) are, as in r2, not mentioned by the types of `gradingInvolution`, `totalGrading`, `twistedDifferential`, whose bodies elaborate without them; `twistedDifferential_sq` keeps all of them. The four Layer 1 theorems have no section variables to lose. One-tactic probes on the three new theorems (`simp`, `infer_instance`, `rfl` as applicable) all fail: no padding. No `set_option`, no sorried data, no `lemma`, no admitted `example`; imports are `import Mathlib` and one existing `TauCeti.*` module.

**Source sample.** The six seeded targets (7.C paragraphs at README :1181, :1280, :1284, :1292, :1318, :1373) are byte-identical to `5adf0f9` (same line numbers, same text); their r2 rows carry forward below, and r2's caveat stands: they have no theorem locator of their own (Hutchings' notes not legally readable, FHS 1995 paywalled), so they were checked for internal consistency against 7.C.0–7.C.2a. Locators re-read this round in `bdho-floer` (arXiv 2404.07953v3, cache text 139 pages): Theorem J, lines 640–648, printed p. 15 (Serre fibration `F ↪ E → 𝓛₀X`, isomorphism `FH_*(H,J,Ξ;𝓕) ≅ H_{*+n}(E|_X)` as the limit of a spectral-sequence isomorphism); Lemma 3.41, lines 2753–2771, printed p. 62 (closed manifold, `H_*(Ω²Q) ≅ H_*(pt)` iff `K(π,1)`, with the `j = 2` case through `H₀`); the proof of Theorem 5.15, lines 4300–4329, printed p. 104 (the `G ⊗ ℤ₂ = 0` class, Theorem 5.12 applied to `Ω₀Q`, universal coefficients).

**Adversarial table.** New rows for every changed statement; the untouched statements' rows are carried from r2 (cited as "r2 row") with their values.

| Statement / location | Instances | Values on the two sides | Result |
|---|---|---|---|
| Lemma 3.41, Lean :58 | `Q = ℂP^∞ = K(ℤ,2)` | `Ω²Q ≃ ℤ` discrete: `H_{i+1} = 0` ∀i, right side true; `π₂(Q) = ℤ`, left side false | **Fails: R01** |
| same | `Q = Bool` discrete, `q = true` | `ΩQ = Ω²Q = pt`: right side true; `PathConnectedSpace Bool` false | **Fails: R01** |
| same | `Q = T²`; `Q = S²`; `Q = S³` | `Ω²T²`: components contractible, one component, both sides true; `S²`: `π₂ = ℤ`, `π₀(Ω²S²) = ℤ`, `H₁(Ω²_0S²) = H₁(Ω²S³) = ℤ`; `S³`: `π₃ = ℤ`, `H₁(Ω²S³) = ℤ` | pass on these; the two instances above refute the statement |
| repaired form (probe :195) | the five spaces above | `ℂP^∞`: `π₀(Ω²Q) = ℤ` so right side now false; `Bool` excluded by the hypothesis; `T²` both true; `S²`, `S³` both false | true for every path-connected `Q` (H-space Hurewicz argument in R01) |
| `mod2Vanishing`, Lean :48 | `Y = K(ℤ/3, 2)` | `H̃_*(Y;𝔽₂) = 0` (ℤ/3 is a `ℤ[1/2]`-module); `g ↦ 2g` on ℤ/3 is `0↦0, 1↦2, 2↦1`, bijective | Pass |
| same | `Y = K(ℤ/4, 2)`; `Y = S²`; `Y = pt` | `H₂(K(ℤ/4,2);𝔽₂) = ℤ/4 ⊗ 𝔽₂ = 𝔽₂ ≠ 0`, excluded, and `×2` on ℤ/4 is not injective; `H₂(S²;𝔽₂) = 𝔽₂`, excluded; `pt`: hypothesis holds, all `π` trivial, bijective | Correct negative controls; `n = 0` gives `π₁ = 0` by `SimplyConnectedSpace` |
| same, hypothesis equals README :694 | universal coefficients | `H_n(Y;𝔽₂) = H_n ⊗ 𝔽₂ ⊕ Tor(H_{n−1}, 𝔽₂)`; vanishing for all `n ≥ 1` iff `×2` bijective on every `H_n`, `n ≥ 1` (`Tor(H₀,𝔽₂) = 0`) | Lean hypothesis = "`H̃_*(Y;𝔽₂) = 0`" |
| `exists_eilenbergMacLane`, Lean :68 | `A = 0`; `n = 0, A = ℤ`; `n = 0, A = ℤ/2`; `n = 1, A = ℤ` | `pt`; `S¹` (`π₁ = ℤ`, higher 0); `ℝP^∞`; `ℂP^∞` (`π₂ = ℤ`, `π₁ = 0` since `k = 0 ≠ 1` is included) | Pass; `π_{n+1}` abelian is forced by `A` commutative, consistent for `n = 0` |
| Theorem J scope :1512 | locally trivial bundle over a non-paracompact base; Hurewicz fibration | Serre fibration (Layer 1 item 2 :513–517), now covered; Hurewicz ⊂ Serre | Pass; matches `bdho-floer` line 640–641 |
| Cubical sequence hypothesis :440–442 | Serre's Théorème 1 | `E¹ = C(B, H(F))` needs lifting of cubes only (r2: `serre-1951` lines 1001–1030, p. 448); `E² = H(B, H(F))` | Pass; "nowhere else" agrees with Serre's proof structure |
| Comparison :451–460 | Hopf `S¹ → S³ → S²` (Hurewicz); `S² × S¹ → S²` | both sequences: ℤ at `(0,0),(2,0),(0,1),(2,1)`, `d²: E²_{2,0} → E²_{0,1}` of rank 1, total degrees 0 and 3 survive; product: ranks `(1,1,1,1)` | Pass on instances; target remains |
| Comparison, Serre non-Hurewicz instance | locally trivial bundle over the long line `L` (not paracompact) | Serre fibration by `mem_serreFibrations_proj` (:513); the CW side goes through CW approximation of `L`, the cubical side is stated on `L` directly | statement covers it; the previous Hurewicz form excluded it |
| Layer 3 item 2 `F → F'` :975–979 | `p : E → pt` | `E' = E`, `F = F' = E`, inclusion is the identity | Pass |
| same | `p : pt → S¹`, `b ≠ p(pt)` | `F = ∅`, `F' = {Moore paths from `p(pt)` to `b`} ≠ ∅`: not a weak equivalence, and `p` is not a Serre fibration (a Serre fibration with nonempty total space over a path-connected base is onto) | Correct negative control |
| same, Serre case | LES of `p` and of `p'` | `E → E'` is a homotopy equivalence for every `p`; five lemma on the two long exact sequences (each basepoint of `F`) gives `π_*(F) ≅ π_*(F')` | weak equivalence, as stated |
| same, Hurewicz case | map of Hurewicz fibrations over `B` | a fibrewise map that is a homotopy equivalence is a fibre homotopy equivalence (Dold), so `F → F'` is a homotopy equivalence | as stated; README :888–892 |
| HamiltonianReduction R1a.3 cited at :87 | `(T², A dx∧dy)`, translation `a∂_x + b∂_y` | `ι_Xω = A(a dy − b dx)`, flux `A(a[dy] − b[dx])`: integral lattice `A·H¹(T²;ℤ)` | agrees with `HamiltonianReduction/README.md:107` |
| R1a.0–R1a.4 attribution :87 | the five items named | flux + homotopy invariance (R1a.0 :75), Hamiltonian kernel (R1a.1 :89), `1→Ham→Symp₀→H¹_dR/Γ_ω→0` (R1a.2 :101), torus lattice (R1a.3 :105), `H¹_c` version (R1a.4 :109) | each item exists on main |
| HPᵈ labels :1085 | `ΩHPᵈ ≃ S³ × ΩS^{4d+3}`, `d = 1, 2` | cells in degrees `(4d+2)k`, `(4d+2)k + 3`; within level `3`; to the next level `(4d+2)(k+1) − ((4d+2)k + 3) = 4d − 1` (`= 3` at `d = 1`, `7` at `d = 2`) | Pass (R13 repaired) |
| Docstring :18–22 | the headline inventory | loop spaces of the fixed-interval model exist (`LoopSpace`, `Mathlib/Topology/Homotopy/HomotopyGroup.lean:86`); Moore loops, Serre carrier, Liouville domains, Floer complexes absent at the pin | Correct, once R01's docstring sentence is fixed |
| Serre filtration :433–438 (r2 row) | `p = id : I → I`, 1-cube `id` | not in `F_0`, in `F_1`; the "factors through some cube" variant would put every cube in `F_1` | Pass |
| `F_s = 0` for `s < 0`, `= C_n` for `s ≥ n` :439 (r2 row) | `n = 0` | `pr_0` constant, every 0-cube qualifies | Pass |
| Cubical SS on `F → F → pt` (r2 row) | `B = pt` | `E¹_{0,q} = H_q(F)`, columns `s > 0` zero | Pass |
| Index SS iso from `E²` :1062 (r2 row) | trivial system on `T²`, `n = 1` | `E²` in `q = 0`, ranks `(1,2,1)` | Pass |
| Serre's degeneracy :246 (r2 row) | `c × id_I` | depends on the last coordinate (Serre) but is degenerate (Massey) | README's convention stands |
| Moore counterexample :269–276 (r2 row) | `γ_n(t) = (sin 2πnt, 1 − cos 2πnt)/(2πn)` | speed 1, sup-distance `≤ 1/(πn)`, limit duration 0 | Pass |
| Serre class instances :688–692 (r2 row) | `0→ℤ/2→ℤ/4→ℤ/2→0`; `ℚ ⊃ ℤ` | fixed exponent fails on ℤ/4; `ℤ ⊗ ℤ/2 ≠ 0` | Pass |
| Directed union :718–723 (r2 row) | `ℤ[1/2] = ⋃ 2^{−r}ℤ` | transitions `×2 = 0` on `H₁(−;𝔽₂)`, colimit 0 | Pass |
| One-step lemma :826–839 (r2 row) | `Y = S²`, `n = 3` | `0 = π₂(E) → π₂(S²) = ℤ → 0` impossible | Correct negative control |
| Theorem C step :1596–1599 (r2 row) | `π₂(Q) = 0` | `π₁(Ω₀Q) = π₂(Q) = 0` | Pass |
| `K(ℤ[1/2],1)` homology :808–814 (r2 row) | `2^{−r}ℤ ⊂ 2^{−r−1}ℤ` | inclusion is `×2`, mod-2 `H₁` map zero | Pass |
| Liouville non-converse :1126–1130 (r2 row) | `λ = p dq`, `Z = p∂_p + ∂_q` | `ι_Zω = λ − dp`, `L_Zω = ω` | Pass |
| Cotangent signs :343–349 (r2 row) | `T*ℝ` | `ω_can(∂_q,∂_p) = 1`, `ι_{p∂_p}(dq∧dp) = −p dq` | Pass |
| Hamiltonian bridge :340–342 (r2 row) | `H = p²/2` | `ν_*(p∂_q) = −p∂_q = X_{ω_can,−p²/2}` | Pass |
| Magnetic translation :1118–1122 (r2 row) | `Ψ'_σ(q,p) = (q, p − σ_q)` | `Ψ'^*ω_can = ω_can + π^*dσ` | Pass |
| Convention and application checks :1181 (r2 row, seeded) | `ℂPⁿ`, `N_C = n+1` | Floer degree `j − n` mod `2(n+1)`; `n+1` even residues distinct | Pass |
| Cap change :1189 (r2 row) | `D' − D = A` | `μ(x,D') = μ(x,D) + 2c₁(A)` | Consistent |
| Tame synthesis and staged selection :1280 (r2 row, seeded) | `D exp_A(B) = ∫₀¹ e^{(1−t)A} B e^{tA} dt` | `J(A)² = −1` for anti-J `A`; tameness open in `C⁰` | Pass |
| Tame raw sign realization :1284 (r2 row, seeded) | `(−1)^{i+j+ij}` at `j = 1` | `−1`; with `(−1)^n` gives `(−1)^{n+1}`; Morse zero-face exponent `2k` | Consistent with 7.C.2a |
| Separate finite counting budgets :1292 (r2 row, seeded) | `ω(A) = κc₁(A)` | index bounds `c₁`, hence energy; `c₁ = 0` branch keeps cutoff | Pass |
| 7.C.3 `c₁ = 0` codimensions :1298 (r2 row) | one-marked sphere in `X × S¹` | `−4`; index-`k` quotient `k − 3`; stationary `−3` | Pass |
| 7.C.3a dimension :1312–1314 (r2 row) | `r` simple spheres, `r − 1` nodes | `2(Σc₁(B_j) − c₁(A_end)) − 2r` | Identity verified |
| Regular true endpoint and energy-dependent neighborhood :1318 (r2 row, seeded) | constant-core model | `∂̄` kernel `TX`, cokernel 0, isolated at index zero | Consistent with 7.C.3a |
| 7.C.6a Γ model :1371 (r2 row) | `ω = κc₁` | `Γ ≅ N_Cℤ` or 0 | Pass |
| Positive-monotone finite Laurent matrices :1373 (r2 row, seeded) | `Γ ≅ N_Cℤ` | `deg t = 2N_C`, `ν(t) = −κN_C < 0`, one exponent per homogeneous entry | Pass |
| 7.C.6f unit obstruction :1383 (r2 row) | `ν(B) > 0`, `R ≠ 0` | `1 − e^B` a unit in the completion, `t ↦ 1` kills it | Pass |
| 7.T.6 index jump :1449; tail :1451 (r2 rows) | `CZ(A±ε)`; `β' = −κβ²` | `ind_+ − ind_− = +1`; `∂_s^kβ ≍ s^{−k−1}` | Consistent |
| 7.T.7 death factor :1465–1467 (r2 row) | odd `i`, `a = 1 + b` | ratio `(1+b)^{(−1)^{i+1}}` | Consistent |
| 7.T.9 point model :1485 (r2 row) | `M = pt` | `CF_even = ℤ`, `CF_odd = 0`, `τ_F = 0`, `ζ_F = 1`, `I_F = 0` | Pass |
| Lemma 6.35 values :1651; splitting range :1652; rotation degree :1657 (r2 rows) | `π₈(SO(9)) = (ℤ/2)²`, `n = 7`, odd `n` | tables agree; splitting false at 7; `1 + (−1)^{n−1} = 2` | Pass |
| Projective loop homology :1081–1083; higher differentials :1091 (r2 rows) | `ΩℂPᵈ ≃ S¹ × ΩS^{2d+1}` | ℤ in `2dk`, `2dk+1`; `d_{2d}: E_{2d,1} → E_{0,2d}` | Pass / plausible as stated |
| Fubini–Study scale :863–865 (r2 row) | `ℂP¹` radius 1/2 | area π, `∫ω_FS = 1` | Pass |
| Compact Lie bridge :1649; evaluation bundle :854 (r2 rows) | `SU(2)`, `T²`; `S² ⊔ T²` | `π₃(SU(2)) = ℤ`; orbit `O = S²`, fibre over `T²` empty | Pass |
| `TwistingCocycle` degrees, Lean :87 (r2 row) | `m x z * m z y` | degree `ind y − ind x + 2 = deg d(m x y)` | Consistent |
| `twistedDifferential` vs README :1019, Lean :128 (r2 row) | `f = Pi.single x α`, `α ∈ ℳ q` | `∂α⊗x + (−1)^{|α|} Σ_y α·m_{x,y}⊗y` | Agrees |
| `twistedDifferential_sq`, Lean :141 (r2 row) | Leibniz rules at the pin | `(D²f)(z) = op(d(m x z) − Σ_y (−1)^{ind x − ind y} m x y * m y z) • α = 0`; `P = ∅`, `m = 0`, `M = 0` give `D² = 0` | True |
| One-sidedness :1001–1002; action dependence (r2 rows) | `ℚ[ε]/(ε²)`, `m_{x,x} = ε`; `A = ℚ×ℚ` | `∂ε = 0 = ε·ε`; projections give `1⊗y` versus 0 | Pass |
| `hurewiczOne`, Lean :39 (r2 row) | `pt`, `S¹`, `BS₃`, `BQ₈` | abelianizations `0, ℤ, ℤ/2, (ℤ/2)²` = `H₁` | Pass |
| `gradingInvolution` body, Lean :100 (r2 row) | `α ∈ ℳ q`, `q = 0,1,2` | `α, −α, α` | Correct |

**Pinned-library audit** (Mathlib `f6090c70`, TauCeti `358314d4`, the manifest of this branch):

| Declaration | File and line at the pin | Content and limitation |
|---|---|---|
| `TauCeti.IsAspherical` | `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59–60` | `PathConnectedSpace X ∧ ∀ n, Subsingleton (π_ (n + 2) X x)`: the left side of Lemma 3.41 verbatim; no object file in this checkout |
| `LoopSpace`, `HomotopyGroup.Pi` / `π_` | `Mathlib/Topology/Homotopy/HomotopyGroup.lean:86`, :458, :461 (scoped `Topology`, hence `open scoped Topology` at Lean :32) | fixed-interval loops `Path x x`; `π_ 0` is not a group, the statements use `n + 1`, `n + 2` |
| `SimplyConnectedSpace` | `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40` | implies path-connected and nonempty: `mod2Vanishing` needs no separate `PathConnectedSpace` |
| `singularHomologyFunctor`, `ModuleCat.of` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52` | `Module (ZMod 2) (ZMod 2)` must be given explicitly, as the file does at :51 |
| `TauCeti.IsDGRightModule`, `TauCeti.IsDGAlgebra` | `DG/Module/Right/Defs.lean:68–79`, `DG/Algebra/Defs.lean:182–189` | unchanged since r2 |
| `serreFibrations`, `mem_serreFibrations_proj`, `hasHomotopyLiftingProperty_proj_cube` | absent from the pinned TauCeti tree; named as targets in main's `AlgebraicTopology/README.md:111`, :910–913 | cited here as supplier targets, which the Inventory sentence (:376) now says |

**Cross-roadmap citations resolved this round** (main `9c6e95d`; open heads as given):

| Citation | Found at | Note |
|---|---|---|
| HamiltonianReduction R1a.0–R1a.4 | main `SymplecticGeometry/HamiltonianReduction/README.md:75`, :89, :97, :105, :109 | each item's content matches line 87's attribution |
| CharacteristicClasses C1.2 | main `CharacteristicClasses/README.md:84`, :89, :419–441 (C1.2a, C1.2b) | owns the singular-realization counit weak equivalence |
| ComplexKahlerGeometry K7.1, K7.2 | main `ComplexKahlerGeometry/README.md:1407`, :1444 | relative link resolves |
| SmoothBundlesConnections B1.4 | `rev SmoothBundlesConnections/README.md:29–31` (slice theorem, free proper quotient), :59 lists DGFloer as its consumer | resolves; `UPWARD` placement line (R03) |
| LieGroups Layer 2 | main `RepresentationTheory/LieGroups/README.md:275` | unchanged from r2 |
| AlgebraicTopology `TauCeti.TopCat.serreFibrations` and Stage 5.5 | main `AlgebraicTopology/README.md:111`, :910–913 | the carrier is AT's target, consumed here |
| TangentialBordism, StringOrientation, HomotopySpheres edges | `rev TangentialBordism/README.md:141–142`; `rev StringOrientation/README.md:208`, :308; `rev HomotopySpheres/README.md:1203` | the cycle of R02 |
| `tauceti-roadmap roadmaps resolve` | 0 cross-roadmap citations found nowhere; 3 Lean names (`serreFibrations`, `mem_serreFibrations_proj`, `hasHomotopyLiftingProperty_proj_cube`) | the three are AT's targets, not this roadmap's |

Ownership against open work was not re-run this round beyond the suppliers above; r2's search (cubical Serre filtration, Moore loops, twisting cocycles, global flux, Cayley plane, Hurewicz predicate) stands, and the only second owner it found, HamiltonianReduction R1a, is now cited instead of restated. Open pull requests not indexed by the tooling were not checked.

**Headline inventory.**

| Headline | Statable at the pins | In `Suggested.lean` |
|---|---|---|
| Hurewicz in degree one | yes | yes (existence form) |
| Twisted square-zero (Layer 4 item 2) | yes | yes |
| Mod-2 vanishing (1.4) | yes | yes |
| Lemma 3.41, fixed-interval model (10.4) | yes | yes, but false as written (R01) |
| Existence of `K(A, n)` (1.4) | yes | yes |
| Cubical and CW Serre spectral sequences, comparison, convergence | no (cubical chains, Serre carrier absent) | named in docstring |
| Fibration theorem, DG Morse/Floer homology, Theorem J, `SH` with DG coefficients, Theorem K | no (Moore loops, Liouville domains) | named in docstring |
| Theorems A–E, H, I, G, L, M; 7.C Arnold bound; 7.T torsion | no (Floer complexes) | named in docstring |

## Not verifiable

- **Hutchings' lecture notes, FHS 1995, PSS 1996** (7.C's sources): as in r2, no legal copy or paywalled; the six seeded targets were checked for internal consistency only, and they are unchanged at this head.
- **HeegaardFloer F1.4's Conley–Zehnder normalization**: the item is not on main (R04), so 7.C.0's sign bridge is still unchecked against its supplier.
- **Dold's fibre-homotopy-equivalence theorem over an arbitrary base** (Layer 3 item 2's Hurewicz clause): I used the statement without a numerable-cover hypothesis (May, *A Concise Course*, Ch. 7; tom Dieck, *Algebraic Topology*, §5.5); neither text is in the cache and I did not re-read the proof this round.
- **Open pull requests without files in this brief** (HamiltonianSystems #480, CompactSupport #196) were not read.

## Source issues

- **Error** in bdho-floer at the proof of Theorem 5.15, printed p. 104 (lines 4322–4323): the source says the abelian groups with `G ⊗ ℤ/2 = 0` form a class in the sense of Serre; it should use the uniquely 2-divisible groups (`ℤ[1/2]`-modules), since `ℚ` has `ℚ ⊗ ℤ/2 = 0` and its subgroup `ℤ` does not; affects the proof (the README's mod-2 vanishing theorem supplies the needed step).
- The three further issues recorded in r2 (Lemma 4.5(1) retraction, Lemma 6.35's `π₈(SO(9))`, Theorem 3.49(ii)'s coefficient system) are in passages this round did not re-read and stand as recorded there.
