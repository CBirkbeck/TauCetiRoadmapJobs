# Review of GeometricQuantization (pull request #1186 at 49fe13a)

**Verdict:** accepted

This is an incremental re-review of the 16 lines that changed in the folder since `48f3343`. The change applies the two remarks of the previous review: the Demailly locators in §3.3 and in the References are now given by item (Definitions 11.2, 11.3 and 12.1, Proposition 11.5, equation (9.1)) with their printed pages, the misprinted cross-reference on Demailly's p. 314 is named as such, and the glued "a2π" on line 1607 is "a 2π". Every new locator was read in the cached text and is correct. Nothing else in the folder changed, so the mathematics is as the previous reviews verified it. The gate passes, the dependency check is clean, `Suggested.lean` elaborates with `sorry` as its only warning, and no finding remains: the previous review's single finding, the branch's stale Tau Ceti pin, is outside the folder and outside what a repair can edit, and is recorded as settled below.

## Previous findings

- R01 — not repaired, settled: `lake-manifest.json` line 8 still pins Tau Ceti `a91d3aa` (Mathlib `6b7abb3c`, `lean-toolchain` `v4.35.0-rc3`); main pins `2fd255d`. The folder cites twelve Tau Ceti declarations that exist only at `2fd255d` (the README's Conventions and "From Tau Ceti" contract; `Suggested.lean` lines 17–18). Re-checked this round: at `a91d3aa` the files `Topology/FiberBundle/Principal.lean`, `Geometry/Manifold/FiberBundle/Basic.lean`, `Geometry/Symplectic/Hamiltonian/MomentMap.lean` and `Geometry/Manifold/DifferentialForm/Smooth.lean` are absent and `TwoForm/Basic.lean`:61 reads `structure SmoothTwoForm`; at `2fd255d` all four exist and `TwoForm/Basic.lean`:37 reads `abbrev SmoothTwoForm`. The repair cannot touch the manifest, and the pull request does not change it either, so a merge into main takes main's manifest and every citation is then correct; the print-only `git merge-tree --write-tree HEAD origin/main` exits 0 at this head, and since the merge base `83f4d77` main has changed only the manifest and the toolchain, nothing in this folder. The board holds no repair report; my record of the repair after review 10 is that it answered this finding as not actionable in this package because the manifest is outside the package's editable files. That reason holds, so the finding is not re-raised. Merging `origin/main` into the branch before or at final approval is the worker's or operator's step, and no edit inside the folder is needed.
- R02 of review 11 (stray emphasis) stays repaired: a CommonMark render of the whole README has emphasis only where intended (the `**local**` at line 853, the `**Checks.**` and `*Needs:*` labels, and the titles in the References).

## Verified sound

**Gate, dependency check, elaboration.**
- The worker's gate at `49fe13a`: every check `0`, `build=0`, `OK`. My re-run of the gate with `--base origin/main`: every check `0`, `OK`.
- Dependency check, complete output: `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. GeometricQuantization is line 153 of the merge order.
- `lake env lean TauCetiRoadmap/GeometricQuantization/Suggested.lean` from the worktree root: exit 0, the only output `93:8: warning: declaration uses sorry`. The file is byte-identical to the one the previous two reviews elaborated, so its `#check @` types stand: `thetaSections : ℕ → ℂ → ℝ → ℝ → Submodule ℂ (ℂ → ℂ)` and `finrank_thetaSections : ∀ k, 0 < k → ∀ τ, 0 < τ.im → ∀ α β, finrank ℂ (thetaSections k τ α β) = k`, with no section binder lost. The worker's signature listing still shows a "class `modulo`" at line 92: that is the docstring phrase "residue class modulo `k`", not a declaration.
- One-tactic probe: unchanged file, so the previous result stands (`simp`, `rfl`, `infer_instance`, `aesop` fail; `exact?` returns only the theorem). Not padding.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**The changed passages, one by one.**
- §3.3, lines 730–735. The parenthesis now cites Demailly V Definition 11.2 (p. 267) for `Pic_hol(X)=H¹(X,𝒪×)`, Proposition 11.5 (p. 268) for `H^q(X,𝒪)≃H^{0,q}(X)`, VI §9.1 equation (9.1) (p. 314) for the exponential sequence of a compact connected Kähler manifold, and says that p. 314's reference to (V-11.6), a notation item, for `H¹(X,𝒪)≃H^{0,1}(X)` is the q=1 case of Proposition 11.5. All four claims are read in the cached text (`demailly` lines 13167, 13203, 13207, 15569 and 15573; details in the source table). The three new code spans render as code with no stray emphasis.
- §6.7, line 1607: "importing a 2π constant" (was "a2π"). Text only; the 4n normalization it refers to was recomputed by the previous review and is carried in the table.
- References, lines 1970–1974: the Demailly entry lists V Definitions 11.2, 11.3 and 12.1 and Proposition 11.5 at pp. 267–268, VI §9.1 at p. 314, VII §13–§14 at pp. 358–360, and says the printed pages equal the PDF pages. In the cached extraction the `=== page 267 ===` marker is followed by the running head "§ 11. Holomorphic Vector Bundles 267", `=== page 268 ===` by "268 Chapter V. Hermitian Vector Bundles" and `=== page 314 ===` by "314 Chapter VI. Hodge Theory", so printed page = PDF page holds for every page the roadmap cites in Chapters V and VI. Definitions 11.2 and 11.3 are on p. 267, Proposition 11.5 and Definition 12.1 on p. 268.
- The two untouched passages that cite Demailly (§3.4 line 779, "VI §9.1, equation (9.1), p. 314"; §4.1 line 855, "V Definitions 11.3 and 12.1, pp. 267–268") agree with the new References entry.
- A sweep for glued words outside code spans (a common word followed directly by a digit, ℂ, π, 𝔱, ℝ or ℤ) over the whole README finds no hit.

**Sources at the locators the change touches**, read this round in the cached text (printed page = PDF page):

| Target | Locator | Text read | Supports the statement as written? |
|---|---|---|---|
| 3.3 | Demailly V Definition 11.2, p. 267 | demailly line 13167 | Yes. The Picard group is defined as `H¹(X,𝒪*)`, the group of isomorphism classes of holomorphic line bundles; the preceding sentence (line 13164) gives the bijection with Čech classes for rank one. |
| 3.3, 4.1 | Demailly V Definition 11.3, p. 267 | demailly line 13179 | Yes. The canonical (0,1)-connection `d''` of a holomorphic bundle. |
| 3.3 | Demailly V Proposition 11.5, p. 268 | demailly lines 13198–13203 | Yes. `H^{0,q}(X,E) ≃ H^q(X,𝒪(E))` for any holomorphic bundle E on a complex manifold, by the Dolbeault–Grothendieck lemma and the De Rham–Weil isomorphism. The README's `H^q(X,𝒪)≃H^{0,q}(X)` is the case E trivial. No compactness is needed, and the README assumes none here. |
| 3.3 | Demailly V (11.6), p. 268 | demailly line 13207 | Yes. It is a Notation item (the bundle `Ω^p_X`), as the README says. |
| 4.1 | Demailly V Definition 12.1, p. 268 | demailly line 13221 | Yes. The Chern connection as the unique hermitian connection with `D''=d''`, by Proposition 10.3. |
| 3.3, 3.4 | Demailly VI §9.1, equation (9.1), p. 314 | demailly lines 15564–15573 | Yes. For a compact connected Kähler X the exponential sequence gives `0→H¹(X,ℤ)→H¹(X,𝒪)→H¹(X,𝒪*)→H²(X,ℤ)→H²(X,𝒪)`, exact on the left because `exp(2πi·)` is onto on global functions. Line 15573 cites (V-11.6) for `H¹(X,𝒪)≃H^{0,1}`, which is the misprint under Source issues; the README's attribution of that identification to Proposition 11.5 at q=1 is right. |

The other sampled targets (1.1, 2.1, 2.2, 3.2, 3.4, 4.1, 4.2, 5.2, 5.3, 6.1, 6.2, 6.3a, 6.4, 6.9) are untouched by this change. Reviews 11 and 12 verified their sources (Schottenloher, Tuynman, Graham–Vogan, Sjamaar, Demailly VII, Vergne, Meinrenken, Ma–Marinescu); that is carried forward.

**Adversarial table.** New rows have values computed this round. Carried rows cite the previous reports (r11, r12) and repeat their values; ℏ=1 unless stated.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §3.3 `Pic_hol(X)=H¹(X,𝒪×)` (new locator) | ℂP¹; elliptic curve E | ℂP¹: `H¹(𝒪)=0`, `H²(𝒪)=0`, so (9.1) gives `H¹(𝒪×)≃H²(ℤ)=ℤ`, which is Pic ℂP¹ = {O(k)}. E: `H¹(𝒪)=ℂ`, `H¹(ℤ)=ℤ²`, so `Pic⁰=ℂ/ℤ²=E`, and `c₁` onto `H²(ℤ)=ℤ` since `H²(𝒪)=0`; Pic E is an extension of ℤ by E. | agrees |
| §3.3 `H^q(X,𝒪)≃H^{0,q}(X)` (new locator) | q=0 on compact connected X; q=1 on ℂP¹ and on E; q>dim | q=0: `H^{0,0}` = global holomorphic functions = ℂ = `H⁰(X,𝒪)`. ℂP¹: `h^{0,1}=0=h¹(𝒪)`. E: `h^{0,1}=1=h¹(𝒪)=g`. q>n: both sides 0 (no (0,q)-forms; `𝒪` has no cohomology above the dimension). | agrees |
| §3.3 p. 314's `H¹(X,𝒪)≃H^{0,1}(X)` is Prop. 11.5 at q=1, not (11.6) | the two Demailly items | (11.5) at line 13203 is `H^{0,q}(X,E)≃H^q(X,𝒪(E))`; with E=𝒪, q=1 it is the identification. (11.6) at line 13207 is the notation `Ω^p_X` and asserts nothing. | agrees |
| §3.3 deduction `Pic_hol(K/H)≃H²(K/H;ℤ)≃P_I` from `H^q(K/H,𝒪)=0` (q>0) and (9.1) (locators changed) | ℂP¹=SU(2)/T; ℂP²=SU(3)/U(2); SU(3)/T | (9.1) with `H¹(𝒪)=H²(𝒪)=0` makes `c₁` bijective. ℂP¹: `H²=ℤ`, `P=ℤϖ`, rank 1. ℂP²: `H²=ℤ`, `P_I=ℤϖ₂`, rank 1 = 2−1. SU(3)/T: `H²=ℤ²`, `P=ℤϖ₁⊕ℤϖ₂`, rank 2 = r−|∅|. The Kähler hypothesis of (9.1) holds: K/H is projective, connected since K is. | agrees |
| §6.7 "a 2π constant" sentence (spacing fixed) | as r12 | the 4n normalization: `2π·8π‖Φ‖²=4‖μ‖²` under `ω=2πω_S`, `μ=2πΦ` (r12) | agrees (r12) |
| §3.2 period identity `∫_(C_α) ω/(2πℏ)=⟨λ\|_T,α∨⟩` (r12) | SU(2), SO(3) at r=1/2, 1; Levi root | 1; no λ at SO(3) r=1/2; 2=2=2; period 0 | agrees (r12) |
| §3.4 forgetful map `X^*(T)→P` and Check (r12) | SO(3); SU(2); U(1); SU(3), I={α₁} | 2a, image 2ℤ; a↦a; kernel ℤ; `P_I=ℤϖ₂` | agrees (r12) |
| §3.4 SO(3)/SU(2) numerics (r12) | k=1,2 | area 4πr=2πℏ at r=ℏ/2, k=1; (−1)^k; period 4π | agrees (r12) |
| §3.4 central phases (r12) | U(2), U(3) | `ζ^{−k}`: −1, `e^{−2πi/3}`, 1 | agrees (r12) |
| §6.6 potential and bounded comparison (r12) | ℂP¹ conic | `κ=2log cosh a`; difference → `log(4/3)` | agrees (r12) |
| §6.6 finite-support criterion (r12) | generic point; [1:0] | semistable; unstable, `Mss=ℂ×` | agrees (r12) |
| §6.7 invariant-section equations (r12) | general | `∇_{JX_a}s=−nη_a s`, `grad μ_a=JX_a` | agrees (r12) |
| §6.7 growth `d/dt‖s‖²=4n‖μ−ξ‖²‖s‖²` (r12) | ℂP¹, s=xy, n=2, ξ=1/2 | 4/81 both sides at μ=1/3; 72/625 at μ=1/5 | agrees (r12) |
| §6.7 Kostant bound (r12) | same | max 1/4 at μ=1/2 ∈ Z_ξ | agrees (r12) |
| §6.7 chain `H⁰(M,L^n)_λ ≃ … ≃ H⁰_orb(R_ξ,L_(n,λ,ξ))` (r12) | n=2, λ=1, 3 | 1,1,1; 0,0,0 | agrees (r12) |
| Docstring lines 17–18 (r12) | both pins | true at `2fd255d`; carriers absent at `a91d3aa` | settled (see Previous findings) |
| §5.2 projective dimensions (r12) | ℂP¹ k=0,1,2; ℂP² k=2 | 1, 2, 3; 6 | agrees (r12) |
| Conventions `[X_f,X_g]=−X_{ {f,g} }` (r11) | f=q², g=p | `2∂p` vs `X_{2q}=−2∂p` | agrees (r11) |
| Conventions `F_∇=−(i/ℏ)ω` (r11) | `∇=d+iθ/ℏ` | `F(∂q,∂p)=−i/ℏ` | agrees (r11) |
| §1.1 holonomy (r11) | `β=ℏdq/2` | `e^{−i/2}` | agrees (r11) |
| §2.1 lift bracket (r11) | curvature term | `+2{f,g}V/ℏ` | agrees (r11) |
| §2.2 Stone generator, deficiency (r11) | f=c; `iℏ∂q` on (0,∞) | `Q_c=c`; (0,1) | agrees (r11) |
| §2.3 descent, extension (r11) | μ≡ℏ, ℏ/2 | 1, −1; kernel Circle | agrees (r11) |
| §3.1 characters (r11) | μ₂; S₃ | 1, −1; `A₃` | agrees (r11) |
| §3.3 vanishing (r11) | ℂP¹, SU(3)/T, elliptic curve | `δ_ij`; `h^{0,1}=1` | agrees (r11) |
| §4.1–4.2 (r11) | `P=span ∂p`; `p²` | `Q_{p²}1=−p²` | agrees (r11) |
| §5.1 flow with phase (r11) | group law | `U_tU_s=U_{t+s}` | agrees (r11) |
| §5.3 headline `finrank_thetaSections` (r11) | k=0; Im τ<0; k=1, α=1/2 | k; 1; 0; 1 | true; both hypotheses needed (r11) |
| §5.3 metric and holonomy (r11) | τ=i, k=1,2 | 1, 1, −1 | agrees (r11) |
| §6.1 weights (r11) | ℂP¹ (0,2) | image [−2,0] | agrees (r11) |
| §6.2 residues (r11) | m=3 | k≥4 | agrees (r11) |
| §6.3a fixed components (r11) | ℂP¹ O(1); ℂP² | `1+u`; `2+t⁻¹` | agrees (r11) |
| §6.4 limit (r11) | ℂP¹; ℂP² O(1) | 1/2; 1/2 | agrees (r11) |
| §6.5 cosets (r11) | doubled ℂP¹; `[pt/μ₂]` | 2; 1, 0 | agrees (r11) |
| §6.8 inertia (r11) | `[pt/μ₂]`; ε=1/2, C₀=3 | 1, 0; 0 at n=6, 1/2 at n=7 | agrees (r11) |
| §6.9 counts (r11) | (0,1,2), n=6 | `⌊j/2⌋+1`; 1, 3/2 | agrees (r11) |
| §6.10 transport (r11) | T² on ℂP¹ | `(−j,nb)` | agrees (r11) |
| §6.11 densities (r11) | (0,1,−2) | 1/3, 1/6 | agrees (r11) |

**Headline theorems.** Unchanged since r11: §5.3's degree-k torus quantization is stated as `finrank_thetaSections`; §§2.1–2.3, 3.1–3.4, 4.2–4.3, 5.1–5.2 and 6.2–6.9 are named in the docstring as not statable, each with the carrier it lacks. No stand-in.

**Library declarations opened this round.** Tau Ceti `a91d3aa` and `2fd255d` as listed under Previous findings (`git cat-file -e` on five paths, `TwoForm/Basic.lean` lines 37 and 61). Mathlib: `Suggested.lean` is unchanged, so the five `JacobiTheta.TwoVariable` names stand as r11 and r12 checked them.

**Cross-roadmap citations.** The changed passage cites ComplexKahlerGeometry K4 and ComplexComparisonPartII C5.4 and C0.3 on unchanged lines; r11 resolved them on main and nothing has moved (the worker's `roadmaps resolve` finds no missing citation, the overlap listing names no pull request that changes this roadmap and no dropped or revision-only id). Ownership: no changed passage introduces an object; r11's ownership grep over main and the open heads is carried forward.

## Not verifiable

- **Elaboration at main's pins.** The Lean commands allowed here build at the branch pins `a91d3aa`/`6b7abb3c`. At main's pin I compared declarations with `git cat-file` and `git show`, and checked with a print-only `git merge-tree` that the merge has no conflicts.
- **Context-only references** (Kostant, Woodhouse, Śniatycki, Cannas da Silva, Kodaira 1954, Meinrenken–Sjamaar) carry no locator and no claim rests on them; not read.

## Source issues

- **Misprint** in demailly at VI §9.1, printed p. 314 (demailly line 15573): the source cites (V-11.6), a notation item, for `H¹(X,𝒪)≃H^{0,1}(X)`; it should cite (V-11.5), the Dolbeault–sheaf comparison, at q=1 (demailly line 13203); affects nothing.
