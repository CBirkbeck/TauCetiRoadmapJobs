# Review of BianchiModularForms (pull request #1719 at 916795e)

**Verdict:** accepted

Every blocking finding of the previous review is repaired at this head (disposition table below). The worker's gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with the two expected `sorry` warnings, and the adversarial pass found no false statement. Four P3 notes remain; they are the author's to take or leave.

## R01 (P3) — Langlands locator names a page the IAS transcription does not have

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:1920`: "Langlands, §11, Lemma 11.6(b), p.205 of the IAS electronic transcription".

**Claim:** Lemma 11.6 sits on page 205 of the IAS transcription.

**Witness:** `langlands1980 line 5337` (the 153-page IAS copy) is Lemma 11.6; its page carries the printed header "142 11. THE COMPARISON" (`langlands1980 line 5323`). The other IAS copy places it on its printed page 142 as well.

**Repair:** Write "Lemma 11.6(b), p.142 of the IAS transcription" (or give the Annals of Mathematics Studies pagination and say so). Tested: the transcription's page 142 begins the passage containing Lemma 11.6(a)–(b) and Lemma 11.7.

## R02 (P3) — The fundamental-domain locators are whole-paper ranges

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:412` and `:2273`: "(Swan, geometric construction, pp.1–77)" and "(Swan, pp.1–77, geometric fundamental-domain construction)".

**Claim:** The finite-sidedness bound `B_K`, the fundamental-region property of the folded region, and the face lists for `d = 19, 43, 67, 163` are located in Swan.

**Witness:** A range of 77 pages is the whole paper, not a claim-level locator; Swan is paywalled (the service returns uncertified), and Cremona–Whitley 1994 (`cremonawhitley1994`, readable, publisher-open) contains no hemisphere list: it only names the four fields (`cremonawhitley1994 line 31`) and refers to Whitley's thesis.

**Repair:** Cite Swan by section and theorem for the finiteness bound and for the domain construction, marked uncertified, and cite the face lists to the text that tabulates them (Swan's tables or Whitley's thesis), or state them as computed Checks. The lists themselves are correct: a direct computation of the Ford floor (below) gives face-carrying `|c|²` exactly `{1, 4}` for `d = 19` (with `|c|² = 5` tangent only), `{1, 4, 9}` for `d = 43` with `|c|² = 16` tangent only, `{1, 4, 9, 16, 23}` for `d = 67`, and `{1, 4, 9, 16, 25, 36, …}` for `d = 163`.

## R03 (P3) — Casselman is cited through a secondary copy of a GDZ scan

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:2473`: "W. Casselman, On some results of Atkin and Lehner, Math. Ann. 201 (1973)".

**Claim:** Theorem 1, p.302 and the Corollary to the Proof, p.306 supply the newvector dimension formula.

**Witness:** The statements are as cited (`casselman1973 line 68` Theorem 1 on printed p.302; `casselman1973 line 261` the Corollary on p.306: dimension `i + 1` at level `c(π)·𝔭^i`). The service resolves the DOI only to a paywalled page; the readable copy is the Göttingen digitisation re-hosted on a third party's page.

**Repair:** Add the GDZ (Göttingen) open-archive locator for Math. Ann. 201 so the citation points at the open digitisation itself; no change to the mathematics.

## R04 (P3) — Two style slips

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:592`–`593`: "…or total component space. use k for the cohomological parameter…"; `README.md:1315`–`1320`: the `*Needs:*` line of §5.1 precedes its API bullets and Checks.

**Claim:** House shape: prose sentences, and each target ends with its `*Needs:*` line.

**Witness:** Lowercase sentence start at line 593; §5.1 is the only target whose `*Needs:*` line is not last.

**Repair:** Capitalise "Use", and move §5.1's `*Needs:*` line after its Checks.

## Verified sound

I read the whole README (2495 lines, 64 targets in ten layers), the unchanged `Suggested.lean` (169 lines, 10 declarations), the previous review and the 549-line change set; I resolved every supplier citation on main or at the open head, opened the cited library declarations at the pins, read the nine readable sources at their locators, computed every row of the table below myself, and ran the gate commands named in the brief. Nothing in the pull request lies outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty); the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

### Disposition of the previous review

| Previous finding | Passage at this head | Disposition and test |
|---|---|---|
| R01 unfolded Ford region | §0.3, "translation Ford region F̃_K … folded Ford region F_K", Checks at 429–433 | Repaired. Effective stabiliser of ∞ in PSL₂(𝓞_K) acts by `x ↦ u²x + ub`: `u² ∈ {±1}` for ℚ(i) (order 2 = w_K/2), `u² ∈ μ₃` for ℚ(ω) (order 3), trivial for w_K = 2. Gaussian witness `(±1/4, 2)`: every hemisphere value `≥ |c|²·4 ≥ 4`, identified by `diag(i,−i)`; `vol(F̃) = 2·Catalan/3 = 0.6106`, `vol(F) = Catalan/3 = 0.3053`. §§9.4–9.5 now integrate the folded region. |
| R02 form sum indexed by image lattices | §4.2, superpairs `P⁺ = 𝔭⁻¹P′`, cosets `Γ_c δ` | Repaired. For `P_b = (𝓞², 𝓞e₁⊕πᵉe₂)` at `π = 2+i`: `L⁺ = 𝓞e₁ + 𝓞π⁻¹(e₂ − be₁)`, `M⁺ = 𝓞e₁ + π^{e−1}𝓞e₂`, quotient `𝓞/πᵉ`, and `δ = (1,b;0,π)` sends `e₁ ↦ e₁`, `π⁻¹(e₂−be₁) ↦ e₂`, `π^{e−1}e₂ ↦ (bπ^{e−1}, πᵉ) ∈ M_c`: the q cosets of U. The sixth superpair `π⁻¹e₁𝓞 ⊕ 𝓞e₂` gives `diag(π,1)`. Invariance: `γ ∈ Γ_b` permutes superpairs and `F|δγ = F|δ_{γ⁻¹P⁺}`. Off the level `M⁺ ∩ L_b = M_b` (locally `𝔭⁻¹L_b ∩ L_b = L_b` at 𝔭, `M_b` elsewhere) and `M⁺ = M_b + 𝔫L⁺` (both sides `L⁺` at 𝔭, `M_b` at 𝔮 ∣ 𝔫). Class shifts for `g` of order 3: subpair 1→g, superpair 1→g², scaling g²→g. |
| R03 abstract Hecke ring identified with its image | §4.3, "A_pr … modulo the kernel of this action … No injectivity is asserted" | Repaired. Gaussian unit level: `PSL₂(ℤ[i])^{ab} = (ℤ/2)²` so `H¹ = 0`, image and quotient are the zero ring; `[πI]` and `[I]` both act as 1 on weight-two forms. |
| R04 Mellin supplier | §6.2 and contracts, "MaassForms §2.1(v)" | Repaired. MaassForms at its open head, line 665, states the transform with `Re s > |Re ν|` (DLMF 10.43.19, `dlmf-bessel line 728–732`). Specialisation `ν = 0`, `t = λy`: `λ^{−s}2^{s−2}Γ(s/2)²`. |
| R05 ALS.4.12 as unconditional input | §5.8, degree-zero cusp homology and the characteristic polynomial of `T_𝔭` on `B` | Repaired. `B = im ∂ ⊂ ⊕H₀(∂X_Γ)` is Hecke-stable (ALS.4.1's triangle is equivariant); eigenvalues `N𝔭ζ₁ + ζ₂` with `|ζᵢ| = 1`; `q − 1 > 2√q` iff `q ≥ 7` (q = 5: 4 < 4.472; q = 7: 6 > 5.292; q = 9: 8 > 6). `Q(T)m ∈ ker ∂ = C`. ALS.4.2–4.3 exist at the open head (lines 3467, 3520) with NT16 Lemma 2.4 and Prop. 3.4 as cited. |
| R06 Steinitz supplier | §0.2 and contracts, ClassicalArithmeticCompletion §7.0(a)–(d) | Repaired. On main, `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:14239–14258`: parts (a)–(d) with Voight 9.3.6 p.138, 9.3.9–9.3.10 p.139 and Weibel I§3 Props 3.4–3.5 pp.17–18, exactly as the README quotes. Check `st(𝓞⊕I) = [I] ≠ 1 = st(I⊕I)` for `I = (2, 1+√−5)`. |
| R07 CM supplier | §8.4 and contracts, ImaginaryQuadraticClassNumber §§H1.4, H3.1, H3.6 | Repaired. On main, H1.4 (line 43: conductor sequence, `Pic(O_f) → Cl(O_K) → 1`), H3.1 (line 83ff: "Hilbert class polynomial, integer coefficients, degree equal to the ordinary Picard number, simple roots indexed by proper ideal classes, complex conjugation and changes of order"), H3.6 (line 142–146: the thirteen order discriminants). `h(−35) = 2` from `(1,1,9)`, `(3,1,3)`; both ambiguous; order of conductor 2 in ℤ[i] has discriminant −16 and Picard number 1. |
| R08 claim-level locators | §0.5 "p.282"; §§1.6, 5.2, 5.6, 6.1, 7.5 | Repaired except the two P3 locators above. `cremona1984 line 256` (Lemma 2.1.5) lies on printed p.282; §1.6 cites Şengün p.8 abelianisation (`sengun2014 line 292`) and p.10 cocycles (line 363); §5.2 cites Casselman Thm 1/Corollary and Cremona p.278 oldclasses (`cremona1984 line 134–137`); §6.1 cites BCGNT Thm E (`bcgnt2025 line 470–473`, p.10). |
| R09 API bullets | prose API bullets added in 40 targets | Repaired. Every definition now has API bullets and at least three Checks; the targets without bullets (1.4, 3.4, 4.4, 4.6, 5.4, 6.4, 6.7, 8.5, 8.6, 9.3–9.5) define nothing. |
| R10 phantom `self_exactDivisor` | §5.5, "the elementary identity 𝔫 = 𝔫·1 with 𝔫 + 1 = 1" | Repaired; the fact stays as a Check. |

No repair report marks any finding "not actionable in this package".

### Adversarial calculations

One row per sampled target, headline theorem and finding target; the values are mine.

| Statement | Instances and values on each side | Result |
|---|---|---|
| 0.3 folded region, multiplicity | ℚ(i): `(1/4,2)`, `(−1/4,2)` both have every `|cx+d|²+|c|²y² ≥ 4 > 1`; `diag(i,−i)` sends `x ↦ −x`. Multiplicity `w_K/2 = 2`, `3`, `1` for `d = −4, −3, −7`. `vol(P) = Catalan/3 = 0.3053 = 8ζ_K(2)/(4π²)`; Eisenstein `√3L(2,χ₋₃)/8 = 3^{3/2}ζ(2)L/(4π²)`. Index law: `H = P`, `[G:H] = 2` gives `vol(G) = vol(P)/2`. | Sound; Humbert values agree with KleinianGroups Layer 4. |
| 0.3 unimodular pairs | For `h_K > 1` the hemisphere condition is quantified over primitive `(c,d)` only; a pair generating a nonprincipal ideal is no bottom row of `SL₂(𝓞_K)`. | Sound (singular cusps handled separately). |
| 0.4 cusp `1/π` at level `π²`, `π = 2+i` | `σ(a,b;0,d)σ⁻¹` with `σ = (1,0;π,1)` has lower-left `π(a−d) − π²b`; membership forces `a ≡ d mod π`; residues of `1, i, −1, −i` in 𝔽₅ are `1, 3, 4, 2`, so `a = d`: rotation group of order 1, versus order 4 at ∞. | Sound. |
| 0.5 cusp counts | `Γ₀((2+i)²)`: divisors `1, π, π²` with `𝔤 = 𝓞, (π), 𝓞`; units onto 𝔽₅ˣ gives `1+1+1 = 3`; squares `{±1}` give `1+2+1 = 4`. `Γ₀((1+i)²)`: `𝔽₂ˣ` trivial, `3` for both. Indices `25·6/5 = 30`, `121·122/121 = 122`. | Sound. |
| 1.2 boundary dimension (headline 1) | `tr² = 4det` ⟺ `(a−d)² = 0` for `(a,b;0,d)`. `diag(−1,1) ∈ Γ₀(𝔫,𝔞)` for every `K`, `tr² = 0 ≠ −4`: cusps ∞ and 0 never count. Rotation `u ≠ 1` on `Λ ⊗ ℂ = ℂ ⊕ ℂ̄` has no invariants, so `H¹(Γ_c,ℂ) = 0`; translation cusp gives `ℂ²` with Lagrangian image (invariants of a Lagrangian under a finite symplectic group are Lagrangian in the invariants: `dim L^G = dim (L^*)^G`). | Sound; Lean statement matches (counts translation-only cusp orbits, condition conjugation-invariant). |
| 1.4 finite dimensionality | `Hom(Γ,ℂ)` for finitely generated Γ: `Γ_ab = ℤʳ ⊕ torsion`, dimension `r`; `Γ = (ℚ,+)` gives `Hom(Γ,ℤ) = 0` but `Hom(Γ,ℚ) = ℚ` (non-arithmetic control). | Sound. |
| 1.3 weights | `dim E_k = (k−1)² = 1, 4, 9`; minimal type `Sym^{2k−2}` of dimension `3, 5, 7`; `m = 2k−2 = 2, 4, 6`. | Sound. |
| 1.5 central normalisation | Scalar `β` acts on `E_k` by `N(β)^{k−2}`; `N𝔟^{2−k}` cancels it; `k = 2` trivial. | Sound. |
| 2.1 slash matrix | Inversion at `x = y = 1`: `r = s = 1`, `A = ½(1,1,1; −2,0,2; 1,−1,1)`; `A^T diag(2,1,2) A = diag(2,1,2)` (column norms 2, 1, 2, all cross terms 0). `M`'s middle column `(1,0,−1)` has norm 4. | Sound; the pinned `A` is the isometry, not the knowl's `M` (source issue below). |
| 2.4 Fourier–Bessel phases | `e_α = exp(2π(αx − ᾱx̄)/√|d|)`, `∂_x e_α = μe_α`, `μ = 2πα/√|d|`, `λ = 2|μ|`. Closedness: `∂_y(yK₁(λy)) = −λyK₀`, so `dx∧dy` needs `p = μ/λ = α/(2|α|)`, `dx̄∧dy` needs `q = ᾱ/(2|α|)`, `dx∧dx̄` gives `−pμ̄ + qμ = 0`. ℚ(i), `α = 1`: `λ = 2π`, phases `½, ½`; `α = i`: `i/2, −i/2`. Constant phases `∓i/2` satisfy the first equation only on the ray `arg α = −π/2`. | Sound; Şengün's vector is wrong in general (source issue). |
| 2.5 transport | `𝔞 ↦ x𝔞`: `F′₂(z,y) = F₂(xz,|x|y)`, so `c_{x𝔞}(xα) = |x|²c_𝔞(α)`, `N(x𝔞) = |x|²N𝔞`; `1/1 = 4/4`. | Sound. |
| 2.7 `SL₂`-level | `Γ₀(𝔫) = Γ₀ˢᴸ(𝔫)·{diag(u,1)}`; `diag(u²,1) = u·diag(u,u⁻¹)` acts trivially; quotient of order 2 for every `K`. | Sound. |
| 3.1 adelisation | `det K₀(𝔫) = Ô_Kˣ` so components `Kˣ\𝔸_fˣ/Ôˣ = Cl(K)`; stabiliser of the `g_c`-component is the stabiliser of a pair of class `c` (ALS.0.7 line 1433). Class group of order 3: `S_𝔭` sends `c ↦ c+2`. | Sound. |
| 3.5 relative module | LES `H₁(∂) → H₁(X) → H₁(X,∂) → H₀(∂)`: `ker ∂ = im(H₁(X)) ≅ H₁(X)/im H₁(∂) = C_Γ`; `dim H₁(X) = 1`, image 1 gives `dim C = 0`. | Sound. |
| 4.1 correspondences | `ℙ¹(𝔽₂)` has 3 lines; one forbidden on the level; `T_𝔭²` and `S_𝔭` both shift class by `g²` for `g` of order 3. | Sound. |
| 4.2 operators on forms (R02 target) | See disposition row; additionally `(T_πF)₂` at class number one: `Σ_b F|(1,b;0,π)` contributes `c(πβ)·N(π)/|π|² = c(πβ)` (character sum `Σ_b e_α(b/π) = N(π)` iff `π ∣ α`), `F|diag(π,1)` contributes `N(π)c(β/π)`. | Sound: reproduces 4.4's recurrence. |
| 4.3 double-coset ring | Degrees `5+1 = 6` off level, `5` on level; `diag(π,1)` has upper-left `π ≡ 0`. `IsHeckeTriple` is the pinned commensurability condition (`Mathlib/NumberTheory/HeckeRing/Defs.lean:75`); `Δ₀(𝔫,𝔞)` is a monoid commensurating `Γ₀`. | Sound. |
| 4.4 recurrence | Eigenvalue 1 at norm 5: `c(𝔭²) = 1 − 5 = −4`; bad eigenvalue −1: `−1, 1, −1`; `c(𝔭⁻¹𝓞) = 0`. | Sound. |
| 4.5 eigenvalues, 121.1-a | `11a1 : y² + y = x³ − x² − 10x − 20`: counts give `a₃ = −1, a₅ = 1, a₇ = −2, a₁₃ = 4` (computed), hence `a_{(3)} = 1 − 6 = −5`, `a_{(7)} = 4 − 14 = −10`, `a_{(2±i)} = 1`, `a_{(3±2i)} = 4`. | Sound. |
| 4.5 eigenvalues, 100.2-a | `20a1 : y² = x³ + x² + 4x + 4`: `a₃ = −2, a₇ = 2, a₁₁ = 0, a₁₃ = 2, a₁₉ = −4` (computed), hence `−2, −10, −22, 2, −22` as displayed. | Sound. |
| 4.6 Ramanujan, 4.7 field | `|−5| ≤ 6`, `|−10| ≤ 14`; roots of `X² − aX + q` with `|a| ≤ 2√q` have modulus `√q` (discriminant `≤ 0`). | Sound. |
| 5.2 old/new dimension | Casselman: dimension `i+1` at level `c·𝔭^i`, so `max(0, r−c+1)` per place and `#{𝔢 ∣ 𝔫𝔪⁻¹} = ∏(r_𝔭 − c_𝔭 + 1)`; trivial or unramified central character makes `K₀`- and `K₁`-invariants agree. Level `(11)(1+i)`: `2·1 = 2`. | Sound. |
| 5.3 bad eigenvalues | Conductor exponent 1 with unramified central character forces `St ⊗ μ`, `μ` unramified: `a_𝔭 = μ(ϖ) = ±1`; exponent `≥ 2`: `0`. | Sound. |
| 5.5 Atkin–Lehner on pairs | Locally at `𝔭 ∣ 𝔮` (exponent e): `(L,M) = (𝓞², 𝓞e₁⊕𝔭ᵉe₂) ↦ (𝓞e₁⊕𝔭ᵉe₂, 𝔭ᵉ𝓞²)`, quotient `𝓞/𝔭ᵉ`; at `𝔭′ ∣ 𝔫′` the pair is unchanged; `W_𝔮² = (𝔮L, 𝔮M)`. Fricke `M/𝔫L ≅ 𝓞/𝔫`. Nonprincipal `𝔮` moves class by `[𝔮]²`. | Sound. |
| 5.6 sign | `a_p = μ(p)` from `L(s,f) = L(s−½, St⊗μ)`; A–L eigenvalue `−μ(p)`; 11a1: `a₁₁ = 1`, `w₁₁ = −1`; inert in ℚ(i): `a_{(11)} = 1`, `w_{(11)} = −(−w₁₁)² = −1`; `ε = −w = +1`. 100.2-a: `(−1)(+1)(+1) = −1`, `ε = +1`. | Sound. |
| 5.8 rational pairing (R05 target) | See disposition row; `B = 3·swap`: `B² − 9I = 0`, `B − 3I` has eigenvalue `−6`; at `a = 0` value `−9`; `B = 0` gives `Q = 1`. | Sound. |
| 6.1 bound and convergence | `|c(𝔭ʳ)| ≤ (r+1)q^{r/2}` (r+1 terms of modulus `q^{r/2}`); `|c(𝔪)| ≤ d(𝔪)N𝔪^{1/2}`; `Σ d(𝔪)N𝔪^{½−σ} = ζ_K(σ−½)²` converges iff `σ > 3/2` (`summable_absNorm_rpow_ideal_iff` at `t = σ − ½ > 1`). Repeated root `a = 2√q`: `1, 2√q, 3q`. 121.1-a: `a₃ = 0`, `a₅ = 2`, `a₉ = −5`. | Sound. |
| 6.2 Mellin | `∫y²K₀(λy)y^{2s−3}dy = 2^{2s−2}λ^{−2s}Γ(s)²`, `λ^{−2s} = (4π)^{−2s}|d|^sN(α)^{−s}`, sum over `α` counts each ideal `w_K` times: `(w_K/4)Γ(s)²(√|d|/2π)^{2s}L(F,s)`. Then `Λ = (d²N𝔫)^{s/2}(16/w_K)|d|^{−s}I(s)`. `μ = 2, λ = 1`: `∫sech² = 1 = 2⁰Γ(1)²`; `λ = 2`: `1/4`. | Sound. |
| 6.3 functional equation | `y = 1/(|N|u)` gives `I(s) = −w|N|^{2−2s}I(2−s)`; `(d²N𝔫)^{s/2}|d|^{−s} = |N|^s`; so `Λ(2−s) = −wΛ(s)`. Conductor `16·121 = 1936 = 11·176`. | Sound. |
| 6.4 base-change sign | `ε(F) = (−w_f)(−w_{f⊗χ}) = (−1)(−1) = +1` for 11a1 and 176b2; factor `i² = −1` in `frickeCompletedL_sub_eq`. | Sound. |
| 6.5 analytic rank | Zero germ has order `⊤`, `toNat = 0`; continuation required. | Sound. |
| 6.6 period | `s = 1`: `L(F,1) = 16π²I(1)/(w_K|d|)`, weights `N𝔞^0 = 1`; generators `±(1,1)` give `|±2| = 2`. | Sound. |
| 7.3 base change | Inert `a_𝔭 = α²+β² = a_p² − 2χ(p)p`; 11a1: `−5, −10`; 20a1: `−2, −22`; Eisenstein for `f = 32a` over ℚ(i). | Sound. |
| 7.5 coefficient field | Inner twist `f ⊗ χ_K = f^σ`: `σ(a_p) = χ_K(p)a_p`, eigenspaces `ℚ(F)` and `√δ·ℚ(F)`; `[H:H₀] ≤ 2`. 16384.1-d: `a₃² = 2 ↦ −4`, `a₇² = 8 ↦ −6`, `a₅ = 2` rational. | Sound. |
| 7.7 CM field | Admissibility: `σ₁(ε)conj(σ₂(ε))` and `σ₁(ε)σ₂(ε) = ι(N_{L/K}ε)` roots of unity, so `σ₁(ε)/conj(σ₁(ε))` is one; `ℚ(η)` for `η = ε^m` is real quadratic (not `L`, which is totally complex; not in `K`, whose units are finite): `L = KL⁺` biquadratic. `K(√(1+2i))`: `(1−2i)/(1+2i)` not a square. | Sound. |
| 8.1, 8.6 curve to form | `a_𝔭 = N𝔭 + 1 − #Ẽ(𝔽_𝔭)`; Euler factor `1 + 5·9^{−s} + 9^{1−2s}` at `(3)`, `1 − 121^{−s}` at `(11)`; arithmetic weight 1 shifts by ½. | Sound. |
| 8.3 conjugate CM curves | Over 𝔽₁₃ with `i = 5`: `y² = x³ + 7` has 7 points, `y² = x³ + 10` has 9 (computed); traces 7 and 5, not `±7`. | Sound. |
| 8.4 CM curves | `h(−35) = 2`, both classes ambiguous; `−3, −4` give `j = 0, 1728`; conductor-2 order in ℤ[i] has `D = −16`, `h = 1`. | Sound. |
| 9.1 relations | `m + am = 0`, `m − lm = 0`; `2m` would have boundary `2([∞]−[0]) ≠ 0` at prime level. | Sound. |
| 9.3 vanishing list (headline 2) | Vogtmann's `d ∈ {1,2,3,5,6,7,11,15,19,23,31,39,47,71}` (`vogtmann1985 line 29`) maps to discriminants `−4,−8,−3,−20,−24,−7,−11,−15,−19,−23,−31,−39,−47,−71`, the Lean list; `−20` in with `h = 2`, `−43` out. `SL₂` vs `PSL₂`: finite central `{±1}`. Boundary kernel over every cusp stabiliser equals the Borel–Serre kernel (orbifold cohomology with ℂ-coefficients). | Sound. |
| 9.4 Euclidean floors | Covering radii² `1/2, 3/4, 1/3, 4/7, 9/11` give heights² `1/2, 1/4, 2/3, 3/7, 2/11`. ℚ(√−11): `x = ½ + 5i/(2√11)` is at distance² `9/11` from `0, 1, ω`; `c = 2`, `d = −1−ω` gives `|2x+d|² = 1/4 + 1/44 = 3/11 = 1 − 4·(2/11)`: tangent at the vertex. | Sound. |
| 9.4 non-Euclidean floors | Direct maximisation of `(1 − |cx+d|²)/|c|²` over primitive `(c,d)` on grids of 240², 200², 160², 50² points: winning `|c|²` with positive margin are `{1,4}` (d=19; `5` has margin 0), `{1,4,9}` (d=43; `13`, `16` margin 0), `{1,4,9,16,23}` (d=67; `17`, `19` margin 0), `{1,4,9,16,25,36,47,49}` (d=163). | Sound; matches §9.4 and the worked-example bullet. |
| 9.5 covolumes | `60·Catalan/3 = 20·Catalan`; `168·√3L/8 = 21√3L`. | Sound. |

Definitions of `Suggested.lean`:

| Declaration | Values | Result |
|---|---|---|
| `Gamma0Component` | Stabiliser computation: `γ(x,y) = (ax+by, cx+dy)` on `𝓞⊕𝔞` and `𝓞⊕𝔞𝔫` forces `a,d ∈ 𝓞`, `b ∈ 𝔞⁻¹`, `c ∈ 𝔞𝔫`; `γL = L` iff `det ∈ 𝓞ˣ`. `𝔞 = 𝓞`: `b ∈ 𝓞`, `c ∈ 𝔫`. `𝔞 = (2)`: `(1,½;0,1)` sends `2e₂ ↦ e₁+2e₂`. `𝔞 = ⊥`: `𝔞⁻¹ = 0` (Mathlib junk), excluded by `h𝔞`. | Correct carrier. |
| `cusps`, `cuspidalHom`, `cuspidalH1` | Trivial Γ: singleton orbits; `GL₂(K)`: one orbit. Zero map is cuspidal; `h((1,q;0,1)) = q` on rational translations fails at ∞. Comap along the native `H1IsoOfIsTrivial`. | Correct; the four "dropped" `[NumberField K]` binders are not needed by these definitions. |
| `sl2Image` | `(1,1;0,1)` has determinant 1 and belongs; `diag(i,1)` does not. | Correct. |
| `finrank_H1_sub_cuspidal` | Binders retained: `Field`, `NumberField`, `IsTotallyComplex`, `finrank ℚ K = 2`, `𝔫 ≠ ⊥`, `𝔞 ≠ ⊥`. Natural subtraction is safe: `cuspidalH1 ≤ H1` and `H1` is finite-dimensional. Gaussian unit level: `0 − 0 = 0`. | Matches README §1.2. |
| `cuspidalH1_sl2Image_eq_bot_iff` | Binders retained; no class-number hypothesis; both directions tested at `−20` and `−43`. | Matches README §9.3. |

### Seeded source audit

| Sample | Located text |
|---|---|
| 0.3 | Cremona §2.2, `cremona1984 line 304–307` (printed p.283): `|P : PΓ| = 2` since `|𝓞ˣ : (𝓞ˣ)²| = 2`. Swan: unreadable (R02). |
| 1.4 | Şengün §3.1, `sengun2014 line 292` (p.8: `H₁(Γ,ℤ) ≅ Γ^{ab}`) and line 363 (p.10: cocycles determined by values on generators). |
| 2.7 | Knowl unreadable (see Not verifiable); the statement is the elementary unit-quotient computation above. |
| 3.1 | AutomorphicFormsOnReductiveGroups §7.2 at its open head (line 1134, adelisation and inverse); ModularityAndLanglandsExtensions §4.27 (line 2852, BCGNT §1.3 pp.9–11 normalisation, `bcgnt2025 line 437–467`). |
| 4.1 | Pinned conventions; Şengün §4, `sengun2014 line 396–417` (p.11, correspondence definition). |
| 4.3 | Şengün §4, `sengun2014 line 423–427` (p.11–12): the algebra is the subalgebra of endomorphisms generated by `T_π, S_π` for principal `π` prime to the level, as the README says. |
| 4.4, 4.5 | BCGNT §1.3, `bcgnt2025 line 437–473`; coefficients recomputed from point counts above. |
| 4.7 | Şengün §4, `sengun2014 line 436–439` (p.12): eigenvalues in a number field, integral after normalisation. |
| 5.5 | Pinned pair formula, verified locally above; Cremona §1 pp.276–279 for the Euclidean setting (`cremona1984 line 89–155`). |
| 5.6 | Casselman p.305–306 (`casselman1973 line 201–260`: principal series and special representations with conductor `𝔭` for unramified `μ`); GL2 roadmap R16.2.1 (line 681) and R16.3.2 (line 892) at the open head cite the same pages. |
| 6.4 | Tau Ceti `frickeCompletedL_sub_eq` (`TauCeti/NumberTheory/ModularForms/LFunction/Sign.lean`), factor `i^k`; GL2 R17.4.3 (line 1824) all-place base change. |
| 8.1 | EllipticCurveModularityImaginaryQuadratic endpoint at the open head (line 2309): every `E/K`, cuspidal for non-CM, all finite local factors. |
| 8.6 | LFunctions Layer 0 on main (`TauCetiRoadmap/LFunctions/README.md:346–399`, `EqOffZero`, `ArithmeticLFunctionData`). |
| 9.4 | Computed (table above); Swan and Bianchi unreadable; Cremona–Whitley (`cremonawhitley1994`, now cached from the AMS open archive) has no hemisphere list. |

Other locators checked: Vogtmann (2.2) on p.400 (`vogtmann1985 line 78–79`); Cremona Theorem 2 on p.284 (`cremona1984 line 327–328`); Newton–Thorne Lemma 2.4 on arXiv v1 p.9 (`newtonthorne2015 line 396`) and Proposition 3.4 on p.29 (line 1270); Şengün §5 pp.13–14 (`sengun2014 line 494–553`); Şengün §2.3 p.6 (line 172); Şengün §3 pp.7–8 (lines 231–285: Borel–Serre, restriction kernel, `V_k` self-dual when `k!` invertible, unequal-weight vanishing).

### Ownership, suppliers and direction

Every cross-roadmap citation was resolved at the cited roadmap's current text.

| Supplier | Where resolved |
|---|---|
| ClassicalArithmeticCompletion §7.0(a)–(d) | main, README:14239–14262 |
| ImaginaryQuadraticClassNumber §§H1.4, H3.1, H3.6 | main, README:43, 83, 142–146 |
| ClassFieldTheory Layers 11–12 (`globalClassField_index`, `rayClassArtinMap_idealClass`, `globalArtinMap_isArithFrobAt`) | main, README:582, 593, 1711, 1748 (roadmap targets, not pinned declarations, as the README says) |
| GlobalNumberFields Layers 2, 9 | main, `Completed/GlobalNumberFields/README.md:279, 508` |
| NumberFieldArithmetic Layer 1, EllipticCurves Layers 0.5/1/3/4, ModularForms Layers 4–9 and 8G, LFunctions Layers 0, 6 | main, headings at lines 487; 398/423/683/793; 532–971; 346/1100 |
| MaassForms §2.1(v) | open head (rev 1717), line 665 |
| KleinianGroups Layers 0–4 | open pull request #432 (another author, new folder): index law `covolume_eq_card_mul_covolume` (line 265), reduction surjectivity and indices (Layer 3), the two covolumes (Layer 4) |
| ArithmeticLocallySymmetricSpaces ALS.0.6–0.7, 1.5, 2.4, 3.5, 3.6, 3.8, 3.14, 4.1–4.3, 5b.5, F.6, F.7 | open head, lines 1391, 1433, 1982, 2332, 2932, 2980, 3060, 3369, 3439, 3467, 3520, 4452, 987, 1058 |
| AutomorphicLFunctionsAndLocalFactors AL.2.2.1–2.2.5 | open head, lines 1642–1719 (dimension `max(0, n−c(π)+1)`, Casselman Thm 1 p.302 and Corollary p.306) |
| GL2AutomorphicRepresentationsAndTransfer R16.2.1, R16.3.2, R16.4, R16.6.1, R17.4.1–R17.4.6 | open head, lines 681, 892, 1030–1062, 1233, 1755–1856 |
| ModularityAndLanglandsExtensions §§4.26, 4.27, 4.40, 4.41, 4.43 | open head, lines 2827, 2852, 3054, 3064, 3145 |
| AutomorphicFormsOnReductiveGroups §§4.5, 7.2–7.3 | open head, lines 690, 1134, 1173 |
| EllipticCurveModularityImaginaryQuadratic endpoint | open head, line 2309 |

The merge order lists this roadmap after ModularityAndLanglandsExtensions (line 179 of the candidate order) and after every supplier it lists; MaassForms and KleinianGroups are not in the order yet (both design-stage), so their placement is the intake's: MaassForms must precede BianchiModularForms when both are inserted. No roadmap on main or at an open head builds the Bianchi carriers (searched by object: Bianchi cusp forms, `Γ₀(𝔫,𝔞)`, cuspidal `H¹` of Bianchi groups, Bianchi Hecke module, Bianchi newforms); MaassForms Layer 7 owns weight-zero Maass forms for `PSL₂(ℤ[i])` only, HilbertModularForms the real-quadratic side. Ownership against open pull requests whose files the brief does not give was not checked.

The dependency check on this head:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Pinned-library audit

| Declaration | At the pin |
|---|---|
| `TauCeti.summable_absNorm_rpow_ideal_iff` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Convergence.lean:82`: over `(Ideal (𝓞 K))⁰`, `Σ N(I)^{−s}` summable iff `1 < s` (real `s`). |
| `TauCeti.normCoeff`, `normCoeff_eq_sum_normFiber` | `…/NormCoeff.lean:101, 126`: ℂ-linear regrouping of an `IdealArithmeticFunction` by absolute norm, value at `n` the finite sum over the norm fibre. |
| `TauCeti.regroupByNorm`, `LSeriesSummable_normCoeff`, `LSeries_normCoeff` | `…/Regroup.lean:191, 198, 204`: `HasSum` of the ideal-indexed series gives `LSeriesHasSum` of the regrouped series; absolute convergence transfers; the values agree. Exactly what §6.1 uses. |
| `HeckeRing`, `IsHeckeTriple` | `Mathlib/NumberTheory/HeckeRing/Defs.lean:75, 189`. |
| `groupCohomology.H1IsoOfIsTrivial`, `Rep.trivial` | used by `homEquiv` with a real body (elaborated). |
| `HeckeRing.GL2.Newform`, `analyticRank`, `frickeCompletedL_sub_eq`, `frobeniusTrace`, `isFiniteOrder_iff_exists_rayClassCharacter`, `ker_rayClassQuotient`, `classField` | `Newform.lean:104`, `AnalyticInvariants.lean:80`, `LFunction/Sign.lean`, `EllipticCurve/HasseBound.lean`, `HeckeCharacter/FiniteOrder.lean:80`, `Ideles/Ray/ClassQuotient.lean`, `ClassFieldTheory/ClassField.lean:70`. |

### Lean acceptance test and gate

`lake env lean TauCetiRoadmap/BianchiModularForms/Suggested.lean` from the worktree: exit 0, warnings only at lines 140 and 160 (`declaration uses sorry`). A scratch copy with `#check @name` for all ten declarations elaborated; the elaborated types are recorded above and agree with the README's statements. One-tactic probes on scratch copies (`simp`, `rfl`, `infer_instance` in place of each `sorry`) fail on both theorems: neither is padding. The file has one `import Mathlib`, no `set_option`, no sorry'd data, no admitted `example`; every backticked own name in the README is declared. Headline inventory: the boundary-dimension theorem and Vogtmann's classification are stated; Eichler–Shimura–Harder, the Fourier and Mellin comparisons, newforms and multiplicity one, the functional equation, the period theorem, base change, CM, the elliptic-curve comparison and the cellular presentation are named in the module docstring with the missing carrier each lacks; none is statable at the pins (no Bianchi form, Bianchi newform, `K`-Bessel, adelic or Borel–Serre carrier exists in Mathlib or Tau Ceti at the pins).

The worker's gate at this head:

```text
gate BianchiModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

## Not verifiable

- **Swan 1971** (Adv. Math. 6) and **Bianchi 1892** (Math. Ann. 40): the service resolves both DOIs to paywalled pages; the finiteness bound, the domain construction and the face tables were not read. The face lists were verified by computation instead (table above).
- **Harder 1987**, §§3.1–3.2, §3.6.2.2 p.74: paywalled (Invent. Math.); consumed through ModularityAndLanglandsExtensions §4.26, which carries the same locators.
- **Weil 1971** (LNM 189) and **Weil 1955** (Tokyo–Nikko): no legal copy found by the service; the Mellin-transform shape and the admissibility condition were checked by the computations above instead.
- **Bygott 1998, Lingham 2005**: theses not located by the service; the class-group bookkeeping was checked directly.
- **Cremona–Whitley 1994**: now readable (`cremonawhitley1994`, AMS open archive) but it contains none of the §9.4 hemisphere data (R02).
- **LMFDB knowls and records** (`mf.bianchi.*`, `ec.*`, the six record pages): not re-fetched this round; the previous review found every knowl behind a challenge page. The record values were tested through the point counts and sign computations above, not against the database.
- **Casselman 1973**: read from a cached Göttingen digitisation re-hosted on a third-party page (R03); the service marks the DOI uncertified.

## Source issues

- **Misprint** in sengun2014 at §5, printed p.14 (`sengun2014 line 546`): the source says the additive character is the exponential of `2π(x + x̄)`; it should be `2πi` times a trace pairing of `x` against the dual lattice; affects a stated result.
- **Misprint** in sengun2014 at §5, printed p.14 (`sengun2014 line 552–553`): the source says the Bessel equation has numerator `dK_j` over `dy²` and potential `1 + j/y²`; it should be `K_j'' + K_j'/y − (1 + j²/y²)K_j = 0`; affects a stated result.
- **Error** in sengun2014 at §5, printed p.14 (`sengun2014 line 548–550`): the source says every Fourier mode has the same outer phases `∓i/2` times `K₁`; the closedness equations force phases `α/(2|α|)` and `ᾱ/(2|α|)` depending on the mode; affects a stated result.
- **Error** in sengun2014 at §5, printed pp.13–14 (`sengun2014 line 505–514, 520`): the source says the displayed symmetric-square matrix is the action on `F` in the coframe `(−dx/y, dy/y, dx̄/y)`; that matrix does not preserve the hyperbolic Gram form `diag(2,1,2)` (its middle column has norm 4 at the inversion), and the action on `F` in that coframe is its conjugate by `diag(2,1,2)`; affects a stated result.
- **Gap** in sengun2014 at §5, printed p.14 (`sengun2014 line 526–534`): the source says the cusp condition integrates `F|γ` over `ℂ/𝓞_K` for every `γ ∈ PSL₂(𝓞_K)` and expands over `α ∈ 𝓞_K`; for a proper congruence subgroup `F|γ` is periodic only under a sublattice and the integral and the index set must use the actual translation lattice and its dual; affects a stated definition.
