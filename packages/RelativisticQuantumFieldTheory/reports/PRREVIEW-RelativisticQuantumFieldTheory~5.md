# Review of RelativisticQuantumFieldTheory (pull request #1772 at e8ff198)

**Verdict:** needs changes

Incremental re-review of the 21 changed lines since 28bf856. All changes are in `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md`; `Suggested.lean` is byte-identical to 28bf856 and nothing outside the folder changes. The gate passes and `Suggested.lean` elaborates (14 `sorry` warnings only). Five of the seven previous findings are repaired in the README. The remaining five findings are all P3: three in the changed text and two board-manifest entries that the previous review flagged and that have not changed. Nothing is P1 or P2.

## R01 (P3) — The new §10.1 Check uses `U` for the operator the bosonic layer calls `P`

Location: `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md` line 5415 ("The parts are the `J`-commuting and `J`-anticommuting components `U=(S−JSJ)/2` and `β=(S+JSJ)/2`, with `JUJ=−U`…").
Claim: the complex-linear part of the bosonic symplectic map `S` is called `U`.
Witness: §10.2 fixes `P=(S−JSJ)/2` (line 5421) and its Check computes `P=cosh(t)I` (line 5437). The same layer uses `U` for the Fock implementer: "unitary U on Γ_s(h)" at line 5423 and `|⟨Ω,U_SΩ⟩|²` at line 5485.
Repair: write "`P=(S−JSJ)/2` and `β=(S+JSJ)/2`, with `JPJ=−P` and `JβJ=β`". On the Check's own instance `S=cosh(t)I+sinh(t)C`, `JCJ=C` gives `P=cosh(t)I` and `β=sinh(t)C`, which agrees with line 5437. Keep `U` for the fermionic §10.3, which pairs it with the implementer `W`.

## R02 (P3) — The cited equation (46) of Bru–Metraud is misprinted, and the README cites it without a note

Location: README.md line 5455 ("the four orthogonality relations are (45)–(46) of its Proposition 2.12").
Claim: (45)–(46) of Bru–Metraud v7, Proposition 2.12, are the four relations of a fermionic Bogoliubov transformation.
Witness: bm23 line 1009 prints the first relation of (46) as `uu*−vv*=1`; the LaTeX of the arXiv v7 HTML has the same minus sign. Unitarity of `[[u,v],[v̄,ū]]` (bm23 lines 1103–1107) gives `uu*+vv*=1`. The README uses this correct relation itself, as `UU*=1−VV*` (line 5471).
Repair: add the clause "(the first relation of (46) is printed `uu*−vv*=1`; unitarity of the block matrix gives `uu*+vv*=1`)". Test it on the one-mode particle–hole map of the line 5476 Check, `U=0` with `V` a conjugation: the printed form gives `−1=1`, and the corrected form gives `0+1=1`.

## R03 (P3) — The References entry gives Bru–Metraud v2 a title it never had

Location: README.md line 5602 ("(the earlier version v2 was titled *Fermionic Bogoliubov transformations*; the numbering is that of v7)").
Claim: version 2 of arXiv:2305.11697 was titled *Fermionic Bogoliubov transformations*.
Witness: the arXiv abstract pages of 2305.11697v1 and v2, and the v2 HTML heading, all give the title *Quadratic Hamiltonians in Fermionic Fock Spaces*. The v2 HTML's Theorem 2.8 is "Implementation of Bogoliubov transformations", so only its numbering differs from v7.
Repair: replace the parenthesis with "(the numbering is that of v7; in v2 of October 2023 the implementation theorem is Theorem 2.8)". The v2 HTML has a Theorem 2.8 with that heading, so this text holds.

## R04 (P3) — The manifest entry `bm23` still records the title and locator of the previous round

Location: board manifest `packages/RelativisticQuantumFieldTheory/sources.toml`, entry `bm23` (`title = "Fermionic Bogoliubov transformations"`, `locator = "Theorem 2.8"`, `version_note = "arXiv, latest version"`).
Claim: the manifest records the work and locator that the README cites.
Witness: the cached latest version (bm23 lines 5, 40) is *Quadratic Hamiltonians in Fermionic Fock Spaces*, v7 of 22 April 2026, and has no Theorem 2.8. The README now cites Theorem 3.2 (bm23 line 1891) and Proposition 2.12 (line 1004).
Repair: the worker sets `title = "Quadratic Hamiltonians in Fermionic Fock Spaces"`, `locator = "Theorem 3.2; Proposition 2.12 (44)–(46)"` and `version_note = "numbering of v7 (22 April 2026); Theorem 3.2 is Theorem 2.8 in v2"`. This is the manifest half of the previous R04.

## R05 (P3) — The manifest still certifies a bot-block page as the text of Osterwalder–Schrader II

Location: board manifest `packages/RelativisticQuantumFieldTheory/sources.toml`, entry `os75` (`status = "certified"`, `licence_class = "open-repository"`, sha256 `b6013daa…`). README.md §7.1, §7.2 and §7.5 cite OS II §II (2.1), §IV.1 (4.1) and (4.3), and §IV.
Claim: the OS II text was fetched, so its locators can be checked against it.
Witness: the cached file `os75` is five lines long. Its only content is "Request unsuccessful. Incapsula incident ID: …" (os75 line 5). No repair report marks this finding as not actionable.
Repair: the worker re-fetches the article through the sources service (it is open on Project Euclid; the block is bot protection), or records the entry as `uncertified` with its DOI. The README's OS II locators stay as they are.

## Previous findings

- R01 — repaired: line 1144: "`A=[[0,1],[−1,0]]` is metric-Hermitian, since `ηA=[[0,1],[1,0]]` is Hermitian, but `A*=−A` is not Hilbert-Hermitian; conversely `B=[[0,1],[1,0]]` … is metric-anti-Hermitian."
- R02 — repaired: line 3153: "meromorphic with exactly two simple poles, at `z=1` and `z=0`, because `Γ(z−1)/Γ(1+z)=1/(z(z−1))`; at `z=−1` its value is … `π²m⁴κ^(−2)/2`."
- R03 — repaired: line 755: "Mathlib `Matrix.single` (the matrix units) and `Matrix.single_mul_single_same`." Both are at Basis.lean lines 34 and 331 at both Mathlib pins.
- R04 — partly repaired: lines 5455, 5481 and 5602 cite "Bru–Metraud, arXiv:2305.11697v7, Theorem 3.2 … (45)–(46) of its Proposition 2.12". The `bm23` manifest entry still says Theorem 2.8 (now R04). The repair also introduced R02 and R03.
- R05 — repaired: lines 759 and 766 read "Borcherds–Barnard §9.5, p. 74".
- R06 — not repaired: the manifest `os75` is still `status = "certified"` on the five-line Incapsula page (now R05).
- R07 — repaired: §4.2 (line 989), §9.13 (5236), §9.15 (5296), §10.1 (5415) and §11.1 (5502) now have three Checks each. The §10.1 Check introduced R01.

## Verified sound

**Gate, build, dependency check, pins.** My rerun of the gate on e8ff198 exits 0: every check OK, with `outside-folder=0`, `stray-files=0`, `statement-hygiene=0` and `depcheck=0`. The rerun prints no build field. The worker's gate at this head reports `build=0`, and the `lake env lean` run below covers elaboration.
- `lake env lean TauCetiRoadmap/RelativisticQuantumFieldTheory/Suggested.lean` exits 0. Its only output is 14 `declaration uses sorry` warnings, at lines 92, 101, 133, 141, 160, 188, 202, 245, 289, 309, 316, 337, 347 and 358.
- `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Pins: Mathlib f6090c7 and Tau Ceti 358314d (main's are 1b1ccf4b and 2fd255d9).
- `git diff --stat origin/main...HEAD` outside the folder is empty. `overlaps.md` lists no other pull request changing this roadmap and no dropped or revision-only id. `citations.md` lists nothing found nowhere. No supplier gaps are declared.

**Signatures.** `Suggested.lean` is unchanged since 28bf856, so the 44 elaborated types in `signatures.md` (0 lost section binders) and the previous review's README-to-Lean comparison still apply. No `set_option`, no sorried data, no `lemma`. The imports are `import Mathlib` plus `TauCeti.Analysis.PDE.HeatKernel.Basic`.

**Headline theorems.** These are unchanged and still stated in `Suggested.lean`, as listed in the previous report:
- the causal Green operators (§1.1);
- the four boundary values and their classification (§1.9);
- the quartic asymptotics and continuation (§5.16);
- extension below the scaling degree (§6.9);
- reflection positivity (§7.6);
- the zero-mass limits (§7.3).

The docstring still names the non-statable ones with their missing carriers. The diff touches no headline.

**Library declarations opened at the pins:**
- `Matrix.single` (Mathlib `Mathlib/Data/Matrix/Basis.lean` line 34) and `Matrix.single_mul_single_same` (line 331, `single i j c * single j k d = single i k (c * d)`), identical at f6090c7 and 1b1ccf4b.
- The `δ=0` half of the §2.10 Check is `Matrix.single_mul_single_of_ne` (line 346), part of the cited definition's API; no change is needed. `single_mul_single` exists only as `PEquiv.single_mul_single` (`PEquiv.lean` line 169).
- Tau Ceti `exists_unit_conj_of_algEquiv` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean` line 139: `[Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]`, conclusion `e x = u * x * u⁻¹`). This is what §2.2 and §2.10 consume.

**Sources checked at their locators:**
- borcherds-qft: §9.5 starts at line 2749. The central-extension sentences (orthogonal group, `Pin(3,1)` versus `Pin(1,3)`) are at lines 2764–2769, on the page whose footer, line 2778, reads 74. Page 75 starts at line 2779.
- borcherds-qft §9.6, pp. 75–76: the gauge symmetry `ψ↦e^(iθ)ψ`, `ψ̄↦e^(−iθ)ψ̄` is at line 2819 and the current `j^μ=ψ̄γ^μψ` at line 2824 (p. 76). This supports §9.13 as written.
- bm23 (v7): Theorem 3.2 is at line 1891 (block form, implementable iff `v∈L²(h)`, `Ua(φ)U*=a(uφ)+a*(vφ̄)`), with (94) at line 1772 and (95) at line 1776. Proposition 2.12 is at lines 1004–1009. Separability of `h` is at lines 56 and 179, and `Xᵀ=CX*C`, `X̄=CXC` are at line 183.

**Seeded sample.** §6.23 and §9.13 lie in the changed text (rows N5 and N6), and §2.2 is cited by the changed §2.10 (Skolem–Noether declaration above). The other sample targets are untouched; their rows are carried from the previous report or computed below. §7.5's OS II locator is not verifiable (R05).

**Adversarial table.** Rows N1–N11 cover the changed statements. Rows marked "r4 row k" are carried from the previous report for untouched statements, with that report's values. Rows S1–S5 are spot computations on untouched sample targets that the previous table did not cover.

| # | Statement | Instance / computation (values on each side) | Result |
|---|---|---|---|
| N1 | §2.10 innerness step, Needs line | `τ(a)ᵀS=Sa` ⇒ `τ(a)=S^(−T)aᵀSᵀ`; `Sᵀ=±S` ⇒ `S^(−T)=±S⁻¹`, signs cancel: `S⁻¹aᵀS`. `E_klE_ij`: `l=i` ↦ `E_kj` (`single_mul_single_same`), `l≠i` ↦ `0` (`single_mul_single_of_ne`). Conjugate-transpose on `M_n(ℂ)`: `(λa)↦λ̄a*`, not `ℂ`-linear | sound |
| N2 | §2.11 page | §9.5 at line 2749; central extensions at lines 2764–2769; footer "74" at line 2778 | sound |
| N3 | §4.2 Dirac non-locality Check | `{ψ(f),ψ̄(g)}=0` ⇒ `[ψ(f),ψ̄(g)]=2ψ(f)ψ̄(g)`. With `ψ=a(·)+b*(·)` and `ψ̄=a*(·)+b(·)`: `ψ(f)ψ̄(g)Ω=⟨f₊,g₊⟩Ω+b*(f₋)a*(g₊)Ω`, and `‖b*(f₋)a*(g₊)Ω‖=‖f₋‖‖g₊‖≠0`. The other order gives `−⟨g₋,f₋⟩Ω+b*(f₋)a*(g₊)Ω`; the vacuum terms agree because the anticommutator function vanishes at spacelike separation. Bilinears in mutually anticommuting factors: sign `(−1)⁴=1` | sound |
| N4 | §4.9 metric-Hermitian Check | `[Av,w]=[v,Aw]` ⇔ `ηA=(ηA)*`. `A=[[0,1],[−1,0]]`: `ηA=[[0,1],[1,0]]` is Hermitian and `A*=[[0,−1],[1,0]]=−A`. `B=[[0,1],[1,0]]`: `ηB=[[0,1],[−1,0]]=−(ηB)*`, metric adjoint `ηB*η=[[0,−1],[−1,0]]=−B`, and `B*=B` | sound |
| N5 | §6.23 tadpole Check | `∫d⁴k(k²+m²)^(−s)=π²Γ(s−2)m^(4−2s)/Γ(s)` at `s=1+z`, convergent iff `2(1+Re z)>4`, i.e. `Re z>1`. `Γ(1+z)=z(z−1)Γ(z−1)` ⇒ value `π²m^(2−2z)κ^(2z)/(z(z−1))`. Residues: `π²κ²` at `z=1`, `−π²m²` at `z=0`. At `z=−1`: `π²m⁴κ^(−2)/2`. Agrees with §6.26 lines 3424 and 3480 (simple pole at `0`) | sound |
| N6 | §9.13 charge Check | `{γ⁰,γ⁰}=2η⁰⁰=2` (Conventions) ⇒ `j⁰=ψ†ψ`. `∫:ψ†ψ:=N_a−N_b`. `Q a*Ω=+a*Ω`, the state `ψ†Ω`; `Q b*Ω=−b*Ω`, the state `ψΩ`. `[Q,a]=−a` and `[Q,b*]=−b*` ⇒ `[Q,ψ]=−ψ`. Unordered: `Σ(a*a+bb*)=N_a−N_b+Σ{b,b*}`, a divergent constant. `N_a+N_b` gives `[Q,ψ]=−a+b*≠−ψ`. The body's "ψ of weight +1" is `e^(−iθQ)ψe^(iθQ)=e^(iθ)ψ`, matching borcherds-qft line 2819 | sound |
| N7 | §9.15 Furry Check | `−(γ^μ)ᵀ` satisfy `{·,·}=2η^(μν)`, so `C` exists (`M₄(ℂ)` is simple). `C(γ·p+m)C⁻¹=(m−γ·p)ᵀ` ⇒ loop trace = `(−1)ⁿ` × reversed loop with `p↦−p`. `n=3`: `1+(−1)³=0`. `n=2`: `1+1=2`, so vacuum polarisation survives | sound |
| N8 | §10.1 parts Check | `J²=−1`: `JUJ=(JSJ−S)/2=−U` ⇒ `JU=UJ`; `JβJ=β` ⇒ `Jβ=−βJ`. `CJ=−JC` ⇒ `JCJ=C` and `JSJ=−cosh(t)I+sinh(t)C` ⇒ parts `cosh(t)I` and `sinh(t)C`. `Re⟨Cx,y⟩=Re⟨Cy,x⟩=Re⟨x,Cy⟩` ⇒ `S` symmetric, skew part `0`. `Im⟨Sf,Sg⟩=(cosh²t−sinh²t)Im⟨f,g⟩` | mathematics sound; **R01** for the letter |
| N9 | §10.3 Bru–Metraud locator | bm23 line 1891: block `[[u,v],[v̄,ū]]`, implementable iff `v∈L²(h)`, `a(uφ)+a*(vφ̄)` ↔ README `a(Uf)+a*(vCf)` with `v=VC`. `U*U` top-left: `u*u+vᵀv̄` = (45), first relation. `UU*` top-left: `uu*+vv*`, but (46) prints `uu*−vv*`. Off-diagonal blocks: `u*v+vᵀū=0` and `uvᵀ+vuᵀ=0`, as printed | **R02**; rest sound |
| N10 | References `bm23` | Cache: title (line 5) and v7 of 22 April 2026 (line 40) agree with the README. arXiv abstract pages of v1 and v2 give the same title, not *Fermionic Bogoliubov transformations* | **R03** |
| N11 | §11.1 helicity Check | Boost along `p=|p|ẑ` with speed `v>|p|/E`: `p_z↦γ(|p|−vE)<0`, and `J_z` commutes with `K_z`, so `h=sign(p_z)J_z` flips. Massless: `v<1=|p|/E` is impossible. Spin 2: `2s+1=5` massive states, 2 helicities `±2` massless | sound |
| r4 row 1 | §1.1 `existsUnique_retardedSolution` (headline) | `f=0` ⇒ `u=0`; d'Alembert `u=½∫∫_cone f` solves `(∂_t²−∂_x²)u=f`; bgp08 Thm 3.1.1 (line 3026) | sound |
| r4 rows 2–5 | §1.9 `exists_prescription_distributions`, `prescription_relations`, `existsUnique_shell_decomposition` (headlines) | `−1/den₀→−Q+iπ(D₊−D₋)`, `−1/den₂→−Q+iπ(D₊+D₋)`; `G_F−G_A=2πiD₊`; `hδ′(h)=−δ(h)≠0`; at `m=0`, `p²δ₀=0` | sound |
| r4 rows 6–7 | §5.16 quartic asymptotics and continuation (headlines) | remainder `≤|w|^N/N!`; `b₂=35/384`; `F(−ζ)=−F(ζ)`; `ζ→0⁺` limit `√(2π)e^(j²/2)`; monodromy order 4 | sound |
| r4 row 8 | §6.9 `existsUnique_extension_of_scalesBelow` (headline) | difference `Σc_α∂^αδ` has degree `n+|α|≥n>σ`; bf00 Thm 5.2 (line 1118) | sound |
| r4 rows 9–10 | §7.6 reflection positivity (headlines) | `∫dp₀/(2π)·e^(ip₀t)/(p₀²+ω²)=e^(−ω|t|)/(2ω)`; `|K_Ef|²≤(1/2ω)∫|f̃|²` | sound |
| r4 row 11 | §7.3 zero-mass limits (headlines, sample) | `n=1`: `|(e^(−m|x|)−1)/(2m)+|x|/2|≤m|x|²/4`; `n=2`: `c_(m,R)=K₀(mR)/(2π)`; `n≥3`: multiplier difference dominated by `(4π²|ξ|²)⁻¹` | sound |
| r4 row 17 | §2.2 (sample) | `n=2`, `S=[[0,1],[−1,0]]`: `S⁻¹AᵀS=adj A`; alternating odd `S`: `det S=(−1)^n det S=0` | sound |
| r4 row 21 | §2.8 (sample) | `(3,1)↦M₄(ℝ)`, `(1,3)↦M₂(ℍ)`; `(fz)²=−ΔQ(f)` | sound |
| r4 row 26 | §2.13 (sample) | boost determinant `cosh²θ+sinh²θ=cosh 2θ>1`; `U_R(2π)=−I` | sound |
| r4 row 36 | §4.10 (sample) | `D_μν=g_μνC+∂_μ∂_νD₂` ⇒ `F–F` two-point function `0` | sound |
| r4 row 37 | §4.13 (sample) | `A(f)A(g)Ω=0`; at `p=(1,0,0,1)`, `p₀[e₁]−p₁[e₀]=[e₁]≠0` mod `ℂp` | sound |
| r4 row 52 | §6.14 (sample) | `{12}{3}∨{23}{1}={123}`; `T₂(xy)=xy≠0` | sound |
| r4 row 61 | §6.26 (sample) | equal-mass bubble `p²` coefficient `−1/(96π²m²)` | sound |
| S1 | §6.4 (sample, untouched) | localized transform of `χδ₀` is `χ(0)`, not decaying in any direction ⇒ `WF(δ₀)={(0,ξ):ξ≠0}`; `(0,ξ)+(0,−ξ)=0` excludes `δ₀²`; a submersion has `N_f=0` | sound |
| S2 | §6.29 (sample, untouched) | primitive bubble: `χ(bubble)=c` is the unique character comparing two prescriptions differing by `cδ` | sound |
| S3 | §6.31 (sample, untouched) | `∂^α(z e^(i⟨t,x⟩))=(it)^αz e^(i⟨t,x⟩)`; `θ₁θ₂≠0` but `θ²=0` | sound |
| S4 | §7.5 (sample, untouched) | `‖T_sf‖²=⟨f,T_(2s)f⟩`; iterating gives `‖T_sf‖≤‖f‖^(1−2^(−k))‖T_(2^ks)f‖^(2^(−k))`, which tends to `‖f‖` under polynomial growth | sound; OS II locator not verifiable |
| S5 | §9.1 (sample, untouched) | `M(a,b,z)=Σ_k(a)_kz^k/((b)_kk!)`: `(0)_k=0` for `k≥1` ⇒ `M(0,b,z)=1`; `(−n)_k=0` for `k>n` ⇒ degree `n` | sound |

**Cross-roadmap citations in the changed text.** The changed passages add no new supplier citation. The ones they carry are LieGroups Layer 5, InductionRestriction Layer 7, NoncompactQuantumSymmetry M0 and M4, OperatorAlgebraDynamics D8, QuantumFoundations §6.3–§6.4 and OperatorIdeals OI-B32–B40 and OI-C01–C14. The previous review resolved them at the same heads, and `roadmaps resolve` finds none missing.

**Ownership.** The diff adds only Checks and locators, no new owned object, so the previous review's ownership audit stands. That audit found no second owner on main or at the given open heads. Ownership against open pull requests whose files the brief does not give was not checked.

**Remarks on untouched text (no change requested):** §4.2's Needs line (line 991) lists §3.3 but not §3.4, although its body constructs the Dirac observable net. The remaining sections with fewer than three Checks (2.11, 5.1, 6.35, 7.8, 8.2, 9.1, 9.10, 9.12, 9.17, 9.19, 9.20, 9.22) are the convention and boundary sections the previous review exempted.

## Not verifiable

- Osterwalder–Schrader II (`os75`): the cached "text" is an Incapsula block page (R05), so the §7.1, §7.2 and §7.5 locators are recorded as the author states them.
- UNSW course notes (`unsw-qft`): waived; cited by locator only.
- Streater–Wightman, Haag, Reed–Simon II, Hörmander I, Weinberg, Bogoliubov–Shirkov, Tong, and Strocchi 1967 and 1970: settled as uncertified; cited by locator alone.
- Bru–Metraud v3–v6: not opened. The titles of v1, v2 and v7, and the v2 numbering of Theorem 2.8, were read on the arXiv abstract and HTML pages.

## Source issues

- **Misprint** in bm23 at Proposition 2.12, equation (46), printed page 18 (bm23 line 1009; the same sign is in the v7 HTML): the source says the product of `u` with its adjoint minus `v` with its adjoint is the identity; it should say plus, as unitarity of the block Bogoliubov matrix forces; affects a stated result.
