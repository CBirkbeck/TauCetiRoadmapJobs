# Review of RelativisticQuantumFieldTheory (pull request #1772 at ed01009)

**Verdict:** needs changes

This is an incremental re-review of the 11 changed lines since e8ff198. Every change is in `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md`. `Suggested.lean` is byte-identical to e8ff198, and nothing outside the folder changes.

The three README findings of the previous report are repaired, and so is the §4.2 Needs remark. The repairs introduce no new defect. The gate passes and `Suggested.lean` elaborates.

Two P3 findings remain. Both are entries in the board's sources manifest that the previous report raised. The repair reply on the pull request answers both as correct, but neither record has changed. Nothing is P1 or P2.

## R01 (P3) — The manifest entry `bm23` still records the wrong title and locator

Location: board manifest `packages/RelativisticQuantumFieldTheory/sources.toml`, entry `bm23`, which reads `title = "Fermionic Bogoliubov transformations"`, `locator = "Theorem 2.8"` and `version_note = "arXiv, latest version"`.

Claim: the record names the work and the locator that the README cites.

Witness:
- The cached text is the v7 of 22 April 2026 (bm23 line 40), and its title (bm23 line 5) is *Quadratic Hamiltonians in Fermionic Fock Spaces*. The arXiv abstract pages of v1 and v2 give the same title.
- v7 has no Theorem 2.8. README line 5603 cites Theorem 3.2 (bm23 line 1891) and Proposition 2.12 (line 1004).
- The manifest has not changed since before the previous review.

Repair: the worker sets
- `title = "Quadratic Hamiltonians in Fermionic Fock Spaces"`;
- `locator = "Theorem 3.2; Proposition 2.12 (44)–(46)"`;
- `version_note = "numbering of v7 (22 April 2026); Theorem 3.2 is Theorem 2.8 in v2 (3 October 2023)"`.

The arXiv history lists v2 on 3 October 2023, and the v2 HTML numbers "Implementation of Bogoliubov transformations" as Theorem 2.8, so the note holds.

## R02 (P3) — The manifest still certifies a bot-block page as the text of Osterwalder–Schrader II

Location: board manifest `packages/RelativisticQuantumFieldTheory/sources.toml`, entry `os75`, which has `status = "certified"`, `licence_class = "open-repository"` and sha256 `b6013daa…`. The README cites it in §7.2 (line 4486) and §7.1/§7.5.

Claim: the OS II text was fetched, so its locators can be checked against it.

Witness: the cached `os75` is five lines long, and its only content is an Incapsula "Request unsuccessful" page (os75 line 5). I probed again this round through the sources service, into a scratch copy of the manifest:
- the Project Euclid PDF URL returned the same five-line Incapsula page;
- the DOI 10.1007/BF01608978 resolved only to a paywalled page, and the service's verdict was "uncertified".

Repair: the worker records `os75` as `status = "uncertified"` with `doi = "10.1007/BF01608978"`, and drops the `sha256` and `fetched_from` of the block page. The README's OS II locators stay as written. Re-fetching from Project Euclid does not work from this host.

## Previous findings

- R01 — repaired: line 5415 reads "`P=(S−JSJ)/2` and `β=(S+JSJ)/2`, with `JPJ=−P` and `JβJ=β`", and the body (line 5409) says "complex-linear part `P` and antilinear part `β` relative to J, in the letters of §10.2".
- R02 — repaired: line 5455 adds "the first relation of (46) is misprinted as `uu*−vv*=1`: a Bogoliubov transformation there is a unitary of `h⊕h` (its §3.1) … gives `uu*+vv*=1`". The new Check at line 5476 tests the sign.
- R03 — repaired: line 5603 reads "(the numbering is that of v7; in v2 of 3 October 2023 the implementation theorem is Theorem 2.8)".
- R04 — not repaired: manifest `bm23` still has `title = "Fermionic Bogoliubov transformations"` and `locator = "Theorem 2.8"` (now R01).
- R05 — not repaired: manifest `os75` is still `status = "certified"` on the Incapsula page (now R02).
- Remark on §4.2 Needs (no R-number) — addressed: line 991 reads "*Needs:* §3.3, §3.4; VonNeumannAlgebras V4.Core; §4.4 and §4.5 for the two directions."

## Verified sound

**Gate, build and dependency check.**
- My rerun of the gate on ed01009 exits 0 with every check at 0, including `outside-folder=0`, `stray-files=0`, `statement-hygiene=0`, `readme-ids-missing=0` and `depcheck=0`. The rerun prints no `build` field; the worker's gate at this head reports `build=0`.
- `lake env lean TauCetiRoadmap/RelativisticQuantumFieldTheory/Suggested.lean` exits 0. Its only output is 14 `declaration uses sorry` warnings, at lines 92, 101, 133, 141, 160, 188, 202, 245, 289, 309, 316, 337, 347 and 358.
- `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat e8ff198..HEAD` shows only README.md (6 insertions, 5 deletions).
- `overlaps.md` lists no other pull request changing this roadmap, and no dropped or revision-only id. `citations.md` lists nothing that is found nowhere. No supplier gaps are declared.

**Lean side.**
- `Suggested.lean` is unchanged, so the 44 elaborated types in `signatures.md` (0 lost section binders) still apply, as does the earlier README-to-Lean comparison.
- The file has no `set_option`, no sorried data and no `lemma`. Its imports are `import Mathlib` plus `TauCeti.Analysis.PDE.HeatKernel.Basic`. The branch pins are Mathlib f6090c7 and Tau Ceti 358314d.
- The diff names no library declaration and no Lean name of this roadmap's own. The new letters `P` and `β` are prose, and the gate's `readme-ids-missing` is 0.

**Headline theorems.** The headline list is unchanged and still stated in `Suggested.lean`:
- the causal Green operators (§1.1);
- the four boundary values and their classification (§1.9);
- the quartic asymptotics and continuation (§5.16);
- extension below the scaling degree (§6.9);
- reflection positivity and one-particle density (§7.6);
- the zero-mass limits (§7.3).

The module docstring still names the non-statable headlines with their missing carriers, including Shale's theorem (RQFT10), which lacks Fock spaces at the pins. The diff touches no headline and no Lean statement, so no padding probe was needed this round.

**Sources checked at their locators (bm23 = arXiv v7 cache):**
- Proposition 2.12 is at bm23 lines 1004–1009, on printed page 18 (footer at line 1060). (45) at line 1008 is printed with plus signs. The first relation of (46) at line 1009 is printed `uu*−vv*=1`; the second, `uvᵀ+vuᵀ=0`, is printed correctly.
- Lines 1101–1108 identify the evolution as implementing the block Bogoliubov transformation `[[u,v],[v̄,ū]]` on `h⊕h`, with a pointer to Theorem 3.2.
- §3.1 starts at line 1734. Line 1794 defines a Bogoliubov transformation as a unitary `U∈B(H)` with `UA=AU`, where `H=h⊕h` (line 1766). This supports "(its §3.1)" as written.
- Theorem 3.2 is at line 1891, and `Xᵀ=CX*C` and `X̄=CXC` are at line 183.
- arXiv abstract page history: v2 was submitted Tue 3 Oct 2023 and v7 Wed 22 Apr 2026. The v1 and v2 titles are *Quadratic Hamiltonians in Fermionic Fock Spaces*. The v2 HTML numbers "Implementation of Bogoliubov transformations" as Theorem 2.8.

**Cross-roadmap citations in the changed lines, resolved this round:**
- VonNeumannAlgebras V4.Core: on main, README line 972; merge order line 5.
- OperatorAlgebraDynamics D8: on main, README line 693.
- QuantumFoundations §6.3 (line 724), §6.4 (line 740) and §9.9 (line 1077): at the head of its open pull request; merge order line 209, before this roadmap at line 211.
- §3.4, newly cited by §4.2, is "The free Dirac field" (line 864). Its Needs (D8, §1.3, §2.15, §2.12) contain nothing from Layer 4, so the new edge creates no cycle.

**Ownership.** The diff adds no owned object, only a Needs item, letters, a source note, a Check and a locator. The earlier ownership audit therefore stands: no second owner was found on main or at the open heads the brief gives. Ownership against open pull requests whose files the brief does not give was not checked.

**Seeded sample.** No sample target lies in the changed lines. §3.3 is named in the changed §4.2 Needs line (its row is carried), and §3.4 is newly cited (row S5). The other sample rows are carried from the earlier reports. §1.4, §5.7, §5.12 and §9.12 had no earlier row, so rows S1–S4 compute them here.

**Adversarial table.** N rows cover the changed statements. Rows marked r5 or r4 are carried, with the values recorded in those reports, for statements the diff leaves untouched.

| # | Statement | Instances and computed values (each side) | Result |
|---|---|---|---|
| N1 | §4.2 Needs `§3.3, §3.4` | The §4.2 Dirac Check (line 989) uses `ψ`, `ψ̄` and the Dirac observable net. §3.4 (line 864) constructs the CAR Dirac field. §3.4 Needs = D8, §1.3, §2.15, §2.12: none later than Layer 3, so there is no cycle. | sound |
| N2 | §10.1 parts `P`, `β` (body and Check) | `J²=−1`: `JPJ=(JSJ−S)/2=−P` ⇒ `PJ=JP`; `JβJ=(JSJ+S)/2=β` ⇒ `βJ=−Jβ`. Instance `S=cosh(t)I+sinh(t)C`: `CJ=−JC` ⇒ `JCJ=C` ⇒ `JSJ=−cosh(t)I+sinh(t)C`, so `P=cosh(t)I` and `β=sinh(t)C`. This agrees with the §10.2 definition (line 5421) and Check (line 5437). §10.1 no longer uses `U`, which §10.2 keeps for the Fock implementer (line 5423). | sound |
| N3 | §10.3 (46) misprint clause | `𝒰=[[u,v],[v̄,ū]]` ⇒ `𝒰*=[[u*,vᵀ],[v*,uᵀ]]`, using `(v̄)*=Cv*C=vᵀ`. `(𝒰*𝒰)₁₁=u*u+vᵀv̄=1` matches (45) as printed. `(𝒰𝒰*)₁₁=uu*+vv*=1`, but (46) prints a minus sign. `(𝒰𝒰*)₁₂=uvᵀ+vuᵀ=0` matches the print. With `v=VC`: `vv*=VCCV*=VV*`. | sound |
| N4 | §10.3 new sign Check | One mode, `U=0`, `V=C`: `U*U+V*V=0+1=1` and `UU*+VV*=0+1=1`, whereas `UU*−VV*=−1≠1`. The neighbouring Check: `U*U=1−V*V` gives `0=1−1`. The implementation formula gives `a(Cf)*=f̄a*`, so `a↦a*` and `{a*,a}=1` is preserved. | sound |
| N5 | References `bm23` | The v2 date (3 Oct 2023) and v2 Theorem 2.8 agree with the arXiv history and the v2 HTML; the title and the v7 date of 22 Apr 2026 agree with bm23 lines 5 and 40. "(46) read with a plus sign as in §10.3" agrees with N3. | sound (manifest: R01) |
| S1 | §1.4 (sample) | `P_T k=k−k(|k|²/|k|²)=0`; `P_T²=I−2kkᵀ/|k|²+kkᵀ/|k|²=P_T`; `tr P_T=3−1=2`. On the torus, `∫(−Δφ)=0` forces `∫ρ=0`. NR bound: `0≤1+x/2−√(1+x)≤x²/8` with `x=p²/(m²c²)` gives `|E_c−mc²−p²/2m|≤p⁴/(8m³c²)`, hence `≤|t|κ⁴‖f‖/(8ℏm³c²)` for `|p|≤κ`. | sound |
| S2 | §5.7 (sample) | `f:{1,2}→{1}`: `F_f(x)=(x,x)` and `⟨f*u,φ⟩=⟨u,φ(x,x)⟩`. The injection `{1}→{1,2}`: `F(x₁,x₂)=x₁`, so the second variable is integrated out. `d/dx φ(x,x)=(∂₁+∂₂)φ`. `V(∅)=𝓔′(pt)=ℂ`. | sound |
| S3 | §5.12 (sample) | `F_f(x₁,x₂,x₃)=(x₁,x₁,x₂)` for `(x₄,x₅,x₆)`, so `x₃` is integrated. `D₁↦D₄+D₅` by Leibniz, `D₂↦D₆`, and `D₃↦ε(D)=0`. This agrees with the §5.7 empty-fibre Check `D₂↦0`. | sound |
| S4 | §9.12 (sample) | `−Δ(1/(4π|x|))=δ`, and the Fourier transform of `1/(4π|x|)` is `1/|k|²`. With `η⁰⁰=+1`, `k_μk^μ=ω²−|k|²`. Transverse modes per momentum: `tr P_T=2`. | sound |
| S5 | §3.4 (newly cited) | `(γ·p−m)(γ·p+m)=p²−m²=0` on the shell, so the columns of `γ·p+m` are `u`-solutions. `Σ_sū_su_s=tr(γ·p+m)=4m=2·2m`. `tr(γ·p−m)=−4m` fits `v̄v=−2m`. | sound |
| r5 N1–N11 | §2.10, §2.11, §4.2 Dirac Check, §4.9, §6.23, §9.13, §9.15, §10.1 (mathematics), §10.3 locator, §11.1 | values as in the previous report (for example `E_klE_ij=E_kj` at `l=i`; tadpole residues `π²κ²` at `z=1` and `−π²m²` at `z=0`; Furry `1+(−1)³=0`) | sound |
| r4 row 1 | §1.1 retarded solution (headline) | `f=0` ⇒ `u=0`; d'Alembert `u=½∫∫_cone f`; bgp08 Thm 3.1.1 (line 3026) | sound |
| r4 rows 2–5 | §1.9 boundary values (headlines) | `G_F−G_A=2πiD₊`; `hδ′(h)=−δ(h)`; `p²δ₀=0` at `m=0` | sound |
| r4 rows 6–7 | §5.16 quartic (headlines) | remainder `≤|w|^N/N!`; `b₂=35/384`; monodromy order 4 | sound |
| r4 row 8 | §6.9 extension (headline) | the difference `Σc_α∂^αδ` has degree `n+|α|≥n>σ`; bf00 Thm 5.2 | sound |
| r4 rows 9–10 | §7.6 reflection positivity (headlines) | `∫e^(ip₀t)/(p₀²+ω²)dp₀/2π=e^(−ω|t|)/(2ω)` | sound |
| r4 row 11 | §7.3 zero-mass limits (headlines) | `n=1`: error `≤m|x|²/4`; `n=2`: `K₀(mR)/(2π)` | sound |
| r4 row 13 | §0.4 (sample) | `∫φ̂ψ̄=√(2π)e^(−(a²+b²)/4)e^(−iab/2)`; `‖e^(−x²/2)‖²=√π` | sound |
| r4 row 18 | §2.3 (sample) | rank of `(abᵀ+baᵀ)/2` is at most 2; `ξ²+m²=(ξ+im)(ξ−im)` | sound |
| r4 row 22 | §2.9 (sample) | `(iγ⁰γ¹γ²γ³)²=I`; `T=−γ¹γ³K` and `C=−iγ²K` | sound |
| r4 row 26 | §2.14 (sample) | `P_±=(1±γ⁵)/2` are orthogonal idempotents; `U_R(2π)=−I` | sound |
| r4 row 27 | §2.15 (sample) | `d³p/(2ω)` is invariant; box coefficient `1/√(2ω_kL³)` | sound |
| r4 row 28 | §3.3 (sample) | `⟨Ω,W(h)Ω⟩=e^(−‖h‖²/4)`; `e^(iφ(f))` has vacuum value `e^(−‖Kf‖²/2)` | sound |
| r4 row 30 | §3.6 (sample) | `Σ_(0<|k|<δ)h³/|k|≈2πδ²` | sound |
| r4 row 38 | §4.14 (sample) | phases `1, i, −i, −1`; `conj(η_r)η_(r*)=(−1)^(k+l)` | sound |
| r4 row 43 | §5.15 (sample) | sphere area `2π` (`n=2`), `4π` (`n=3`); `∫e^(−(1+ic)x²)=√(π/(1+ic))` | sound |
| r4 row 52 | §6.14 (sample) | `{12}{3}∨{23}{1}={123}`; `T₂(xy)=xy≠0` | sound |
| r4 row 67 | §7.7 (sample) | `I₄=π²/2`; matchings `1, 1, 3, 15`; `C^n≤e^C n!` | sound |

**Remarks on untouched text (no change requested):** none new.

## Not verifiable

- Osterwalder–Schrader II (`os75`): the Project Euclid copy returns a bot-block page to the sources service, and the DOI is paywalled (R02). The §7.1, §7.2 and §7.5 locators are recorded as the author states them, and so is any OS II input to §7.7.
- UNSW course notes (`unsw-qft`): waived; cited by locator only.
- Streater–Wightman, Haag, Reed–Simon II, Hörmander I, Weinberg, Bogoliubov–Shirkov, Tong, and Strocchi 1967 and 1970: settled as uncertified; cited by locator only.
- Bru–Metraud v3–v6: not opened. The v1, v2 and v7 metadata and the v2 theorem numbering were read on the arXiv abstract and HTML pages.

## Source issues

- **Misprint** in bm23 at Proposition 2.12, equation (46), printed page 18 (bm23 line 1009): the source says `u` times its adjoint minus `v` times its adjoint is the identity; it should say plus, as unitarity of the block Bogoliubov matrix (its §3.1) forces; affects a stated result.
