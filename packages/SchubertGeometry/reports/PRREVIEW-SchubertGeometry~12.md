# Review of SchubertGeometry (pull request #1224 at 25ea793)

**Verdict:** needs changes

Incremental re-review of the 19 lines changed since 79a11f9: the S4 item of the `Suggested.lean` module docstring. The README is unchanged, and no file outside the folder changed.

## R01 (P2) — The branch still builds at Tau Ceti a91d3aa, so README and Lean disagree about the pin and the S4 headlines stay unstated

**Location:** `TauCetiRoadmap/SchubertGeometry/Suggested.lean:7–8`: “None of the following headlines is statable at the pins this folder's manifest fixes, so nothing is stated”; lines 18–30 (the rewritten S4 item). `README.md:3`: “consumed from the pinned Tau Ceti”; `README.md:16`: “already in the pinned Tau Ceti”; `README.md:437`: “Suggested.lean lists the headline theorems and the carriers missing at the pins.”

**Claim:** The README's From Tau Ceti contract cites `TauCeti.LSPath`, `TauCeti.PLPath.lower`, `TauCeti.NormalCrystal` and the Demazure operators as present at the pin (lines 189–214, 966–1081). The docstring says the manifest's pin has none of them. Both cannot hold at one pin. The pull request does not touch `lake-manifest.json`, so after the merge the folder builds at main's Tau Ceti `2fd255d`, where every carrier the S4 item names exists and the S4.2, S4.3 and S4.4 headlines are statable but absent. Commit c339e23c stated all four.

**Witness:** `lake-manifest.json:8` pins Tau Ceti `a91d3aafa8…`; in that tree `grep -rl` for `LSPath`, `NormalCrystal`, `dotAlternatization`, `demazureOperator` returns 0 files. Main's manifest pins `2fd255d9…`, whose tree has `LSPath/Basic.lean:101,217`, `LSPath/RootOperator.lean:662,671`, `Crystal/Basic.lean:87`, `Denominator/Integral.lean:209`, `Demazure/Basic.lean:81`. `git merge-tree --write-tree origin/main HEAD` exits 0.

**Repair:** For the worker or a human, since a README/Lean repair round cannot move the pin.

1. Merge origin/main into the branch (conflict-free; afterwards `lake-manifest.json` pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`).
2. Restore the folder as of c339e23c (`git checkout c339e23c -- TauCetiRoadmap/SchubertGeometry`): its `Suggested.lean` states `exists_toPLPath_eq_of_lower_eq_some`, `exists_toPLPath_eq_of_raise_eq_some`, `reflTransGen_lower_toPLPath_straight` and `weylDenominator_mul_finsum_single_eq_dotAlternatization`, with the hypothesis pattern of `TauCeti.LSPath.forall_raise_eq_none_iff` (`LSPath/Highest.lean:73–78`), and its README names them in S4.2–S4.4. Its docstring lists as missing only the crystal structure on `TauCeti.LSPath`, true at `2fd255d` (no `Crystal/` file mentions `LSPath`; `LSPath/StringLength.lean:28` mentions `TauCeti.NormalCrystal` only in a comment).
3. Retest after the merge: `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean` should report only `sorry` warnings, and the gate's `imports` and `build` checks should be 0.

If the merge is deferred instead, the present head is the correct file for the branch pin and this finding stays carried; nothing else in the folder needs to change.

## Previous findings

- R01 — not repaired: `lake-manifest.json:8` still pins Tau Ceti `a91d3aa`; `Suggested.lean` declares nothing and its docstring (lines 7–8) says no headline is statable at the manifest's pins. Now R01.
- R02 — repaired: lines 23–26 now read “`RootPairing.dotAlternatization` of `…/Denominator/Integral.lean`, a file that revision does not have either; the Weyl denominator `TauCeti.weylDenominator` of `…/Denominator/Basic.lean` is present there.” Both halves are true at `a91d3aa` (`Basic.lean:72`; no `Integral.lean`).

## Verified sound

**Scope and gate.**
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchubertGeometry'` is empty. Since 79a11f9 only `Suggested.lean` changed (11 insertions, 8 deletions), matching `changes.md`.
- My run of the gate on 25ea793 reports every check at 0 and `OK`; the worker's run also reports `build=0`.
- `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean`, from the worktree, exits 0 with no output (6 s).
- Dependency check: `depcheck: 238 roadmaps, 2323 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line for SchubertGeometry.
- The file has one module docstring, `import Mathlib`, an empty `namespace TauCetiRoadmap.SchubertGeometry` and no declaration: nothing to probe with one tactic, no `#check @name` signature to compare, no sorry'd data, no `set_option`, no fully qualified name that can collide. The changed lines contain no LaTeX delimiter, `lemma`, pull-request number, process word or machine path.

**The changed docstring item, clause by clause.**
- “`TauCeti.LSPath`, … `TauCeti.LSPath.toPLPath` and … `TauCeti.PLPath.lower` and `TauCeti.PLPath.raise` of `TauCeti/RepresentationTheory/LSPath/`”: at `2fd255d`, `LSPath/Basic.lean:86,101` (`namespace TauCeti`, `structure LSPath`), `:217` (`toPLPath`), `LSPath/RootOperator.lean:88,90,662,671` (`namespace TauCeti`, `namespace PLPath`, `lower`, `raise`). Names and directory correct.
- “a directory the Tau Ceti revision this folder's manifest pins does not have”: at `a91d3aa`, `TauCeti/RepresentationTheory/` has no `LSPath/` and no `Crystal/`. True.
- “`RootPairing.dotAlternatization` of `…/Denominator/Integral.lean`, a file that revision does not have either”: at `2fd255d`, `Integral.lean:80,209` (`namespace RootPairing`, `def dotAlternatization`); at `a91d3aa`, `Denominator/` holds `Basic`, `Identity`, `Reflection` only. True.
- “`TauCeti.weylDenominator` of `…/Denominator/Basic.lean` is present there”: `Basic.lean:72` at `a91d3aa`. True (this is R02's repair).
- “normal crystals `TauCeti.NormalCrystal` of `TauCeti/RepresentationTheory/Crystal/`, also absent from that revision”: at `2fd255d`, `Crystal/Basic.lean:75,87` (`namespace TauCeti`, `structure NormalCrystal (B : Type x₁)`); 0 files mention `NormalCrystal` at `a91d3aa`. True.
- “the crystal structure on `TauCeti.LSPath` that S4.1 and S4.3 construct from operator stability”: README line 1028 says exactly that (“S4.2's operator stability makes `TauCeti.LSPath P b λ` … by S4.1's dictionary it is a `TauCeti.NormalCrystal` B(λ)”), and README lines 333–336 say the native files do not put one there. At `2fd255d` no file under `LSPath/` or `Crystal/` declares a `NormalCrystal` on `LSPath`. True.
- The S4.2/S4.3/S4.4 labels match the README headings (lines 1005, 1024, 1043): S4.2 Root operators, S4.3 LS chains and interval bonds (where the generation statement sits, line 1028–1032), S4.4 Characters and tensor components.
- The S3 item (unchanged this round) is still true at `a91d3aa` (`Weyl/` has no `Demazure/`; 0 files mention `demazureOperator`) and false after the merge: part of R01.

**Ownership and cross-roadmap citations.** `roadmaps grep 'TauCeti\.NormalCrystal|TauCeti\.LSPath'` matches only this folder (58 lines of #1224), so the names the docstring adds have no second owner and the file declares nothing that could collide. `scratch/overlaps.md`: no open pull request changes this roadmap, no id dropped in either direction. The five leads of `scratch/citations.md` (BrionFlags, KnutsonBottSamelson, KnutsonDemazure, SerreGAGA, KnutsonSymplectic) are manifest source ids, not roadmaps. The changed lines cite no roadmap.

**Seeded sample.** Every sampled target (S2.2, S3.1, S3.2, S3.4, S3.5, S4.1, S4.2, S4.5, S5.1, S5.6, S6.3, S7.2, S7.3, S8.2, S9.0) lies in README text the diff leaves untouched; the diff touches only the Lean docstring. Where the sample meets the S4 carriers (S4.1, S4.2), the previous report's locator checks stand: Littelmann1995 Proposition 4.7 at line 502 (p. 511), Corollary 2 at line 520 and Corollary 3 at line 524 (p. 512), Theorem 9.1 at line 815 (p. 520). No locator changed.

**Adversarial table.** Rows tagged (r11) or (r10) are carried from the previous reports for statements the diff leaves untouched, with the values computed there. Rows without a tag were computed this round.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| **Docstring S4 item (changed)** | branch pin a91d3aa; main pin 2fd255d | a91d3aa: grep counts LSPath 0, NormalCrystal 0, dotAlternatization 0, demazureOperator 0, `def weylDenominator` 1 (`Basic.lean:72`); `RepresentationTheory/` has 0 of {LSPath, Crystal}. 2fd255d: `LSPath/Basic.lean:101,217`, `RootOperator.lean:662,671`, `Crystal/Basic.lean:87`, `Integral.lean:209`; LSPath crystal instance 0 files | true at the branch pin; R01 after the merge |
| **Docstring heading line (unchanged, depends on change)** | both pins | “nothing is stated” is forced at a91d3aa (imports fail); at 2fd255d four S4 statements elaborate by reading (r11 rows below) | R01 |
| Docstring S3 item | both pins | a91d3aa `Weyl/`: no `Demazure/`; 2fd255d: `Demazure/{Basic,Braid,LongestElement,Parabolic}.lean`, `Basic.lean:71,81` `RootPairing.demazureOperator` | R01 (r11) |
| S4.2 bullet 3 | SL₂ shape 2, F=id; GL₂ λ=(1,0), f(x,y)=x−y; SL₂ with F=2·id | f₁(straight): t₁=1/2, s(2)=−2, endpoint 0 = realization of (s₁,1;0,1/2,1). GL₂: s(1)=−1=f(0,1). F=2·id: velocity −6∉{±2}, clause necessary | pass (r11) |
| S4.3 bullet 3 | GL₃ λ=e₁; λ=0; SL₂ λ=−ω | endpoints e₁,e₂,e₃ by 0,1,2 lowerings; λ=0 reflexive; λ=−ω straight not highest, “dominant” needed | pass (r11) |
| S4.4 inserted clause | PGL₂ X=ℤα; GL₂ (1,0) non-injective f; empty root system | Δ·Σ=e^α−e^{−2α}=J(e^α); GL₂ wrong wt (2,1) breaks J, correct (1,0),(0,1) gives J; empty: Δ=1 | pass (r11) |
| Repair: stability (c339e23c) | λ=0; ι empty; SL₂ shape 2 | λ=0: lower = none, vacuous; ι empty vacuous; SL₂ as above. Binders as `Highest.lean:73–76` | pass, read (r11) |
| Repair: generation (c339e23c) | λ=0; GL₃ e₁ | `ReflTransGen` reflexive; chain straight→f₁→f₂ via `lower_map` | pass, read (r11) |
| Repair: character (c339e23c) | λ=0; PGL₂ α; ι empty | Δ·1=J(1); PGL₂ as above; ι empty 1·e^λ=e^λ. `[P.IsReduced]`, `[Fintype P.weylGroup]`, `[CharZero ℤ]`, `[Finite ι]` | pass, read (r11) |
| S1.0 canonical line | GL₂ over ℤ, ℙ¹ | det(Lie B)*=O(2); weight-one line degree 1 | pass (r10) |
| S1.0 Borel of ℍ | (−1,−1)/ℝ | conic x²+y²+z²=0, no real point | pass (r10) |
| S1.0 cells | GL₃/𝔽₂; ℙ² | 1+2+2+4+4+8=21=168/8; 1+2+4=7 | pass (r10) |
| S1.1 incidence | rank 3, ranks (1,2); k[ε] | ℙ²×ℙ²* dim 4, flag dim 3; e₁+εe₃↦ε·ē₃≠0 | pass (r10) |
| S1.3 pivots | Gr(2,4): (1,2),(1,3),(3,4); N=0 | Σ(p_i−i)=0,1,4; λ=(2,2),(2,1),(0,0) | pass (r10) |
| S1.5 Gram | columns (u;u,f;f) | blocks (1,3)=I_r, (3,1)=−I_r, (2,2)=J₀ | pass (r10) |
| S1.5 product/inverse | r=s=1 | YᵀJ₀Y′=−2; product ((4,6),9); inverse check 0 | pass (r10) |
| S1.5 conjugation | l=diag(A,D,A^{−T}) | (1,2) AYᵀDᵀJ₀; (2,3) DYAᵀ; (1,3) AZAᵀ | pass (r10) |
| S1.5 dimension | m=2: r=1,2,3 | 3, 3, empty; 10−7=3 | pass (r10) |
| S2.3 weights | Q=i; Q=ii | β=±α_i; δ(ii)=s_i; sections e,s_i,s_i,e | pass (r10) |
| S2.5 kernel | SU₂×U₁→U₂ | {(I,1),(−I,−1)} | pass (r10) |
| S3.1 sign | SL₂ λ=1; GL₂ det | degree 1; det degree 0 | pass (r10) |
| S3.2 dual weight | B− on ev_e | weight −λ | pass (r10) |
| S3.3 D_i strings | m=0,−1,−2 | e^λ; 0; −e^{λ+α} | pass (r10) |
| S3.3 Δ_i=ιD_iι | m≤0, 1, ≥2 | Σ_{j=0}^{−m}e^{λ+jα}; 0; −Σ_{j=1}^{m−1}e^{λ−jα} | pass (r10) |
| S3.6 word 121 | χ₀=e^{(0,5,7)} | augmentations 1,6,33,81 | pass (r10) |
| S3.6 coefficient formula | 46 weights | 1+min{2,a,b,c,7−a,7−b,7−c}; histogram 21/15/10 | pass (r10) |
| S3.6 word 212 | ψ₁..ψ₃ | 1,3,21,81; ψ₃=χ₃ | pass (r10) |
| S3.6 Gelfand–Tsetlin | 7≥u≥5≥v≥0 | 81 patterns = χ₃ | pass (r10) |
| S3.4 longest word | D₁D₂D₁e^{(7,5,0)} | = χ₃ | pass (r10) |
| S4.1 shift obstruction | φ(1/2)=1/4, χ=(1,1) | x−2y=−1/4 vs canonical 0 | pass (r10) |
| S4.2 lowering | SL₂ shape 2 | straight→(s₁,1;0,1/2,1)→(s₁;0,1), endpoints 0, −2 | pass (r10) |
| S4.2 central path | GL₂ (t,t) | height 0; strings 0 | pass (r10) |
| S4.3 connectedness route | τ₀≠e | some ⟨τ₀λ,α_i∨⟩<0 ⇒ e_i defined | pass (r10) |
| S4.3 bond 2 | a=1/2, 1/3 | three encodings; break 1/3 gives five | pass (r10) |
| S4.3 bond sign vs CFL | x>y=s_βx | −⟨xλ,β∨⟩=⟨yλ,β∨⟩ | pass (r10) |
| S4.3 transport laws | T(λ,χ;σ) | composite T(λ,χ+ψ;σ); inverse T(λ+χ,−χ;σ+χ) | pass (r10) |
| S4.4 PGL₂ | X=ℤα, λ=α | (1−e^{−α})(e^α+1+e^{−α})=e^α−e^{−2α} | pass (r10) |
| S4.4 SL₂ | X=ℤω, λ=ω | e^ω−e^{−3ω}=J(e^ω) | pass (r10) |
| S4.4 λ=0 | nonempty W | J(1)=Δ ⇒ char=1 | pass (r10) |
| S4.4 ρ−wρ | w=s_i | α_i | pass (r10) |
| S4.4 domain step | ℤ[X] | Δ≠0 ⇒ char=D_{w₀}(e^λ) | pass (r10) |
| S4.4 adjoint | sl₃ | [E₁₂,E₂₁]=H₁; determinants 1,1,−1 | pass (r10) |
| S5.1 trace | char 2, k[x] | Tr(1)=0, Tr(x)=1, Tr(x³)=x | pass (r10) |
| S5.2 ideals | σ=Tr(x·) | σ(x²)=x∉(x²) | pass (r10) |
| S5.3 kernel | SL₂→PGL₂, char 2 | μ₂ nonreduced | pass (r10) |
| S5.5 mixed union | ℙ¹, Y={0,∞} | H⁰(O_Y)=k², H¹(I_Y)=k | pass (r10) |
| S5.7 Q=ii | L=O(−2) | H⁰=0, H¹=k | pass (r10) |
| S6.4 SL₂ | degree 2 | three products vs 4 | pass (r10) |
| S7.1 covers | GL₃, ω₁, w=s₁s₂ | v=s₁: 0; v=s₂: 1 | pass (r10) |
| S7.1 non-cover | w=s₂s₁ | v=s₂: 1; v=s₁: bond 1 | pass (r10) |
| S7.1 bond sign | v=ws_β<w | −⟨wλ,γ∨⟩=⟨λ,β∨⟩ | pass (r10) |
| S7.1 ρ | w=s₁s₂ | 1 on X(s₁), 2 on X(s₂) | pass (r10) |
| S7.2 cone | Gr(2,4), X_(1) | X_(2)∪X_(1,1); dims 3, 1 | pass (r10) |
| S8.1 classes | ℙ¹; Gr(2,4) | [O_e]=[O]−[O(−1)]; rank 6 | pass (r10) |
| S8.2 | SL₂ | (1−t)²=0 ⇒ [O(1)]=2−t | pass (r10) |
| S8.3 | SL₂, z | 1⊗z: z, z⁻¹; z⊗1: z, z | pass (r10) |
| S8.4 | PGL₂ | [O(2)]=1+2u | pass (r10) |
| S8.5 | ℙ¹ | χ(O)=1, χ(O(−1))=0, χ(O(−2))=−1 | pass (r10) |
| S9.0 base change | ℙ¹ over ℂ[t] | H¹=A/t; at t=0 H⁰=ℂ | pass (r10) |
| S9.0 dual numbers | ℂ[ε]/(ε²) | H⁰ basis 1,ε | pass (r10) |
| S9.5 | GL₂ (t,0) | endpoint (0,1); +(1,1): (2,1) | pass (r10) |
| S9.6 | SU₂; SU₃ | ℝP²: ℤ,0,ℤ/2; χ=1 | pass (r10) |
| S9.7 Kähler form | J_flag=sign(α(p))J_α | B(v,w)/|α(p)|>0 | pass (r10) |
| S9.7 gradient | g=ω(·,J·) | indices 2ℓ(w) | pass (r10) |
| S9.7 ℙ¹ | regular; central | 1+q², χ=2 | pass (r10) |
| S9.8 | SL₂/B−; torus | O(1), degree +1 | pass (r10) |
| Worked: incidence flag | v=(a,b,c), ω | dim 8, weights (2,1,0) | pass (r10) |
| Worked: blowup 121 | V=k³ | C codim 2; E=ℙ¹×ℙ¹; rs=1 | pass (r10) |
| Worked: fixed plane | n=4, k₀=2 | 3=min(2,2)+1 | pass (r10) |
| Contract: tie rule | native `lower_mul` | on p iff ε(q)<φ(p) | agree (r10) |
| Contract: Demazure longest | native | Δ·D_{w₀}f=Σ sgn(w)e^{−(ρ−wρ)}w(f) | agree (r10) |
| S4.7 bullet 1, index test | GL₃ λ=e₁, six w | 1,2,1,2,3,3 both sides | pass (r10) |
| S4.7 bullet 1, W vs W/W_κ | τ₀=s₂,u=s₁s₂; τ₀=s₁s₂,u=s₂s₁ | ≤ both ways; ≰ both ways | pass (r10) |
| S4.7 bullet 2, weights | w=s₁ | e₁, e₂ both sides | pass (r10) |
| S4.7 bullet 2, w₀ | π(1)∈{−e₃,−e₂,−e₁} | e₁,e₂,e₃ | pass (r10) |
| S4.7 bullet 3, partial flags | λ=e₁, W_P=⟨s₂⟩ | θ(W_P)=W_κ | pass (r10) |
| S4.7 bullet 3, descent | λ=ρ, W_P=⟨s₂⟩ | ⟨ρ,α₂∨⟩=1≠0 | pass (r10) |
| S4.7 Checks 1–3, degenerate | GL₃ λ=e₁; w₀; s₂; λ=0; rank 0 | e₁ vs −e₁/e₃/−e₃; e₁,e₂,e₃; one section weight e₁; weight 0; weight λ | pass (r10) |

**Remark on untouched text (no change requested here):** README line 437, “Suggested.lean lists the headline theorems and the carriers missing at the pins”, becomes accurate once R01's repair lands; it is the same remark as in the previous report.

## Not verifiable

- I did not elaborate the c339e23c statements at Tau Ceti `2fd255d`: this job runs Lean only in the pull request's worktree, pinned to `a91d3aa`, where their imports do not resolve. I read the native signatures at `2fd255d` (files and lines above) instead.
- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 are uncertified and cited by locator only; I read no text of them.
- The seeded-sample targets are all in README text the diff leaves untouched; their locators were read in the reviews at 39437f2, aab273f and 79a11f9 and were not re-read this round.
- LLM Proposition 14: the OCR reading “w>τ₁” against the README's “initial direction at most w” is unchanged from the previous reports.

## Source issues

- none
