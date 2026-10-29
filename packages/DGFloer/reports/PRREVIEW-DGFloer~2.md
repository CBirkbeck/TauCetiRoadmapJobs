# Review of DGFloer (pull request #963 at 5adf0f9)

**Verdict:** needs changes

This is a full review of the folder `TauCetiRoadmap/DGFloer/` at the head. The pull request itself changes 58 README lines (Layer 0 item 3, one bullet each in Layer 1 item 3, Layer 5 item 4 and Layer 8 item 6, the "Prior formalization" section) and rewrites `Suggested.lean`; the other 1400 changed lines since the previous review's head are main's own merges (#900 and the generated progress files). Findings marked *inherited* are in passages the pull request does not touch; they fail at this head and on main's copy alike, and the README is the only place this pull request can repair them.

## Repair status of the previous review (r1 at ec50951)

| r1 | Status at 5adf0f9 | Where |
|---|---|---|
| R01 Serre carrier and homotopy LES | Partly: Layer 1 item 2 now owns the LES "including components" and the arbitrary-base sequence; but it still rests on `TauCeti.TopCat.serreFibrations`, absent at the pin (see R09) | README 512–574, 379 |
| R02 admitted data | Repaired: `gradingInvolution` has a real body, Moore-path API deleted | Suggested.lean 69–71 |
| R03 kification | Repaired: homeomorphism claimed only for metrizable targets with compact metric or exhausted sources | README 296–301 |
| R04 dimension bounds | Repaired: d ≥ 1 for CPᵈ/HPᵈ with d = 0 a point, odd n ≥ 3 for Lemma 6.35 | README 1081, 1085, 1650 |
| R05 Morse–Bott supplier | Repaired: Riem R2/R3 and MorseTheory M5 cited, HS 4B as instantiation | README 180–183, 231 |
| R06 Chern versus graph Maslov | Repaired in substance (factor 2 stated), but through HF F1.5, which does not exist on main (R04 below) | README 311–317 |
| R07 evaluation bundle | Repaired: connected case O = M, disconnected case over the orbit | README 858 |
| R08 generic bar and Hurewicz predicate | Repaired: AT 8.8 bar model aliased, GC G2.10 predicate consumed | README 698–701, 879 |
| R09 unconditional realization | Repaired as a target (TB B5/B6.3 and GC G5 consumed); this is the TB edge of the cycle in R01 below | README 1593–1595 |
| R10 Hurewicz headline | Repaired | Suggested.lean 36–40 |
| R11 source-number placeholders | Not repaired (R07 below) | README 1519, 1575–1580, 1605–1607, 1673 |
| R12 omitted cases | Half: the non-torus compact-Lie bridge is now a target (11.3); the Cayley plane is still excluded (R08 below) | README 49–50, 1649 |
| R13 import header | Repaired | Suggested.lean 1–2 |
| R14 README shape and Checks | Not repaired (R11 below) | whole README |
| R15 process references | Partly: no `#NNN`; pull-request URLs, commit-pinned links and a stale pin hash remain (R09 below) | README 157–159, 379, 859 |
| R16 padding | Repaired | Suggested.lean |
| R17 sources manifest and locators | Not repaired (R12 below) | folder |

## R01 (P1) — Supplier cycle DGFloer ↔ TangentialBordism (and through HomotopySpheres)

**Location:** `TauCetiRoadmap/DGFloer/README.md:92`, :174 ("TangentialBordism B5/B6.3 supply Thom/PT/rational bordism inputs"); :93, :175–181 (HomotopySpheres 3A, 3B item 3, 4A–4B, 5). *Inherited.*

**Claim:** TangentialBordism and HomotopySpheres are suppliers of this roadmap.

**Witness:** The dependency check prints `CYCLE among: DGFloer, HomotopySpheres, TangentialBordism`. `TauCetiRoadmap/TangentialBordism/README.md:34` at its open head consumes DGFloer Layer 1 items 2–3 (the ordinary Serre spectral sequence); `TauCetiRoadmap/HomotopySpheres/README.md:1203–1208` at its open head consumes TangentialBordism B3.2; this README consumes both. Line 174's sentence "No whole-roadmap reverse dependency is imposed" does not remove the edge: the merge order is per roadmap.

**Repair:** Break the cycle by moving ownership, not by wording. The consumers of TB and HS here are Layer 10 item 5 (multiple realization: TB B5, B6.3, GC G5), Layer 11.3 (HS 4A–4B stable Bott), Layer 11.2/Layer 2 item 3 (HS 3A convenient spaces, 3B James) and Layer 1 item 5 (HS Stage 5 collapse). Move those applications into a "DGFloer Part II" roadmap placed after TangentialBordism and HomotopySpheres, whose introduction says the base roadmap stops at the DG Floer toolset, Viterbo and the criteria; the base roadmap then names neither TB nor HS. Test: after the move the check must print no CYCLE line and TB B4.2's citation of Layer 1 items 2–3 still resolves. The two `UPWARD` lines for HomotopySpheres and TangentialBordism are the same defect and disappear with it.

## R02 (P2) — `UPWARD` line for ImplicitAtlases

**Location:** `TauCetiRoadmap/DGFloer/README.md:167`, :1365, :1862 (ImplicitAtlases V0–V6 in 7.C.5c). *Inherited.*

**Claim:** ImplicitAtlases is a legitimate supplier.

**Witness:** The check prints `UPWARD: DGFloer (on main) -> ImplicitAtlases (#199) at README lines [1862]`. ImplicitAtlases cites DGFloer only as a downstream consumer (`rev ImplicitAtlases/README.md:25`, :848), so there is no cycle. The line arises because the tool places a roadmap on main before every open pull request. I believe this particular line is a placement artifact, since this brief's own list of permitted suppliers names ImplicitAtlases; it is recorded here because the gate rule makes every `UPWARD` line a finding, and the board should settle it.

**Repair:** None in the text if the board confirms the placement reading; otherwise the 7.C.5c virtual application moves to the Part II roadmap of R01, which is placed after ImplicitAtlases as well.

## R03 (P2) — The cubical Serre spectral sequence, its comparison and Theorem J are narrowed from Serre fibrations to Hurewicz fibrations

**Location:** `TauCetiRoadmap/DGFloer/README.md:443`, :453–462 ("For a Hurewicz fibration, the comparison enters…", "It is stated for a Hurewicz fibration. A Serre fibration enters only through…"), :1512 (Theorem J "for a Hurewicz fibration"), :977 (Layer 3 item 2). The first two are this pull request's text.

**Claim:** The cubical sequence and Theorem J need Hurewicz fibrations.

**Witness:** The source states Theorem J for a Serre fibration: `bdho-floer` line 640–648, printed p. 15, "Let F ↪ E → 𝓛₀X be a Serre fibration … the limit of an isomorphism between the DG Floer spectral sequence and the Leray–Serre spectral sequence"; line 2732 attaches the DG local system to any Serre fibration. Serre's construction is for his "espaces fibrés", defined by homotopy lifting for finite polyhedra (`serre-1951` line 795–800, printed p. 443), with E¹ = C(B, H(F)) (line 1065, p. 448) and E² = H(B, H(F)) (line 1150, p. 451) under that hypothesis only; the E¹ computation (Prop. 4, Lemmas 4–5, lines 1001–1030) uses cube lifting and nothing more.

**Repair:** State Layer 0 item 3 for Serre fibrations over a path-connected base (Serre's hypothesis), the comparison with Layer 1 item 2 for Serre fibrations, and Theorem J as the source states it. Layer 3 item 2 then reads "the DG local system of a map p is C_*(F') for the Moore-path replacement; when p is a Serre fibration F → F' is a weak equivalence, when p is Hurewicz a homotopy equivalence". Instance: a locally trivial bundle over a non-paracompact base is a Serre fibration (Layer 1 item 2 even cites `mem_serreFibrations_proj` for it "with no paracompactness hypothesis") and Theorem J must apply to it; the Hurewicz form excludes it although every input of the proof (Theorem 3.37, Theorem 3.39, BDHO Theorem A through the replacement) is available.

## R04 (P2) — Supplier labels that exist only at revision pull-request heads, not on main

**Location:** `TauCetiRoadmap/DGFloer/README.md:312–317` (HeegaardFloer F1.5), :1149–1155 (F1.4, F1.5), :1183 (F0, F1.1–5, F2.1–5, F2.6a–d), :84 (F2.6c1), :1202 (Lane M M1–M6), :1236 (HF M.3), :857 (GeometricTopology Layer 3's "compact-embedding restriction bundle onto the actual Diff orbit"). *Inherited.*

**Claim:** These sections exist in the cited roadmaps.

**Witness:** HeegaardFloer and GeometricTopology are on main, so they are cited as on main. Main's `TauCetiRoadmap/HeegaardFloer/README.md` (344 lines) has lanes M, F0–F5 as headings (:142–:246) and no item numbered F1.4, F1.5, F2.6c or M.8 (`grep 'F1\.5'` finds nothing); those labels exist only at the revision pull request's head (`rev HeegaardFloer/README.md:244`, :1443, :1669). Main's `GeometricTopology/README.md` Layer 3 (:360–:388) has `Diff(M)`, the smooth-families map and `O(n+1) → Diff(Sⁿ)` but no restriction bundle; that item is only at the revision head (`rev GeometricTopology/README.md:1074`). The README reaches them through links pinned to commits (the gate's 32 `blob` hits), which is the mechanism the gate forbids.

**Repair:** Cite HeegaardFloer and GeometricTopology by their sections on main (Lane F1 for Robbin–Salamon spectral flow and Riemann–Roch, Lane F2 for curves, Lane M for Morse), and for each item that main does not state (clutching number = c₁ comparison, product-curve projection F2.6c, filtrations M.8, the embedding-restriction bundle) either own it here or declare a supplier gap `What HeegaardFloer must provide (gap:<slug>)` with a matching `gaps` entry in `design/plan.json`. Test: `tauceti-roadmap roadmaps resolve` on main's copies must find each cited label.

## R05 (P2) — F0–F4 re-plan HamiltonianReduction R1a, which is on main

**Location:** `TauCetiRoadmap/DGFloer/README.md:97–99` (F0–F4 "Closed-manifold flux coordination", "Compact-support flux coordination"), :87. *Inherited (added by #900 on 2026-10-26).*

**Claim:** "R1 is not cited as a global flux theorem"; the global flux, the Hamiltonian kernel, Γ_ω, the exact sequence and the T² example are built here.

**Witness:** Main's `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md` (merged in #1049 on 2026-10-20) has R1a "Global flux, Hamiltonian kernel and endpoint quotient" (:71): flux with homotopy invariance (R1a.0), primitive selection and the Hamiltonian path kernel (R1a.1), `1→Ham(M,ω)→Symp₀(M,ω)→H¹_dR(M)/Γ_ω→0` (:101), the torus computation `Γ_ω = A·H¹(T²;ℤ)` (:107) and the compactly supported version through `H¹_c(M)` (:123). F0–F4 restate each of these.

**Repair:** Delete F0–F4 and cite HamiltonianReduction R1a.0–R1a.2 by section where 7.T and G0–G7 use flux; keep only what R1a does not state, as a declared gap on HamiltonianReduction if anything remains. Test: the T² sentence appears once in the library's plans, in R1a.

## R06 (P2) — Statable headline theorems are absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:18–22` ("The other headlines need carriers that do not exist yet (Moore paths and loop spaces, …)"); README :694–697 (mod-2 vanishing), :1583 (Lemma 3.41), :698–766 (K(A,n)).

**Claim:** Only Hurewicz in degree one and the twisted square-zero theorem are statable at the pins.

**Witness:** Three further headlines elaborate against the pins with a single `import Mathlib` and one `sorry` warning each (scratch file, signatures below): the mod-2 vanishing theorem (simply connected `Y`, `H_{i+1}(Y; ℤ/2) = 0` for all i, conclusion `g ↦ g·g` bijective on `π_{n+1}(Y)`), Lemma 3.41 on the fixed-interval loop model (`PathConnectedSpace Q ∧ ∀ n, Subsingleton (π_{n+2} Q q)` iff `H_{i+1}(Ω(ΩQ)) = 0` for all i, with Mathlib's `LoopSpace`, `Mathlib/Topology/Homotopy/HomotopyGroup.lean:86`), and existence of `K(A, n)` (`∃ X x, PathConnectedSpace X ∧ Nonempty (Additive (π_{n+1} X x) ≃+ A) ∧ ∀ k ≠ n, Subsingleton (π_{k+1} X x)`). The docstring's statement that loop spaces do not exist is wrong for the fixed-interval model the README itself declares equivalent (README :261–268; the STATUS file reports Lemma 3.41 "for both the Moore and fixed-interval loop models").

```lean
theorem mod2Vanishing (Y : Type) [TopologicalSpace Y] [SimplyConnectedSpace Y] (y : Y)
    (hY : ∀ i : ℕ, Subsingleton
      (((AlgebraicTopology.singularHomologyFunctor.{0, 0, 1} (ModuleCat.{0} (ZMod 2)) (i + 1)).obj
        (@ModuleCat.of (ZMod 2) _ (ZMod 2) _ (@Semiring.toModule (ZMod 2) _))).obj
          (TopCat.of Y))) :
    ∀ n : ℕ, Function.Bijective (fun g : π_ (n + 1) Y y => g * g) := by
  sorry
```

(The explicit module instance is needed: `ModuleCat.of (ZMod 2) (ZMod 2)` alone fails to synthesize `Module (ZMod 2) (ZMod 2)` at this pin.)

**Repair:** Add the three statements (mod-2 vanishing is the roadmap's own correction of the source's Serre-class step and the input of Theorem C, so it is a headline of Layer 1); state K(A, n) with its uniqueness up to weak equivalence if a second space is quantified; correct the docstring to name exactly which headlines lack carriers (Moore loops, Serre-fibration carrier, Liouville domains, Floer complexes). Tests: on `Y = K(ℤ/3, 2)`, `×2` is the permutation `0→0, 1→2, 2→1` and the hypothesis holds; on `S²` it fails at `H₂(S²; 𝔽₂) = 𝔽₂`; on `Q = T²` both sides of Lemma 3.41 hold, on `S²` both fail (`H₀(Ω²S²)` has reduced part ⊇ ℤ, `π₂ = ℤ`).

## R07 (P2) — End theorems still named by source number only

**Location:** `TauCetiRoadmap/DGFloer/README.md:1519` ("The spectral sequence (Theorem 3.49)"), :1575–1580 ("Theorem L (= Theorem 5.1), through …", "Theorem M (= Theorem 6.4), through the capacity bound"), :1605–1607 (Theorem H, Proposition 6.15), :1673 (Theorem G). *Inherited.* Re-raised: r1 R11.

**Claim:** These lines specify the end theorems.

**Witness:** `bdho-floer` line 2956–2966 (Theorem 3.49, printed p. 67) states existence of the spectral sequence and, separately, convergence under a paired uniform boundedness hypothesis; the README names neither the hypothesis nor the abutment. For Theorems L and M the source requires `j_!(α) ≠ 0` and `i_{W*}(α) = 0` (lines 735–739 and 753–756, printed p. 13); on `α = 0` both vanish and the criterion must reject the input, which a bare "Theorem M (= Theorem 6.4)" cannot express. Theorem H (abundance) has no definition of "abundant" in the README beyond the source numbers 1.7 and 6.11.

**Repair:** Write each end theorem in the author's words with hypotheses, objects, quantifiers and conclusion (existence and convergence of 3.49 separately, the two boundedness alternatives; L and M with their nonvanishing and vanishing conditions; H with the definition of abundance including the reduced-degree-zero condition; G with the knot, linking and degree hypotheses). Test on `α = 0` (rejected), on support `p, q ≥ 0` (convergence hypothesis satisfied), on support `p = −q` (not certified).

## R08 (P2) — The Cayley plane is still excluded from Proposition 6.39

**Location:** `TauCetiRoadmap/DGFloer/README.md:49–50` ("The Cayley plane in Proposition 6.39. It needs the octonionic projective plane as a Riemannian manifold"), :1671–1672, :1753. *Inherited.* Re-raised: r1 R12.

**Claim:** The library may omit this case of Theorem I.

**Witness:** `bdho-floer` line 5247 (Proposition 6.39, printed p. 121) includes the Cayley plane; `roadmaps grep 'Cayley plane|octonionic projective'` finds no owner on main or in any open pull request, so the exclusion leaves the case unowned. The quaternionic half does not cover it (real dimension 8 versus 16).

**Repair:** Own the Riemannian Cayley plane as a target (the homogeneous space F₄/Spin(9) on LieGroups' compact structure with its normal metric, or Freudenthal's model), with its geodesic period and Morse–Bott energy data in Layer 5 item 7, and restore Proposition 6.39 in full; if a Part II is created for R01, this is a natural Part II target. Test: the based-loop homology has ℤ in degree 14 (`H_{14}(Ω𝕆P²) ≅ ℤ` from `Ω𝕆P² ≃ S⁷ × ΩS²³`).

## R09 (P3) — Commit-pinned links, pull-request URLs and a stale pin hash

**Location:** `TauCetiRoadmap/DGFloer/README.md:22`, :84–93, :113–182 (the gate's 32 `blob` hits), :157–159 and :859 (`…/pull/1051`, `…/pull/887`, `…/pull/953`), :379 ("present at Tau Ceti snapshot 720bf8c…, beyond this repository's pinned a91d3aaf…"), :478–479, :646. *Inherited.*

**Witness:** The gate's rule forbids links into the roadmap repository pinned to a commit; the house rule forbids pull-request references. The manifest pins TauCeti `358314d4` (both on this branch and on main), not `a91d3aaf`; snapshot `720bf8c` is dated 2026-10-14, the pin 2026-10-07, and `serreFibrations`, `mem_serreFibrations_proj` and `hasHomotopyLiftingProperty_proj_cube` occur nowhere in the pinned tree. The "CC" of lines 494, 511 and 1860 is never expanded and resolves to no roadmap by name.

**Repair:** Cite every roadmap by name and section with a path on main or no link; delete the snapshot sentence and say instead "Layer 1 item 2 consumes the Serre-fibration carrier of the AlgebraicTopology roadmap, `TauCeti.TopCat.serreFibrations`, when it exists at the pin"; expand "CC" to the roadmap's name at first use.

## R10 (P3) — TeX-only syntax outside code spans

**Location:** `TauCetiRoadmap/DGFloer/README.md:1030` (`⊕_{x∈P}`), :1089 (`⊗_{C_*(Ω_p B)}`), :1537 (`m^(η₀^−1)_{x,y}`). *Inherited.*

**Repair:** Put each formula in a code span (the gate's `tex` rule, 4 hits).

## R11 (P3) — README shape: no target subsections, `*Needs:*` lines, Checks, Examples or Dependencies

**Location:** whole README (headings at :37–:1858 are `## Layer k` with numbered lists; `grep -c 'Needs:'` = 0, `grep -c '**Checks'` = 0). *Inherited.* Re-raised: r1 R14.

**Repair:** As in r1: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build; `### k.n` prose targets with a `*Needs:*` line each; at least three discriminating Checks per definition (for the Serre filtration of Layer 0 item 3: `p = id : I → I` with the 1-cube `id` in `F_1` and not `F_0`; a cube `u : I² → E` over a constant base map in `F_0`; the trivial fibration `F × B → B` where `F_s` is spanned by cross products `v × w` with `v` an `s'`-cube of `B`, `s' ≤ s`); `### Examples` and `### Dependencies` closing each layer.

## R12 (P3) — No `sources.toml`; preprint and published numberings mixed

**Location:** folder (no manifest); README :1058 ("BDHO Theorem 7.2"; the preprint has Theorem 7.2.1, `bdho-morse` line 3101, printed p. 91), :1542 ("Abouzaid §11.2", "Proposition 11.2.4"; the readable preprint has 3.2.4), :1653 (a ResearchGate link for Crowley–Schick–Steimle; cite the arXiv id only). *Inherited.* Re-raised: r1 R17.

**Repair:** Record every cited work in `sources.toml` with provenance, record published/preprint correspondence with a `version_note`, and cite the version read.

## R13 (P3) — HPᵈ cell-gap labels swapped

**Location:** `TauCetiRoadmap/DGFloer/README.md:1085` ("within-level gap 4d−1 and successive-level gap 3"). *Inherited.*

**Witness:** `ΩHPᵈ ≃ S³ × ΩS^{4d+3}` has cells in degrees `(4d+2)k` and `(4d+2)k + 3`: the gap inside a level is 3 and the gap to the next level is `4d − 1`. For `d = 1` both are 3, so the sentence is only wrong for `d ≥ 2`.

**Repair:** Exchange the two labels.

## Verified sound

**Gate.** Rerun of the dependency check printed exactly:

```text
UPWARD: DGFloer (on main) -> HomotopySpheres (#63) at README lines [55, 93]
UPWARD: DGFloer (on main) -> ImplicitAtlases (#199) at README lines [1862]
UPWARD: DGFloer (on main) -> TangentialBordism (#8) at README lines [92, 174]
CYCLE among: DGFloer, HomotopySpheres, TangentialBordism
depcheck: 201 roadmaps, 1321 edges, 4 problem(s)
```

Main's own copy of the README gives the same four lines. The gate's `build` entry is the toolchain warning "imports `Mathlib` … consider adding `module`" printed by `lake build TauCetiRoadmap.DGFloer.Suggested` (which then completes successfully with the two `sorry` warnings); `lake env lean` on the file prints only the two `sorry` warnings (lines 36 and 110). Since `import Mathlib` is mandated, I take that entry as a false positive of the build scanner, not an author defect. All other scanner fields are zero; the diff outside the folder is empty; no stray file (PROGRESS.md and STATUS.md are main's generated files).

**Source sample.** Readable texts: `bdho-floer` = arXiv 2404.07953v3 (139 pages), `bdho-morse` = arXiv 2308.06104v3 (256 pages), `serre-1951` = the Rochester author-page scan of Ann. of Math. 54 (printed pages cited) with the Collège de France author copy as a second copy. The six seeded targets are paragraphs of 7.C with no theorem locator of their own (their stated sources are Hutchings' notes pp. 74–101, which the service found no legal copy of, and FHS 1995, paywalled); each was checked for internal consistency against the conventions of 7.C.0–7.C.2a instead:

| Target | Values computed | Result |
|---|---|---|
| Convention and application checks (:1181) | ℂPⁿ, `N_C = n+1`, Morse index j ↦ Floer degree `j − n` mod `2(n+1)`: one copy of R in degree i iff `i + n ≡ j ∈ {0,2,…,2n}`; the n+1 even residues are distinct mod 2n+2 | Formula correct |
| Tame synthesis and staged selection (:1280) | `D exp_A(B) = ∫₀¹ exp((1−t)A) B exp(tA) dt` is the derivative of the matrix exponential; for anti-J `A`, `J(A)² = exp(A)J²exp(−A) = −1`; tameness open in C⁰ | Correct |
| Tame raw sign realization (:1284) | readout `(−1)^{i+j+ij}` at `j = 1` is `(−1)^{2i+1} = −1`; with family factor `(−1)^n` gives `(−1)^{n+1}` as 7.C.2a states; Morse zero-face exponent `k + (k−n) + n = 2k` even | Consistent with 7.C.2a |
| Separate finite counting budgets (:1292) | positive monotone: `ω(A) = κc₁(A)`, index equation bounds `c₁`, hence energy; `c₁ = 0` branch: no bound, cutoff retained | Correct |
| Regular true endpoint and energy-dependent neighborhood (:1318) | constant-core model: `∂̄` kernel `TX`, cokernel 0, `Wᵘ(p) ∩ Wˢ(p)` isolated at index zero | Consistent with 7.C.3a |
| Positive-monotone finite Laurent matrices (:1373) | `Γ ≅ N_Cℤ` via `c₁`; `deg t = 2N_C`; `ν(t) = −ω(t) = −κN_C < 0`; a homogeneous entry between fixed-degree generators has one exponent since `B ↦ 2c₁(B)` is injective on Γ | Correct |

Locators verified in the readable texts: Theorem J (`bdho-floer` line 640, p. 15: Serre fibration, Leray–Serre comparison); proof of Theorem J (line 2739, p. 67) through Theorems 3.37/3.39 and BDHO Theorem A; Lemma 3.41 (line 2753); BDHO Theorem A / Theorem 7.2.1 (`bdho-morse` lines 169–178, 3101–3111, p. 91: Hurewicz fibration, isomorphism of the index spectral sequence with the Leray–Serre one); Serre's degeneracy convention (`serre-1951` line 659–663, p. 439: independence of the last coordinate, as the README's standing conventions say), fibre space (line 795–800, p. 443), filtration `T^{p,q}` (lines 944–951, p. 446: `p∘u` independent of the last q coordinates, exactly the README's `F_s`), Théorème 1 `E¹ = C(B, H(F))` (line 1065, p. 448) and Théorème 2 `E² = H(B, H(F))` (line 1150, p. 451), with the remark (line 1162) that connectedness of F and B is a convenience of his basepointed cubes.

**Adversarial table.** 46 rows; homological grading unless stated.

| Statement / location | Instances | Values on the two sides | Result |
|---|---|---|---|
| Serre filtration, README :437–442 | `p = id : I → I`, 1-cube `id` | `p∘u = id` depends on its last coordinate: not in `F_0`; in `F_1` | Pass; the "factors through some cube" variant would put every cube in `F_1` |
| Same, subcomplex | n-cube `u ∈ F_s`, face in coordinate `i ≤ s` / `i > s` | face independent of the last `n−s` (resp. `(n−1)−s`) coordinates | `F_s` is a subcomplex |
| `F_s = 0` for `s < 0`, `= C_n` for `s ≥ n` :442 | `n = 0`: `F_0 C_0 = C_0` | `pr_0` is the constant map, every 0-cube qualifies | Pass |
| E¹ first quadrant :436 | `t < 0` | `F_s C_n = C_n` for `s ≥ n` gives `F_s/F_{s−1} = 0` in degree `n < s` | Pass; strong convergence hypotheses of Layer 1 item 3 hold (bounded below, exhaustive) |
| Cubical SS on `F → F → pt` | `B = pt` | `E¹_{0,q} = H_q(F)`, columns `s > 0` zero, `E² = E^∞` | Pass |
| Nontrivial differential | Hopf `S¹→S³→S²`, ℤ | `E²` has ℤ at (0,0),(2,0),(0,1),(2,1); `d²: E²_{2,0} → E²_{0,1}` is ±1 | Pass: total degrees 0 and 3 survive |
| Comparison from E² :453 | product `S² × S¹ → S²` | both sequences have ranks (1,1,1,1) in total degrees 0–3 | Pass on instance; target remains |
| Theorem J scope :1512 | locally trivial bundle over a non-paracompact base | Serre fibration (README :515–517), excluded by "Hurewicz" | Fails: R03 |
| Index SS iso from E² :1062 | trivial coefficient system on `T²`, `n = 1` | `E²` concentrated in `q = 0`; ranks (1,2,1) | Pass |
| Serre's degeneracy :246 | `c × id_I : (x₁,x₂) ↦ (c, x₂)` with `c` a constant 1-cube | Serre (`serre-1951` line 659): depends on the last coordinate, so not degenerate although `c` is; Massey: independent of `x₁`, degenerate | README's reason for Massey's convention stands |
| Moore counterexample :269–276 | `γ_n(t) = (sin 2πnt, 1 − cos 2πnt)/(2πn)` | speed 1, sup-distance ≤ `1/(πn) → 0`, duration 1; limit's unit-speed representative has duration 0 | Pass |
| Serre class instances :688–692 | `0→ℤ/2→ℤ/4→ℤ/2→0`; `ℚ ⊃ ℤ` | fixed exponent `d^m = 2` fails on ℤ/4; `ℤ⊗ℤ/2 = ℤ/2 ≠ 0` | Pass |
| Mod-2 vanishing :694 | `K(ℤ/3,2)`; `S²` | `×2` is a bijection on ℤ/3; `H₂(S²;𝔽₂) = 𝔽₂` excludes `S²` | Pass; statable (R06) |
| Directed union :718–723 | `ℤ[1/2] = ⋃ 2^{−r}ℤ` | `H₁(−;𝔽₂)` transitions `×2 = 0`, colimit 0; `colim(S¹, deg 2)` in Top is `ℝ/ℤ[1/2]`, indiscrete | Pass |
| One-step lemma :826–839 | `Y = S²`, `n = 3` | `0 = π₂(E) → π₂(S²) = ℤ → π₁(K(π₃S²,2)) = 0` impossible | Correct negative control |
| Theorem C step :1596–1599 | `Q` with `π₂(Q) = 0` | `π₁(Ω₀Q) = π₂(Q) = 0`, so `Ω₀Q` simply connected | Pass |
| Lemma 3.41 :1583 | `S²`, `S³`, `T²` | reduced `H₀(Ω²S²) ⊇ ℤ`; `H₁(Ω²S³) = ℤ`; `Ω²T²` has contractible components | Both directions pass; statable (R06) |
| `K(ℤ[1/2],1)` homology :808–814 | `2^{−r}ℤ ⊂ 2^{−r−1}ℤ` | inclusion is `×2`; mod-2 `H₁` map zero | Pass |
| Liouville non-converse :1126–1130 | `λ = p dq`, `Z = p∂_p + ∂_q` | `ι_Zω = p dq − dp = λ − dp`; `L_Zω = d(λ − dp) = ω` | Pass |
| Cotangent signs :343–349 | `T*ℝ` | `ω_can(∂_q,∂_p) = 1 = (dq∧dp)(∂_q,∂_p) = −d(p dq)(∂_q,∂_p)`; `ι_{p∂_p}(dq∧dp) = −p dq` | Pass |
| Hamiltonian bridge :340–342 and acceptance 9 | `H = p²/2` | source field for `ω_src = dp∧dq`: `p∂_q`; `ν_*(p∂_q) = −p∂_q = X_{ω_can,−p²/2}` | Pass |
| Magnetic translation :1118–1122 | `Ψ'_σ(q,p) = (q, p − σ_q)` | `Ψ'^*λ_can = λ_can − π^*σ`, so `Ψ'^*ω_can = ω_can + π^*dσ` | Pass |
| `μ(x,const) = ind − n`, `FH_* ≅ H_{*+n}` :1189, :306–308 | Morse index j | degree `j − n`; 7.C.1a "generator of Morse index j has degree j−n" | Consistent |
| Cap change :1189 | `D' − D = A` | `μ(x,D') = μ(x,D) + 2c₁(A)` | Consistent with 7.C.1 recapping modulo `2c₁(S_sph)` |
| 7.C.3a dimension :1312–1314 | r simple spheres `B_j`, 2 marks each, r−1 nodes, endpoint incidences | `Σ(2n+2c₁(B_j)−6) + 4r − 2n(r−1) − (2n − ind p + ind q) = 2(Σc₁(B_j) − c₁(A_end)) − 2r` using `ind q − ind p = 2c₁(A_end)` | Identity verified |
| 7.C.3 `c₁ = 0` codimensions :1298 | one-marked sphere in `X × S¹` | `(2n − 4 + 1) − (2n + 1) = −4`; index-k quotient with attachment `k − 1 + 2 − 4 = k − 3`; stationary `1 − 4 = −3` | Pass |
| 7.C.6a Γ model :1371 | `ω = κc₁` | `ker ω ∩ ker c₁ = ker c₁`, `Γ ≅ c₁(S_sph) = N_Cℤ` or 0 | Pass |
| 7.C.6f unit obstruction :1383 | `ν(B) > 0`, `R ≠ 0` | `1 − e^B` is a unit in the completion, `t ↦ 1` sends it to 0 | Pass |
| 7.T.6 index jump :1449 | `CZ_HF(A−ε) − CZ_HF(A+ε) = −1` | `ind_+ − ind_− = CZ(A+ε) − CZ(A−ε) = +1` | Consistent |
| 7.T.6 polynomial tail :1451 | `β' = −κβ²` | `β ≍ 1/(κs)`, `∂_s^k β ≍ s^{−k−1}` | Pass |
| 7.T.7 death factor :1465–1467 | odd `i`, `a = 1 + b` | `τ_− = a⁻¹`, `τ_+ = 1`, ratio `a = (1+b)^{(−1)^{i+1}}` | Consistent |
| 7.T.9 point model :1485 | `M = pt` | `CF_even = ℤ`, `CF_odd = 0`, nonacyclic so `τ_F = 0`, `ζ_F = 1`, `I_F = 0` | Pass |
| Lemma 6.35 values :1651 | `π₂(SO(3)) = 0`, `π₄(SO(5)) = ℤ/2`, `π₆(SO(7)) = 0`, `π₈(SO(9)) = (ℤ/2)²` | agree with Kervaire's tables; `n = 7` shows the splitting cannot start below the stated range | Pass |
| Splitting range :1652 | `n = 7` versus `n ≥ 17` | `π₆(SO(7)) = 0` but Stiefel term ℤ/2: splitting false at 7, hence the explicit low ranks | Pass |
| Rotation degree :1657 | odd n | `1 + (−1)^{n−1} = 2` | Pass |
| Projective loop homology :1081–1083 | `ΩCPᵈ ≃ S¹ × ΩS^{2d+1}` | ℤ in degrees `2dk`, `2dk+1`; `a_{k+1} − b_k = 1`; `H_{2d} = ℤ` | Pass |
| `ΩHPᵈ` :1085 | `S³ × ΩS^{4d+3}` | ℤ in `(4d+2)k`, `(4d+2)k+3`; gaps 3 and `4d−1` | Labels swapped (R13); `H_{4d+2} = ℤ` correct |
| Higher differentials :1091 | path-loop SS of `CPᵈ` | `H_{2d+1}(CPᵈ) = 0`, so the generator of `H_{2d}(ΩCPᵈ)` is hit by `d_{2d}: E_{2d,1} → E_{0,2d}` | Plausible, as stated |
| Fubini–Study scale :863–865 | `CP¹` radius 1/2 | circumference π, area π, `ω_g = πω_FS`, `∫ω_FS = 1` | Pass |
| Compact Lie bridge :1649 | `SU(2)`, `T²` | `π₃(SU(2)) = ℤ`; higher `π(T²) = 0`; the finite cover `T × K → G` | Pass |
| Evaluation bundle :858 | `S² ⊔ T²`, basepoint in `S²` | orbit `O = S²`; fibre over `T²` empty | Correctly handled |
| `TwistingCocycle` degrees, Lean :60 | `m x z * m z y` | `𝒜((ind z − ind x + 1) + (ind y − ind z + 1)) = 𝒜(ind y − ind x + 2) = 𝒜(deg d(m x y))` | Consistent |
| `twistedDifferential` vs README :1019, Lean :100 | `f = Pi.single x α`, `α ∈ ℳ q` | `(Df) y = [y = x] dM α + op(m x y) • ((−1)^q α)` = `∂α⊗x + (−1)^{|α|} Σ_y α·m_{x,y}⊗y` | Agrees |
| `twistedDifferential_sq`, Lean :110 | same, with `IsDGRightModule.leibniz` (`Defs.lean:78–79`) and `IsDGAlgebra.leibniz` (`Algebra/Defs.lean:188–189`) | `(D²f)(z) = op(d(m x z) − Σ_y (−1)^{ind x − ind y} m x y * m y z) • α = 0` by `twisting`; the `(−1)^q op(m x z)•dM α` terms cancel | True; `P = ∅`, `m = 0`, `M = 0` all give `D² = dM² = 0` |
| One-sidedness independence :1001–1002 | `ℚ[ε]/(ε²)`, `|ε| = −1`, `m_{x,x} = ε` | degree `ind x − ind x − 1 = −1` ✓, `∂ε = 0 = (−1)^0 ε·ε` ✓, `m_{x,x} ≠ 0` | Pass |
| Action dependence (acceptance 2) | `A = ℚ×ℚ`, `m x y = (1,0)` | first projection: `D(1⊗x) = 1⊗y`; second: 0 | Pass |
| `hurewiczOne`, Lean :36 | pt, `S¹`, `BS₃`, `BQ₈` | abelianizations 0, ℤ, ℤ/2, (ℤ/2)²; `H₁` the same | Pass; states existence only, as its docstring says |
| `gradingInvolution` body, Lean :69–71 | `α ∈ ℳ q`, `q = 0,1,2` | `toModule` on `of q α` gives `(−1)^q • α`: `α, −α, α` | Correct body; the zero map is excluded |

**Pinned-library audit** (Mathlib `f6090c70`, TauCeti `358314d4`, both on this branch and on main):

| Declaration | File and line at the pin | Content and limitation |
|---|---|---|
| `TauCeti.IsDGRightModule` | `TauCeti/Algebra/Homology/DG/Module/Right/Defs.lean:68–79` | degree +1, square zero, `dM (op a • x) = op a • dM x + q.negOnePow • (op (d a) • x)` for `x ∈ ℳ q` |
| `TauCeti.IsDGAlgebra` | `TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182–189` | `d(ab) = da·b + (−1)^p a·db` for `a ∈ 𝒜 p` |
| `LoopSpace` | `Mathlib/Topology/Homotopy/HomotopyGroup.lean:86` | `Path x x` with its topology: the fixed-interval loop space exists at the pin |
| `HomotopyGroup.Pi`, `π_` | same file :458, :461 (scoped in `Topology`), group instance :547 (`[Nonempty N]`) | `π_ 0` is not a group; statements use `n + 1` |
| `singularHomologyFunctor` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52` | simplicial singular homology with coefficients in a module object |
| `ModuleCat.of` | signature `(R) [Ring R] (X) [AddCommGroup X] [Module R X]`; `Module (ZMod 2) (ZMod 2)` must be given explicitly | see R06 |
| `TauCeti.IsAspherical` | `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59` | path connected and `π_{n+2}` trivial; its module has no object file in the worker's build, so the probe inlines the definition |
| `SimplyConnectedSpace` | `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40` | used in the mod-2 probe |
| `serreFibrations`, `mem_serreFibrations_proj`, `FiberBundle.hasHomotopyLiftingProperty_proj_cube`, `HurewiczOne`, `MooreLoopSpace`, `loopChainAlgebra`, `singularCubicalHomologyNatIso`, `TwistingCocycle` | absent from the pinned TauCeti tree (`grep -r` over `TauCeti/`) | the progress files' links are to a later TauCeti; the README's line 379 names a later snapshot |
| `MaurerCartan` at the pin | only `TauCeti/Algebra/Homology/AInfinity/Algebra/MaurerCartan.lean` (A∞ setting) | no finite twisted complex on `P → M` at the pin; `twistedDifferential_sq` is not a duplicate |

Signatures: all six declarations were elaborated with `#check @name` on a scratch copy; the types agree with `signatures.md`. The three "dropped" binders (`IsScalarTower`, `DecidableEq P`, `GradedSMul`) are not mentioned by the types of `gradingInvolution`, `totalGrading` and `twistedDifferential`, whose bodies elaborate without them; `twistedDifferential_sq` keeps every hypothesis the proof needs. Nothing changed in the pull request's file. One-tactic probes on the scratch copy: `infer_instance` on `hurewiczOne` fails; `simp [twistedDifferential, gradingInvolution, hM.sq_zero]` and the `ext`-then-`simp` variant with `m.twisting` leave goals on `twistedDifferential_sq`; no padding. No `set_option`, no sorried data, no `lemma`, no admitted example; `import Mathlib` plus one existing `TauCeti.*` module.

**Cross-roadmap citations resolved** (main at `c994070`; open heads as given):

| Citation | Found at | Note |
|---|---|---|
| AlgebraicTopology 5.5 `arbitraryCWSerreSpectralSequence`, `arbitraryBaseSerreSpectralSequence` | main `AlgebraicTopology/README.md:910–923` | AT consumes DGFloer's LES and both sequences; consistent direction |
| AT 8.8 raw bar, 4.4 `reducedSuspensionSphereHomeomorph`/`compactReducedSuspensionCarrierComparison`, 4.5 product cells | main :1831–1849, :544, :565, :753 | resolve |
| GeneralizedCohomology G2.10 `IsHurewiczFibration`, `MappingPathSpace`, `mappingPathFiberConstHomeomorphPath`, G4.0b, G5 | main :535–568, :939, :1373 | resolve |
| DGAInfinity Layers 1, 4, 5 | main :394, :431 | resolve; Layer 5 owns one-sided twisted complexes, DGFloer keeps the generator-indexed bridge |
| MorseTheory M4 (`c(M)`), M5 | main :458, :559, :611 | resolve |
| RiemannianGeometry R1–R3 | main :179, :300, :347, :431 | resolve |
| MorseNovikov N1, N4, N6 | main :75, :219, :377 | resolve |
| LieGroups Layer 2, Layer 6; CompactGroups | main `RepresentationTheory/LieGroups/README.md:275`, :383 | resolve (cited by pull-request URL, R09) |
| ComplexKahlerGeometry K7.1, K7.2 | main :1407, :1444 | resolve (cited by pull-request URL, R09) |
| CharacteristicClasses C3.2 | main :893 | resolves |
| CotangentLagrangian C2.0, C2.1; HamiltonianReduction R1 | main `SymplecticGeometry/CotangentLagrangian/README.md:79`, :109; `HamiltonianReduction/README.md:33` | resolve; R1a duplicates F0–F4 (R05) |
| UniversalCovers | `Completed/UniversalCovers` | resolves |
| HomotopySpheres 3A, 3B item 3, 4A–4B, Stage 5 | `rev/1287 …/HomotopySpheres/README.md:371`, :434, :575, :648, :700 | resolve; cycle (R01) |
| TangentialBordism B5, B6.3 | `rev/942 …/TangentialBordism/README.md:913`, B6 item 3 (orientation-map surjectivity `ΩSO_n(X,A) → H_n(X,A;ℤ)`) | resolve; cycle (R01) |
| SmoothBundlesConnections B1.4 (slice theorem, free proper actions), B6.0, B6.2, B6.3 | `rev/887 …/SmoothBundlesConnections/README.md` B1 item 4, :592, :768, :782 | resolve |
| AnalyticStableMaps M2.0a, M3 | `rev/987 …/AnalyticStableMaps/README.md:67`, :168 | resolve; roadmap not in the merge order |
| ImplicitAtlases V0–V6 | `rev/974 …/ImplicitAtlases/README.md:88–676` | resolve (R02) |
| HamiltonianSystems Layers 1–2 | open pull request #480 (new roadmap), not in the merge order | not checked beyond existence |
| HeegaardFloer F1.4, F1.5, F2.6c, M.8, M1–M5 | not on main; only at the revision head | drift (R04) |
| GeometricTopology Layer 3 restriction bundle | not on main; only at the revision head | drift (R04) |
| "CC C1.2" | no roadmap of that name; `roadmaps grep` finds no "singular-realization counit" | R09 |

Ownership by object was searched for the cubical Serre filtration, Serre's filtration, Moore loops, twisting cocycles, global flux, the Cayley plane and the Hurewicz predicate across main, the board packages and the indexed open pull requests; the only second owner found is HamiltonianReduction R1a (R05). TangentialBordism and AlgebraicTopology consume the Serre spectral sequence from here and do not build it. Open pull requests not indexed by the tooling were not checked.

**Headline inventory.**

| Headline | Statable at the pins | In `Suggested.lean` |
|---|---|---|
| Hurewicz in degree one | yes | yes (existence form) |
| Twisted square-zero (Layer 4 item 2) | yes | yes |
| Mod-2 vanishing (1.4) | yes (probe) | no: R06 |
| Lemma 3.41, fixed-interval model (10.4) | yes (probe) | no: R06 |
| Existence of K(A, n) (1.4) | yes (probe) | no: R06 |
| Cubical and CW Serre spectral sequences, their comparison, filtered-complex convergence | no (cubical chains, Serre-fibration carrier absent) | named in docstring |
| Fibration theorem, DG Morse and Floer homology, Theorem J, SH with DG coefficients, Theorem K | no (Moore loops, moduli chains, Liouville domains absent) | named in docstring |
| Theorems A–E, H, I, G, L, M; 7.C Arnold bound; 7.T torsion invariant | no (Hamiltonian dynamics and capacities absent) | named in docstring (as Floer complexes) |

## Not verifiable

- **Hutchings' lecture notes (7.C's stated source, pp. 74–101):** the sources service found no legal copy; the six sampled targets were checked for internal consistency only. FHS 1995 (Duke) and PSS 1996 are paywalled; Lee I/II are on arXiv but were not read.
- **Serre's published pagination:** verified on the Rochester author-page scan of the Annals paper and the Collège de France copy of the thesis; both are OCR texts and some formulas are damaged. The adaptation of Serre's basepointed cubes and his degeneracy to Massey's normalization is a target, not certified here.
- **BDHO book numbering** (Theorem 7.2 versus the preprint's 7.2.1), Abouzaid's published numbering, Massey, Palais, Bott, Ziller, Hofer–Zehnder, McDuff–Salamon, Abbondandolo–Schwarz (CPAM): paywalled or not fetched; cited by locator only.
- **HeegaardFloer F1.4's Conley–Zehnder normalization** (`CZ = −μ_RS`, "small positive rotation has μ = 1"): the item is not on main, so the sign bridge of 7.C.0 could not be checked against its supplier.
- **TauCeti snapshot 720bf8c:** the package repository contains that commit, but a `git grep` over it did not finish within the time allowed and was stopped; the claim that the Serre carrier exists there is unverified (and irrelevant to the pin).
- **Open pull requests without files** in this brief (HamiltonianSystems #480, CompactSupport #196) were not read.

## Source issues

- **Error** in bdho-floer at Lemma 4.5(1), printed p. 71: the source says Moore loops of bounded length retract continuously onto unit-speed loops; the unit-speed loops are not closed in the compact-open topology (flat torus, `γ_n` above), so the retraction must be replaced by a compact-family approximation; affects the proof.
- **Error** in bdho-floer at the proof of Theorem 5.15, printed p. 99: the source says the groups with `G ⊗ ℤ/2 = 0` form a Serre class; `ℚ` belongs and its subgroup `ℤ` does not, so the mod-2 acyclicity argument of the README's Layer 1 item 4 is needed; affects the proof.
- **Misprint** in bdho-floer at the proof of Lemma 6.35 (line 5076), printed p. 116: the source says `π₈(SO(9)) = ℤ/4`; it should be `(ℤ/2)²`; affects nothing (torsion is all that is used).
- **Misprint** in bdho-floer at Theorem 3.49(ii), printed p. 67: the source says the sequence converges to symplectic homology without the coefficient system; it should keep `SH(W; 𝓕)`; affects a stated result.
