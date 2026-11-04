# Review of FourManifolds (pull request #936 at 311b51c)
**Verdict:** needs changes

Incremental re-review of the 86 lines changed since `7930a3e` (the new radial-control block at the head of §3.4, the two-line consumption in §3.5's point-flattening proof, and the new companion file `RadialControlTargets.lean`). No P1 or P2 finding: the radial-control lemma is true as stated in prose and in Lean, its hypotheses match Freedman–Quinn's proof of Theorem 9.7 generalised (no monotonicity of d), and the Lean statement elaborates. The gate fails at this head on two scanners (`tex`, `residue`), both inside the new block, so the folder cannot be accepted until they are repaired. Seven P3 findings, two of them carried from the previous report.

## R01 (P3) — Gate failure: `<a id=` anchor in the README

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1098` (`<a id="radial-end-control"></a>`), consumed at line 1809 (“Apply the [radial-control API](#radial-end-control) to both end deformations”).

**Claim:** The gate's `residue` rule rejects `<a id=` anchor tags; the gate at this head ends `residue=1 … FAIL`.

**Witness:** My own run of the gate on this head: `gate FourManifolds: … tex=1 … residue=1 … FAIL`, with `residue: line 1098: <a id="radial-end-control"></a>`.

**Repair:** Delete line 1098. At line 1809 write “Apply §3.4's radial-control estimates to both end deformations on a proper tube” (plain text, no `(#…)` link). Both the gate's residue count and the link then resolve.

## R02 (P3) — Gate failure: TeX-style subscript outside a closed code span

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1112`–1113 (“subtracting `min(r_n/4, min_{[r_n/4,2r_n]} d” / “/16)` at each step”).

**Claim:** The code span opened on line 1112 closes on line 1113, so the gate's line-wise `tex` scanner sees `_{` outside a code span and fails (`tex=1`).

**Witness:** My gate run: `tex: line 1112: Construct cofinal image radii r_n↓0 by subtracting `min(r_n/4, min_{[r_n/4,2r_n]} d`. The same span written on one line passes (the spans at lines 1114–1115, `min_{[r_(n+1),r_n]} d`, are on one line and are not flagged).

**Repair:** Keep the code span on one line: “subtracting `min(r_n/4, m_n/16)` at each step, where `m_n` is the minimum of d over `[r_n/4, 2r_n]`”, which also reads better than the nested subscript.

## R03 (P3) — A sorried technical lemma in a companion Lean file

**Location:** `TauCetiRoadmap/FourManifolds/RadialControlTargets.lean:1`–33 (new file) and `README.md:1141`–1142 (“[RadialControlTargets.lean](RadialControlTargets.lean) prototypes its quantified statement using native real functions and `OrderIso`”).

**Claim:** The roadmap's Lean files carry only the headline theorems the finished roadmap is tested against; a scalar real-analysis reparametrisation lemma is a Layer 3 API target, not a headline, and belongs in the README's prose, where it already is. The file also fails the Lean form rules the brief applies to every `.lean` file in the folder: its module docstring is not of the form “<title>: target signatures” and reads as process (“Suggested forms are aids, not the specification”, “Its admission is an unimplemented theorem target”); the name `exists_radial_control_reparametrization` appears nowhere in the README; and the README sentence that cites it (“prototypes”) is process narrative.

**Witness:** `grep -n exists_radial TauCetiRoadmap/FourManifolds/README.md` returns nothing. The elaborated type (`#check @TauCetiRoadmap.FourManifolds.exists_radial_control_reparametrization` on a scratch copy) agrees with the README's statement exactly, so the README loses nothing by owning the statement alone.

**Repair:** Delete `RadialControlTargets.lean` and lines 1141–1142 of the README. The README's §3.4 prose keeps the statement as a target. (Do not move it into `Suggested.lean`: it is not a headline.)

## R04 (P3) — An unnamed source: “Teichner's September 16 E₈-cap construction”

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1144` (“The application is Teichner's September16 E₈-cap construction; the radial estimates follow the proof of Freedman–Quinn, [Theorem9.7, pp147–148]”).

**Claim:** Every cited work is named in the References with a locator a reader can resolve. No work by Teichner other than Powell–Ray–Teichner (arXiv:2006.05209) is listed (`README.md:3167`), and a calendar date is not a locator into any named text.

**Witness:** `grep -n -i teichner README.md` returns lines 903–1047 (all Powell–Ray–Teichner), 1144 and 3167 only; `roadmaps grep -i 'september ?16'` finds no such text on main or at any open head.

**Repair:** Either name the work (title, year, legal URL) in the References and cite it by section or page, or cut the clause: the mathematics is already attributed to Freedman–Quinn, Theorem 9.7, which suffices.

## R05 (P3) — Locator and typography in the new block

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1102`–1145 and 1799.

**Claim and witness:**
- The radial estimates of the proof of Theorem 9.7 occupy printed pp. 148–149, after the deformation set-up on p. 147: the functions a, b, c, d and conditions (1)–(3) are at `freedmanquinn` lines 5123–5127 (printed p. 148, marker line 5112), the sequence γ_n and the definition of h at 5139–5146 (p. 148), and the verification of both estimates at 5149–5160 (printed p. 149, marker line 5147). “pp. 147–148” stops one page short of the verification the block reproduces.
- Joined tokens, the class the previous review's R04 repaired, are reintroduced: “tending to0 at0” (1103), “for0<t<η” (1105), “near0” (1111), “including at0” (1117), “times[0,∞)” (1120), “tending to0” (1126), “September16” (1144), “Theorem9.7, pp147–148” (1145); pre-existing “FQ9.7” (1799) and “Theorem1.2” (3116, the previous report's R01).

**Repair:** Write “Theorem 9.7, printed pp. 147–149” and insert the missing spaces (“tending to 0 at 0”, “for 0<t<η”, “near 0”, “at 0”, “times [0,∞)”, “Theorem 9.7”, “pp. 147–149”, “Theorem 1.2”, “Freedman–Quinn 9.7”).

## R06 (P3) — The radial-control block has no Checks and no `*Needs:*` item

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1099`–1148 and the §3.4 `*Needs:*` line at 1186–1191.

**Claim:** Every definition carries at least three discriminating Checks, and a target's `*Needs:*` line lists what its statement and route need. The block defines the envelope functions a, b, c, the control d and the coordinate h, and proves a theorem about them, but lists no Check, and §3.4's `*Needs:*` line names nothing the block uses (its only inputs are Mathlib's order isomorphisms of ℝ and the extreme-value theorem on compact intervals).

**Witness:** Instances computed this round (table below): for b(t)=t/2, c(t)=2t, d(s)=s the identity coordinate gives c(t)−b(t)=1.5t > t=d(t) and fails, while the constructed h has worst ratio 0.029 on (0,η); for d(s)=e^{−1/s} and a(t)=√t the identity fails by a factor 10⁴ and the constructed h has worst ratio 0.31. For the second paragraph, the fibrewise infimum over W=[0,1]∪({½}×[0,1]) with p₂(x,y)=x and g(x,y)=1+x−y jumps from 0.5 at t=½ to 1.5 just beside it.

**Repair:** Add a `**Checks.**` list with (i) the identity coordinate failing for b=t/2, c=2t, d=s (a wrong definition that forgets to squeeze would pass only d bounded below); (ii) constant d=1 or a=0, b=c=id, where every h works, so the η of the conclusion is not forced to shrink; (iii) the fibrewise-infimum jump above, showing why the minorant is built on compact annuli; and add “Mathlib's `OrderIso` and extreme-value theorem on compact intervals” to §3.4's `*Needs:*` line for the block.

## R07 (P3) — Three works cited inline are still missing from the reference list

**Location:** `TauCetiRoadmap/FourManifolds/README.md:387`–396 against the list at 3148–3207.

**Claim, witness and repair:** As in the previous report's R02, unchanged at this head: Moise (GTM 47), Munkres (Ann. of Math. 72, 1960) and Whitehead (Ann. of Math. 73, 1961) are cited in the `gap:three-manifold-smoothing` paragraph and absent from the References (`grep -n -i "moise\|munkres\|Whitehead, \*Manifolds"` returns lines 387, 392 and 394 only). Add the three entries.

## Previous findings

- R01 — not repaired: `README.md:3116` still reads “[Gompf, §1, Theorem1.2](…)”; folded into R05 above.
- R02 — not repaired: Moise, Munkres and Whitehead are still absent from the References; written again as R07.

## Verified sound

:robot: Independent AI review, incremental: I read the 86 changed lines (`changes.md`), the whole of the new §3.4 block (lines 1098–1148), the §3.5 passage that consumes it (1795–1818), the new Lean file, and the previous report; I re-ran the gate, the dependency check and both elaborations. I changed nothing in the pull-request worktree (`git status` clean). The diff outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FourManifolds'`) is empty.

**Gate and build.** My run of the gate ends `FAIL` with exactly the worker's two failures (`tex` at line 1112, `residue` at line 1098) and every other scanner at 0 (set_option, blob, latex, prnum, sorry-data, sorry-examples, imports, readme-ids-missing, empty-sections, round-labels, long-fences, target-ids, depcheck, stray-files, dirty, outside-folder, source-material; the worker's run adds build=0). `lake env lean` on `Suggested.lean` succeeds in three seconds with exactly the six `declaration uses sorry` warnings at lines 68, 77, 96, 120, 134 and 143; `Suggested.lean` is byte-identical to the head the previous review read. A scratch copy of `RadialControlTargets.lean` elaborates with one `sorry` warning (line 14) and no other output; `#check @exists_radial_control_reparametrization` gives the README's statement verbatim (hypotheses: `ContinuousOn`/`MonotoneOn` on `Ioi 0` for a, b, c; `Tendsto` to 0 along `𝓝[>] 0`; `0 ≤ a t`, `0 < b t ≤ t ≤ c t`; d continuous and positive on `Ioi 0`; `0 < R`; conclusion an `OrderIso ℝ ℝ` fixing `(-∞,0]` and `[R,∞)` with `0 < η < R` and the strict `max` bound on `Ioo 0 η`). The dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1418 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line (fourteen more edges than last round, none of them this roadmap's: its `*Needs:*` lines are unchanged).

**The changed passages, step by step.** (1) Principles: the block plans a general scalar lemma (arbitrary continuous positive d, arbitrary monotone envelopes), not a route-specific shortcut; it re-plans nothing (no roadmap on main or at an open head states a radial-reparametrisation lemma or Freedman–Quinn's point-flattening: `roadmaps grep` for `radial.{0,40}(control|reparametri)`, `point-flattening` and `flattening theorem for points` returns only this README); no supplier citation was added or changed; no copied passage (the block paraphrases Freedman–Quinn's argument with a different construction of the radii); no algorithm; no sorry'd data; no `set_option`. (2) Sources: Theorem 9.7 is at `freedmanquinn` line 4989 (printed p. 144, Chapter 9 “Handles, bundles, transversality”, §9.5 normal bundles), with the hypotheses the README's §3.5 states (ANR homology 4-manifold, complement a manifold, N×ℝ a manifold, trivial local fundamental groups of the complement in codimension ≠ 2); the claim that W becomes a δ-h-cobordism after reparametrising the radial coordinate is at 5055–5058; the deformations R₀, R₁ preserving the complement of the zero fibre and restricting to the standard deformations on it are at 5098–5104; the restriction to a compact K ⊂ N at 5105–5109; the envelopes (1)–(3) at 5123–5127; control ε = p₂/10 at 5063–5064, matching §3.5's “ε(r)<r/10”; the extension of the end homeomorphism by the identity on N at 5066–5068, matching the block's “extend continuously and inversely over the zero section”. (3) The adversarial rows below. (4) Duplication: Mathlib at the pin has `OrderIso`, `StrictMono.orderIsoOfSurjective` and the extreme-value theorem but no statement of this lemma; Tau Ceti at the pin has nothing on controlled h-cobordisms. (5) Suppliers: the block cites only Freedman–Quinn and Mathlib; §3.5's new sentence cites §3.4 of this roadmap. (6) Shape: the block lacks Checks and a `*Needs:*` item (R06). (7) Headlines: unchanged; the companion lemma is not a headline (R03); the one-tactic probe (`simp` in place of `sorry` on a scratch copy) leaves the full existential goal, so the statement is not trivial either.

**The mathematics of the block, checked.** The construction stated in the README proves the lemma, and it strengthens Freedman–Quinn (who need d monotone and invertible, line 5146 uses d⁻¹): with r_{n+1} = r_n − min(r_n/4, m_n/16), m_n the minimum of d over [r_n/4, 2r_n], one has r_{n+1} ≥ 3r_n/4, hence [r_{n+1}, r_n] ⊂ [r_{k}/4, 2r_{k}] for k = n−1, n, n+1 (9/16 ≥ 1/4 and 4/3 ≤ 2), so each of the three adjacent steps is at most d(h(t))/16 for h(t) ∈ [r_{n+1}, r_n], and h(c(t)) − h(b(t)) ≤ r_{n−1} − r_{n+2} ≤ 3d(h(t))/16 < d(h(t)) once c(γ_n) < γ_{n−1} and b(γ_{n+1}) > γ_{n+2}; a(t) ≤ a(γ_n) < m′_n/2 ≤ d(h(t))/2. If r_n ↓ r_∞ > 0 the steps are bounded below by min(r_∞/4, min_{[r_∞/4, 2r_0]} d /16) > 0, a contradiction, so the radii are cofinal. η = γ_1 keeps n ≥ 1 so that r_{n−1} exists. Continuity of a, b, c is never used (a note, not a finding), and `h 0 = 0` in the Lean conclusion follows from the fixing clause (harmless). For the second paragraph: the fibrewise minimum is only lower semicontinuous (witness in R06), the block says so and builds the monotone minorant from minima over compact annuli m_k and the running minimum min_{j ≤ k} m_j, which is positive, nondecreasing in t and bounded by t after the final min; the majorants tend to 0 by the properness argument the block names (a sequence with p₂(x_n) → 0 in p⁻¹(K×[0,1]) converges to the zero fibre, where both deformations fix p₁ and stay in the fibre).

**Adversarial table.** Rows marked (r7) are carried unchanged from the previous report, which computed their values at `7930a3e` on text this head does not touch; rows marked (new) were computed this round (script `radial_adv.py` in my scratch directory, floating point, grid of 2000 radii per instance).

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §3.4 radial lemma, trivial control (new) | a=0, b=c=id, d≡1, R=1 | r_0..r_3 = 0.5, 0.4375, 0.375, 0.3125; γ_0..γ_3 = 0.5, 0.225, 0.101, 0.0456; η=0.225; max(a, h(c)−h(b)) = 0 < 1 everywhere; identity h also passes | pass |
| §3.4 radial lemma, linear control (new) | a=0, b=t/2, c=2t, d(s)=s | identity h: 1.5t vs t, fails at every t; constructed h: steps r_n/64, worst ratio lhs/rhs = 0.0285 at t=0.05625 (1.38·10⁻² vs 0.485) | pass; shows the squeeze is needed |
| §3.4 radial lemma, quadratic control (new) | a=√t, b=t/2, c=2t, d(s)=s² | identity h: 4.19·10⁻² vs 3.09·10⁻⁶, fails; constructed: η=3.5·10⁻³, worst ratio 0.238 | pass |
| §3.4 radial lemma, flat control (new) | a=√t, b=t/2, c=2t, d(s)=e^{−1/s} | identity h: 2.96·10⁻² vs 0, fails; constructed: η=1.76·10⁻³, worst ratio 0.310 (4.19·10⁻² vs 0.135) | pass; d with no positive lower bound and all derivatives 0 at 0 handled |
| §3.4 radial lemma, non-monotone d (new) | a=t, b=t/3, c=3t, d(s)=s(2+sin(1/s)) | constructed: η=0.075, worst ratio 0.053; identity passes here only by luck (0.100 vs 0.112) | pass; no monotonicity of d used |
| §3.4 three-step bound (new) | general n ≥ 1 | r_{n+1} ≥ 3r_n/4 so [r_{n+1},r_n] ⊂ [r_k/4, 2r_k] for k=n−1,n,n+1 (9/16 ≥ 1/4, 4/3 ≤ 2); sum ≤ 3/16·d(h(t)) = 0.1875·d(h(t)) < d(h(t)) | pass |
| §3.4 cofinality (new) | r_n ↓ r_∞ > 0 hypothetically | step ≥ min(r_∞/4, min_{[r_∞/4,2r_0]} d/16) > 0, so Σ steps diverges: contradiction; numerically r_59 = 3.4·10⁻⁸ (d≡1), 0.197 (d=s), 0.499 (d=e^{−1/s}, slow but strictly decreasing) | pass |
| §3.4 fibrewise infimum (new) | W=[0,1]∪({½}×[0,1]), p₂=x, g=1+x−y | m(½)=0.5, m(½+10⁻⁹)=1.5: not continuous, lower semicontinuous only; running minimum over dyadic annuli is monotone and positive | pass; README's caveat is correct and Freedman–Quinn's continuity claim is a gap (Source issues) |
| §3.4 Lean vs README generality (new) | `#check` | same hypotheses and conclusion; `h 0 = 0` redundant with the fixing clause; continuity of a,b,c unused by the route | pass; note only |
| §3.5 extension over the zero section (new) | ε(r)=r/10 | a map moving radius r within [0.9r, 1.1r] has inverse moving s within [s/1.1, s/0.9] ⊂ [s−s/9, s+s/9]: both continuous at 0 | pass |
| §3.5 point case (new) | N = point | a ≡ 0 allowed by `0 ≤ a t`; Freedman–Quinn's a > 0 is the special case; strictness of a(t) < d(h(t)) holds since d > 0 | pass |
| Conventions: signed signature (r7) | S²×S²; −CP² | inertia (1,0,1) gives 0; (0,0,1) gives −1 | pass |
| Conventions: torsion quotient (r7) | S⁴; Enriques | rank 0, empty determinant 1; rank 10, 2t=0 pairs to 0 | pass |
| §1.1 CP² ring, product (r7) | line; S²×S² | h²[CP²]=1, h³=0; a²=b²=0, a·b=1, det −1 | pass |
| §1.2 twisted bundle (r7) | H=S+F, E=S | S²=−1, F²=0, S·F=1; diag(1,−1) | pass |
| §1.3 sums (r7) | CP²#−CP²; CP²#CP²; M#S⁴ | σ=0, χ=4; σ=2; Δχ=0 | pass |
| §1.4 matrices (r7) | 0-, +1-unknot; Hopf | [0], [1]; H, det −1 | pass |
| §1.4 slide (r7) | diag(0,1), two P | PᵀQP=`[[1,1],[1,1]]`, det 0; diag(0,1) | pass |
| §1.4 blow-up (r7) | empty link + unlinked +1-unknot | H₂: 0 → ℤ with [1]; boundary S³ both | pass |
| §1.4 Arf definition (r7) | Hopf annulus; T(2,4) | radical dim 1 both; q=0 on ⟨e₁+e₃⟩ for T(2,4) | pass |
| §1.4 Levine congruence (r7) | six knots; 588 matrices | Δ(−1) ≡ 1,5,5,1,5,1 mod 8; Arf 0,1,1,0,1,0; 0 failures | pass |
| §1.4 pinned normalization (r7) | `alexander` | T^(−g)·det(T·V−Vᵀ); Δ(1)=1 | pass |
| §1.4 T(2,4) (r7) | V 3×3 | det(V+Vᵀ)=−4; Arf 1 | pass |
| §1.4 T(2,4) Jones (r7) | u=e^{iπ/4} | √2; Arf 1 | pass |
| §1.4 reversal (r7) | one component reversed | annulus [±2], Arf 0; factor −1 | pass |
| §1.4 smooth slice-disc proof (r7) | genus g; trefoil | H₁(exterior)=ℤ; kernel dim g; trefoil Arf 1 | pass |
| §1.4 Spin comparison (r7) | unknot core | q=0=V(x,x) mod 2 | pass |
| gap:finite-quadratic-arf (r7) | hyperbolic; anisotropic; m=0 | Gauss sums 2, −2, 1 | pass |
| gap:three-manifold-smoothing (r7) | S³; D³; C=∂ | relative form agrees near C | pass |
| gap:alexander-module-presentation vs MorseNovikov N6 (r7) | zero surgery vs exterior | H₁ of the two covers agree | pass |
| §1.5 boundary (r7) | [0]; [2]; [1] | ker, coker: ℤ,ℤ; 0,ℤ/2; 0,0 | pass |
| §1.6 E₈ (r7) | Cartan matrix | minors 2,3,4,5,6,7,8,1 | pass |
| §2.1–2.2 (r7) | r=0,1,2; Q | π₃ ranks 0,1,3; QC=I | pass |
| §2.4 isotropic splitting (r7) | H; diag(1,−1); diag(1,−2) | x²=2y² has no nonzero solution | pass |
| §3.1 order (r7) | §1.4 → §3.6 | no Layer 3 item in §1.4's Needs | pass |
| §3.2 λ(f,f) (r7) | one ± double point | µ=±1, λ=±2 | pass |
| §3.2 FQ 2.9.1; KQ (r7) | locators | `freedmanquinn` 1496; `krushkalquinn` 60–61 | pass |
| §3.3 controls (r7) | 1/4 vs 1/2, 1/8, 1/4 | pass, fail, fail; winding 1 | pass |
| §3.4 Theorems 7.5–7.6 (r7) | locators | `freedmanquinn` 3854, 3906 | pass |
| §3.4 coefficients (r7) | 1, ℤ | Wh 0; K̃₀(ℤ)=0; K̃₀(ℤ[ℤ])=0; L₅(ℤ)=0, L₅(ℤ[ℤ])=ℤ | pass |
| §3.5 8.2, 9.6, §9.12, §7.8 (r7) | locators | `freedmanquinn` 4064, 4983, 5879–5887, 4041–4043 | pass |
| §3.6 surgery sequence, 11.11, Crowell (r7) | locators | `freedmanquinn` 7469; 7884–7887; 7925–7930 | pass |
| §3.6 Ω₃^Spin(S¹) (r7) | suspension | ℤ/2; TB head B2.1–B2.4 | pass |
| §3.6 topologically slice Arf (r7) | F̂ locally flat | TOP Spin torsors agree; kernel dim g | pass |
| §3.7 realization (r7) | 0, H, E₈, 2E₈, [1] | KS 0,0,1,0; odd admits both | pass |
| §4.2 formula (r7) | CP²; E₈; 2E₈ | 0; 1; 0 | pass |
| §4.2 even implies Spin (r7) | H₁ without 2-torsion; Enriques | Ext=0; w₂≠0 | pass |
| §4.3 Pontryagin square (r7) | CP²; S²×S² | 1; 2 with j(1)=2 | pass |
| §5 energy, scaling (r7) | S⁴; λ²g | 8π²k+2‖F⁺‖²; λ^{n−4} | pass |
| §5.1 index (r7) | S⁴; S²×S²; Q₈ | −3; −6; −6 | pass |
| §5.1 Kuranishi (r7) | FL §3.1 | `feehanleness` 666–668 | pass |
| §5.2 budget and names (r7) | N=5, s=3 | q=6, ℓ≥10; threshold (dim ker)²+1 | pass |
| §5.3 gluing, Donaldson (r7) | Q=−I_r | σ+r=0 | pass |
| §6.1 blowup (r7) | CP²; nine times | (4,0); (12,−8), (3H−ΣE)²=0 | pass |
| §6.3 SL₂ (r7) | A,B,S | (AB)³=−I, (AB)⁶=I | pass |
| §7.1 indices (r7) | K3; reversed | 2, 1; −2, −1 | pass |
| §7.2 E(n) (r7) | n=1,2,3 | (12,−8,10), (24,−16,22), (36,−24,34) | pass |
| §7.3 Enriques Check (r7) | v=(i,√3,i√3,1,0,0) | quadrics 0; minor −48 | pass |
| §8.1 nonrecognition (r7) | Tancer; GS 1.2.33 | `tancer` 73–76, 131–134; `gompfstipsicz` 838 | pass |
| §8.2 bound, KS (r7) | [1]; ±1 unknot | v²≤1; KS=0 | pass |
| §8.3 headline (r7) | standard ℝ⁴ | `Diffeomorph.refl` refutes the wrong instance; K3 minus 3H = 2(−E₈) | pass |
| gap:top-manifold-cw-type (r7) | Milnor 1959 | `milnor1959` 20, 37 | pass |
| gap:brown-schoenflies (r7) | Brown 1960 | `brown1960` 84, 101–103 | pass |

Eleven new rows and 52 carried rows. No instance refuted a stated theorem; the changed passages introduce no mathematical defect.

**Pinned declarations opened this round** (Mathlib `6b7abb3c`): `OrderIso` (`Mathlib/Order/Hom/Basic.lean`), used as the carrier `ℝ ≃o ℝ`; `Set.Ioi`, `Set.Ioo`, `nhdsWithin` and `Filter.Tendsto` as they appear in the elaborated type; `ContinuousOn`, `MonotoneOn`. Nothing in Mathlib or Tau Ceti at the pins states the lemma or an analogue. The previous report's list of opened declarations stands for the untouched text.

**Cross-roadmap citations.** The diff adds none; the `*Needs:*` lines, supplier table and gap list are byte-for-byte those the previous review resolved (the worker's `citations.md` and `roadmaps resolve` again report nothing unresolved). The two internal citations the diff adds are §3.5 → §3.4 (this roadmap, downward within Layer 3: §3.4 precedes §3.5) and §3.4 → Freedman–Quinn.

**Ownership against open work.** `roadmaps grep` over main and the 433 open heads for the radial-control lemma, `RadialControl`, `exists_radial`, `point-flattening` and `flattening theorem for points` returns only this README; the other `Theorem 9.7` hits are Khare–Wintenberger and Margulis–Tomanov in unrelated roadmaps. No second `Suggested.lean` or companion file declares `TauCetiRoadmap.FourManifolds.exists_radial_control_reparametrization`. The board's packages index lists no competing package.

**Declared gaps.** Unchanged (fifteen `gap:` slugs under “What GeometricTopology must provide”, each named at every use); the diff touches none. No `design/plan.json` is readable for this pull request.

## Not verifiable

- **“Teichner's September 16 E₈-cap construction”** (`README.md:1144`): no work is named, so nothing could be opened (R04).
- **Quinn, *Ends of maps I*, §3.4** (cited at `README.md:1805`, unchanged text next to the new sentence): Ann. of Math. 110 (1979), JSTOR only; cited by locator, as in the previous reviews.
- The items of the previous report's list (Moise, Munkres, Whitehead; Lickorish, Rolfsen, Robertello, Freedman–Kirby, Kirby LNM 1374; Gompf 1983; Gompf–Stipsicz beyond p. 36; the image-only scans and landing pages) concern text this head does not change and stand as recorded there.
- No `design/plan.json` is readable, so the gap slugs could not be cross-checked against a plan.

## Source issues

- **Gap** in freedmanquinn at proof of Theorem 9.7, printed p. 148 (`freedmanquinn` lines 5128–5129): the source says the infimum of p₂∘R over the exact fibre p⁻¹(K×{t}) is a continuous function of t because K is compact; it should bound the infimum below by a monotone continuous minorant built from minima over compact annuli, since the fibrewise infimum of a continuous function along a proper map is only lower semicontinuous; affects the proof.
- **Misprint** in freedmanquinn at proof of Theorem 9.7, printed p. 148 (`freedmanquinn` lines 5145–5146): the source defines h(γ_{n+1}) from d⁻¹(1/n) for all n ≥ 0, which at n = 0 reads 1/0, and d⁻¹(1/n) is undefined when 1/n exceeds the range of d; it should start the recursion at an n with 1/n in the range of d; affects nothing.
