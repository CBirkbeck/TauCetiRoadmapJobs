# Review of GanGrossPrasadUnitaryGroups (pull request #1404 at 7ec0f14)

**Verdict:** accepted

Incremental re-review of the 38 lines changed since f802dd1. The one blocking finding of the previous review (phantom supplier declaration names) is repaired, the five phantom AutomorphicLFunctionsAndLocalFactors anchors are replaced by target numbers that exist at the supplier's head, and the RG2.4 label is gone. Three P3 notes remain: two findings of the previous review were left untouched (the board's `design/plan.json` and `sources.toml`), and the repair of the RG2.4 label cites one section for material it does not contain. No P1 or P2 finding; the gate passes.

## R01 (P3) — `design/plan.json` still names different suppliers and sections than the README for five gaps

Location: `packages/GanGrossPrasadUnitaryGroups/design/plan.json`, `gaps` entries `enhanced-packets`, `global-parameters`, `ordinary-endoscopy`, `spectral-isolation`, `hermitian-unitary`; `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` lines 75, 143, 145 ("The section contract is a Hermitian-form continuation section of ReductiveGroupsPartII"; "The section contract is §§11.2–11.3"; "The section contract is §11.4").

Claim: the plan and the README declare the same gaps, so the intake announces each on the supplier the README argues for.

Witness: the plan is byte-identical to the one the previous review read. `enhanced-packets` supplier ModularityAndLanglandsExtensions "3.13, 3.15 and 3.20" against README EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.3; `global-parameters` supplier ModularityAndLanglandsExtensions "5.1 and 5.4" against README §11.4; `ordinary-endoscopy` section "Layers 2–5 and 11.2–11.4" against README "Layers 2–5"; `spectral-isolation` section "proposed Part II §§SM.0–SM.5" against README "requested Schwartz-multiplier continuation of §6.3"; and, new since the R04 repair, `hermitian-unitary` section "RG2.4: arbitrary-form Hermitian continuation" against README "a Hermitian-form continuation section of ReductiveGroupsPartII". The 36 slugs agree on both sides (checked by script), so every gap counts as declared; only the addressee and section differ.

Repair: edit the five `gaps` entries of `design/plan.json` so that `supplier`, `section` and `needs` are the README's (the plan's `gaps` list is the one part of the plan a package may change). Carried from the previous review's R02.

## R02 (P3) — two cited sources are still missing from the manifest

Location: README References lines 1432 (`bpc-bessel`) and 1434 (`kmsw`), cited with line locators at README line 564 (§3.1) and line 946 (§4.4); `packages/GanGrossPrasadUnitaryGroups/sources.toml`.

Claim: every cited work is recorded in the manifest and its line locators refer to a cached extraction.

Witness: the manifest still has exactly the 17 keys the previous review listed (xue-real … ag-descent); `grep -c 'bpc-bessel\|kmsw'` on it returns 0. The previous review fetched both texts through the sources service and confirmed the line locators against them.

Repair: add both keys to the manifest with the service's provenance (bpc-bessel from the author page named in References, licence class author-page; kmsw from arXiv 1409.3731v1). Carried from the previous review's R05.

## R03 (P3) — gap:hermitian-unitary cites RG2.2.4 for rank-one `SU_3` examples it does not contain, and dates itself with "on main"

Location: `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` line 75: "whose Hermitian forms and unitary groups appear on main only as the rank-one `SU_3` examples of RG2.1 and RG2.2.4 and the quaternionic forms of RG2.3.5".

Claim: ReductiveGroupsPartII's Hermitian material sits in RG2.1, RG2.2.4 and RG2.3.5.

Witness: in `TauCetiRoadmap/ReductiveGroupsPartII/README.md` on main, every `SU_3`/unitary mention falls in RG2.1.2–RG2.1.4 (lines 1630–2224), the Layer RG2.1 Examples (line 2783, *unitary-rank-one-example*, the quasi-split unitary group in three variables), RG2.3.1 (line 3996, `bigCell_su3`), RG2.3.4 (line 4633) and RG2.4.2/RG2.4.4; RG2.2.4 "classical groups, the tree and examples" (lines 3408–3760) contains no unitary, Hermitian or `SU_3` sentence (its examples are `GL_m`, division-algebra and `PGL_2` tree models). RG2.3.5 lines 4759–4791 do carry the quaternionic Hermitian forms. "On main" is a repository-state reference the house style excludes (timeless prose).

Repair: write "whose Hermitian forms and unitary groups appear only as the three-variable quasi-split unitary example of RG2.1 (its root data in RG2.1.2–RG2.1.4 and its parahoric models in RG2.3.1 and RG2.3.4) and the quaternionic Hermitian forms of RG2.3.5". The substance of the previous R04 repair (no borrowed section number; the gap is a new continuation section) stands.

## Previous findings

- R01 — repaired: lines 17, 141, 143, 145 now read "the extended local unitary packets of §11.3" and "the unitary classification contract of §§11.0d–11.0e (the Mok and weighted-stabilization inputs)"; neither backticked name occurs anywhere in the README; §§11.0d, 11.0e, 11.2, 11.3, 11.4 exist at the supplier's head with those subjects.
- R02 — not repaired: `design/plan.json` unchanged (this report's R01, now five entries after the R04 repair moved the README's section label).
- R03 — repaired: every anchor and slug replaced by "The Whittaker realization (AL.3.1.2)", "The local Rankin–Selberg integrals (AL.3.2.1)", "Local convergence and continuity (AL.3.2.2)", "The Rankin–Selberg local L-factor (AL.3.2.3)", "The normalized adjacent-rank period (AL.3.8.1)", "Archimedean Whittaker comparisons (AL.R.1)"; all six are headings at the supplier's head; no `README.md#` anchor or `rs-local`/`whittaker-model` string remains.
- R04 — repaired: "RG2.4: arbitrary-form Hermitian continuation" replaced by "a Hermitian-form continuation section of ReductiveGroupsPartII … arbitrary-form Hermitian continuation"; the repair's description of where the supplier's Hermitian material sits is wrong in one of three sections (this report's R03, P3).
- R05 — not repaired: `sources.toml` unchanged, 17 keys, no `bpc-bessel` or `kmsw` (this report's R02).

## Verified sound

**Gate.** The worker's gate at 7ec0f14 passes every check including the targeted build (`build=0`). My rerun of the scanners (`gate … --base origin/main`) reports every check zero, OK. The dependency check: `depcheck: 204 roadmaps, 1392 edges, 0 problem(s)`, no UPWARD or CYCLE line, no `moved:` line. The outside-folder diff (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GanGrossPrasadUnitaryGroups'`) is empty; the change set touches only `README.md` (19 insertions, 19 deletions).

**Lean.** `lake env lean` on `Suggested.lean` at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf, read from the worktree's `lake-manifest.json`) exits 0 in 2.5 s with no output. The file is unchanged since the previous review: a module docstring naming every headline theorem with its missing carrier, an empty namespace, no declaration; so there is no `#check` probe and no one-tactic padding probe to run, and `signatures.md` records no named declaration. The previous review's statability check (no smooth/admissible or Casselman–Wallach carrier, no local-field class, no arbitrary-form unitary group at the pins) is not disturbed by a README-only change.

**Changed passages, read in full.** The diff renames citations in the Scope paragraph (line 17), the ReductiveGroupsPartII contract (line 75), the EndoscopicTransferAndUnitaryTraceComparison contract and its two gaps (lines 141–145), the AutomorphicLFunctionsAndLocalFactors import paragraphs (lines 179–181), the *Needs:* lines of §§3.10, 3.11, 5.1a, 5.3 and 6.1, the proof-route sentences of §§3.11, 5.1a, 5.3 and 6.1, and the Dependencies lists of Layers 3, 5 and 6. No hypothesis, formula, Check or locator changed; I compared each new sentence with its old one and with the cited supplier text.

**Cross-roadmap citations resolved this round** (via `roadmaps show` at the open heads; ReductiveGroupsPartII on main):
- EndoscopicTransferAndUnitaryTraceComparison: §11.0d "Quasi-split unitary local classification" (Mok's Whittaker normalization, simultaneous induction with §§11.0a–11.0c weighted fundamental lemma and stabilization), §11.0e "Quasi-split unitary global classification" ("produces the unitary classification contract used in §§11.2–11.4"), §11.2 "Tempered local unitary packets with inner-twist pairings", §11.3 "Extended local unitary packets by positive-exponent induction" (Π_ψ(G,ξ) by induction from a bounded Levi packet, KMSW (1.6.3)–(1.6.4), hypotheses "the unitary classification contract of §§11.0d–11.0e"), §11.4 "Endoscopic classification of unitary groups for generic parameters". The README's new wording matches these subjects and the supplier's own name for its premise.
- AutomorphicLFunctionsAndLocalFactors: AL.R.1 (line 244), AL.3.1.2 (1885), AL.3.2.1 (1924), AL.3.2.2 (1954), AL.3.2.3 (1964), AL.3.8.1 (2205). AL.3.8.1 states λ_v(s,W)=∫W(diag(h,1),h)|det h|^s dh, the entire normalized quotient, H_v-invariance, spherical value 1 with the stated Haar, and tempered convergence for Re(s)>−1/2, which is exactly what the README's import paragraph attributes to it; AL.3.2.1's Ψ_j carries exponent s−(n−m)/2 (see the table row for the shift).
- ReductiveGroupsPartII on main: Layer RG2.1 Examples line 2783 (*unitary-rank-one-example*, quasi-split `SU_3(K'/K)` for the antidiagonal Hermitian form), RG2.1.2 line 1630 (`SU3_full_ray`), RG2.3.5 line 4759–4791 (quaternionic Hermitian forms, `quaternionicHermitian_local_rank_one`); RG2.2.4 lines 3408–3760 (R03); RG2.4 line 5509 "decompositions and double cosets" (no longer cited by the gap).

**Gap audit.** 36 `gap:` slugs in the README, 36 entries in `plan.json`, the two sets equal (script). Every gap names a supplier; the `needs` sentences are unchanged since the previous review, which found each precise and minimal. The declared-gap list of this brief still reflects the plan's suppliers (R01).

**Sources, seeded sample where it falls in the changed passages** (every locator opened in the cached extraction; the statement there supports the README as written):
- 3.10: ggp line 2386–2388 (Conjecture 17.1), 2394–2405 (Theorem 17.2: split k, dim W^⊥ = 0 or 1 by local Rankin–Selberg theory; nonarchimedean general case via Theorems 15.1, 16.1).
- 3.11: ggp line 1624–1639 (f(u)=(x_1,…,x_{n−1},z), ν(u,g)=ψ(Σx_i+z), stabilizer G(W), independence of choices), 2394–2405.
- 5.1a: zhang-period line 1543–1551 (Proposition 4.10, α(W,W′)=λ(W)λ(W′) for tempered π, nonvanishing of the local Rankin–Selberg integral and multiplicity one).
- 5.3: harris line 170–181 (assumptions for v∉S: S contains all even and archimedean places, unramified E/F, hyperspecial K, volume 1, unit spherical vectors), 907–914 and 1140–1147 (§2.2.2 calculation, quasi-split and split cases, recursion A_{l+1}=A_l(L(2l+1,χ)ζ(2l+2))^{−1}), 1289–1294 (Theorem 2.12, the spherical value as Δ·L(1/2)/L(1,Ad)L(1,Ad)); bpcz line 168–169 ((1.1.6.1), P♮=vol(U′_h(O_v))(φ_v,φ_v)_v almost everywhere); zhang-period line 675–678 ((3.3), ϑ_w=vol(K_{n,w})L(1,Π_w×Π̃_w)), 982–986 ((3.26), λ_w♮(W_w)=vol(K_{n,w})).
- 6.1: bpcz line 4122–4153 (λ(W)=Z^RS(0,W); β_η with (Δ^{S,*}_{G′})^{−1}L^{S,*}(1,Π,As_G), L(s,Π,As_G)=L(s,Π_n,As^{(−1)^{n+1}})L(s,Π_{n+1},As^{(−1)^n}); ⟨,⟩_Whitt with L(1,Π,Ad); Theorem 8.1.2.1).
The remaining sampled targets (1.1, 3.8, 3.9, 4.2, 4.4, 5.2, 5.4, 6.2, 6.4, 7.2) are untouched by the diff; their locators were opened and found correct in the previous review and are not reopened here.

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous review (marked r1, values as computed there); the two rows marked r2 are the statements the diff changed.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| r2: AL.3.2.1 shift "Ψ₀(s+1/2,W_(n+1),W_n) has exponent s" | n+1 > n, j = 0 | AL.3.2.1 exponent s−(n−m)/2 = s−1/2; at s+1/2 it is s; AL.3.8.1's λ_v(s,W) has exponent s; for n=2,m=1 the supplier's own Check gives |a|^{s−1/2} | holds | none |
| r2: §5.3 "normalized spherical value 1 converts to c_n=vol_{dg^d}(GL_n(O))" | n=1, F=ℚ_p, self-dual dx with vol(ℤ_p)=1, dg^d=|x|^{−1}dx | c_1=vol(ℤ_p^×)=1−p^{−1}=ζ_p(1)^{−1}; Zhang (3.26) gives λ♮(W°)=vol(K_n) in his measures, AL.3.8.1 gives 1 in its Haar | holds (the two normalizations differ by exactly c_n) | none |
| r1: Conventions: split rank-one group | E=F×F, rank 1 | U(h)=GL_1(F)=F×; F-dimension 2 would give GL_2 | holds | none |
| r1: Conventions: ν-covariance of P(f)=∫f ν⁻¹ | ν(h)=i | P(R(h)f)=i·P(f); weighting by ν gives −i | holds | none |
| r1: Conventions: constituent coefficient | counts (1,1),(2,1) | 1/4, 1/8; bpcz |S_Π|=2^{r_n+r_{n+1}} | holds | none |
| r1: Conventions: rescaling laws | f→cf; B_v→2B_v; Haar 2 and 1/2; global H Haar ×2 | |P|²,⟨f,f⟩ ×|c|²; α_v,B_v(x,x) ×2 so q_v fixed; local product ×1; |P|² ×4 | holds | none |
| r1: 1.1 rank and Witt index | W=0,r=0,L=⟨1⟩; W=0,r=1 | rank 1; rank 3 with maximal isotropic rank 1 | holds | none |
| r1: 1.1 field-form comparison h(x,y)=k(y,x) | E=ℂ, k=conj(x)y | h(i,1)=i; h(1,i)=−i; unswapped k(i,1)=−i | holds | none |
| r1: 1.1 split-line frame condition | e=(1,1),(1,0),(2,1) over ℚ | norms (1,1),(0,0),(2,2) | holds | none |
| r1: 1.1 split form vs MAF (ℓ(y),εk(x)) | ε=+1, v=(1,0), w=(0,1) | k(v,w)=(0,1), h(v,w)=(1,0); self-pairings 0 | holds | none |
| r1: 1.2 b(u) in split W=0, r=1 | u=[[1,x,z],[0,1,y],[0,0,1]], Gram antidiag | second factor (1,3) entry −y; b(u)=(x,−y) | holds | none |
| r1: 2.1 U(1) scalar models | weights (1,−1),(1,1), z=i | finrank 1; finrank 0 | holds | none |
| r1: 2.1 linear-first pairing | (i,1),(1,i),(cx,y),(x,cy) | i, −i, cB, conj(c)B | holds | none |
| r1: 2.2 anti-involution | U(1) nonsplit; split GL₂ unipotent | ι=id on N(z)=1; transpose [[1,x],[0,1]]↦[[1,0],[x,1]] | holds | none |
| r1: 2.3 adjacent bound | U(0)⊂U(1) | dimension 1 ≤ 1 | holds | none |
| r1: 2.4 unnormalized induction, Witt index | GL₂ upper B; W=H, r=1 | δ_B(diag(a,1))=|a|; Y rank 2 < Witt index 3 | holds | none |
| r1: 2.6 bound is not equality | U(2) std ⊗ U(1) weight ±1 | m=0; m=1 | holds | none |
| r1: 2.7 temperedness needed | split GL₂×GL₁ trivial; compact U(1) | ∫_{F×}1=∞; vol(U(1)) | holds | none |
| r1: 3.1 component groups | degree 1 nonsplit; multiplicity 2; split GL₁; zero parameter | orders 2/1, 2 with z_φ=0, 1, 1 | holds | none |
| r1: 3.1 epsilon character at z_φ | ℂ/ℝ, φ_V=χ₁⊕χ₋₁, φ_W=1 | ε(χ₁)ε(χ₁^∨)=χ₁(−1)=−1=χ_W(z) | holds | none |
| r1: 3.1 multiplicity 2 | φ_V=χ₁⊕χ₁ | generator ±1, flips under ψ_E(−1·); z_φ=0 gives +1 | holds | none |
| r1: 3.1 central-element identity | Fin 2→ZMod 2, d=(1,1); d=(2) | χ(z_d)=0=1+1; z_d=0 while e₀≠0 | holds | none |
| r1: 3.2 change of ψ_E | dim(2,1), t nonnorm | V ×η(t)=−1; W ×η(t)²=1 | holds | none |
| r1: 3.4 Δ and c_θ | W=ℂ, x=−1; x=1; compact U(2)×U(1) | |N(2)|=4; 1; c_θ(1)=0 | holds | none |
| r1: 3.6 Fourier identity | μ=−ε; μ=ε; A=ℤ/2 | 0; 1; delta at nontrivial character | holds | none |
| r1: 3.7 uniqueness over pure inner forms | d even, d′ odd | one pair with m=1 iff ε(φ⊗φ′)=μ(G) | holds | none |
| r1: 3.8 induction counts | (a,b)=(2,1) | steps (1,1),(1,0); counts 0 and 1 | holds | none |
| r1: 3.8 splitting characters | equal rank; n±1; complementary line | (μ^n,μ^n); (μ^n,μ^{n+(−1)^n}); (μ^n,μ^{(−1)^n}) | holds | none |
| r1: 3.8 integrated seesaw form | U(0); n=1 weights; π′ weight k+1 | F(1,1)=1; scaling i/−i; integral 0 | holds | none |
| r1: 3.8 non-example | V=⟨−1,−1⟩, W=⟨−1⟩ | a=2, b=1; m=0 | holds | none |
| r1: 3.9 interlacing | U(2) weight (1,0), U(1) weight ∓1 | m=1; m=0 | holds | none |
| r1: 3.10/3.11 split cases | GL₁×GL₀; regular GL₃ principal series | dim 1; coinvariants 3!=6, Whittaker 1 | holds | none |
| r1: 3.11 real r=1 character | basis (v,w,e₀,v*) | b(u)=(x,−y); a,b,z killed | holds | none |
| r1: 4.1 period covariance | ν(h)=i | ×i; weighted by ν ×(−i) | holds | none |
| r1: 4.2 factorization scalars | ℓ_v=2, ℓ_w=3; reference vector ×a | P ×6; ℓ_v/a and P(f⁰)·a | holds | none |
| r1: 4.3 dim R | ranks (2,1); b=0 | 2ab=4; 0 and L=1 | holds | none |
| r1: 4.4 character translation | line ⟨2⟩→⟨1⟩; ν(h)=i | ψ_{B_h}=−i on both sides | holds | none |
| r1: 5.1 Δ_{n+1} | n=1; split place | L(1,η)L(2,1); ∏ζ_v(i) finite | holds | none |
| r1: 5.1a rescaling | dt→2dt | raw ×2, λ fixed | holds | none |
| r1: 5.2 normalized form | U(1) mass a | α(1,1)=a/C_v=q(1); q(cx)=q(x) | holds | none |
| r1: 5.3 split ℚ₂, n=1 | π_V=Ind(1⊠ω), ω(2)=−1, π_W=1 | L(1/2)=2; Δ₂=8/3; L(1,Ad)=32/9; C=3; raw=3; α=1=vol(K_W) | holds | none |
| r1: 5.3 unramified E/ℚ₂, n=1 | W=⟨1⟩, V=⟨1,1⟩, σ_W=1 | Δ₂=8/9; C=1; raw=1=α | holds | none |
| r1: 5.3 non-example | ℚ₂ split, St, conductor-4 character | no fixed vectors | holds | none |
| r1: 5.4/5.5 | B_v→2B_v; Haar 2,1/2; q_v=0; good place volume 2 | q_v fixed; ×1; 0; ×2 | holds | none |
| r1: 6.1 Asai signs | n=1 | As⁺ on Π₁, As⁻ on Π₂ (bpcz line 4137, reopened this round) | holds | none |
| r1: 6.2 relative character | one-dimensional; basis vector ce | σ(f)|P(e)|²/⟨e,e⟩; ×|c|² both | holds | none |
| r1: 6.2 local spherical projector | f_v=1_{K_G}/vol(K_G) | J=C_vα_v(x,x) | holds | none |
| r1: 6.3 sign group order | #I+#J=2,3,0 | 4, 8, 1 | holds | none |
| r1: 6.4/6.5 | three constituents; counts (2,1) | I_Π/8; 1/8; ∏κ_v=1 | holds | none |
| r1: 7.1/7.2 ranges | n=1; n>1 | bpcz 1.1.5.1 n≥1; bplzz 1.8 n>1 | holds | none |
| r1: 7.3/7.4 | counts (1,1),(2,1); central value 0 | 1/4, 1/8; every period 0 | holds | none |
| r1: Headline statability | each headline of line 549–555 | no carrier at the pins | docstring correct | none |

**Ownership.** The diff introduces no new object; the previous review's ownership check (Bessel subgroup, local model, epsilon character, global period and `GGP.8` built nowhere else; TwistedAutomorphicDescents, PeriodsAndSpecialValues and SelmerIwasawaCohomologyPartII are later consumers) stands. Ownership against open pull requests was checked in the previous review with `roadmaps grep` over the 424 open heads; this round I reran only the targeted lookups above.

**Settled findings.** The board's repair reports mark one finding `not actionable in this package` (F04: successor scope and ownership of Part II). I do not re-raise it.

## Not verifiable

- xue-real (3.12) and (3.14), p. 1010: the epsilon-factor conjugation convention cannot be read from the cached extraction (symbol font lost); unchanged from the previous review and untouched by this diff.
- xue-bessel: waived in the manifest; cited by locator only.

## Source issues

- none
