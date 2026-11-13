# Review of SchemeKTheoryOperations (pull request #1229 at 91f9d39)

**Verdict:** needs changes

## R01 (P2) — §7.4 states Grothendieck–Riemann–Roch only over an algebraically closed field, below what its supplier proves

**Location:** `TauCetiRoadmap/SchemeKTheoryOperations/README.md` line 3065: "For proper maps of smooth quasi-projective varieties over an algebraically closed field … the geometric GRR theorem is supplied by intersection theory in exactly this source scope." Also lines 3059, 3069 and 3168.

**Claim:** The supplied theorem, and so the K-transfer realization and its Hirzebruch consequence, hold only over an algebraically closed field.

**Witness:** SchemeAndStackFoundations §5.8 (main, README line 8500) proves `grothendieck_riemann_roch` over the "one fixed field `k`" of its Layer 5 (line 7945); Weibel line 8668 too. Conic `x²+y²+z²=0` over ℝ: `χ(O)=1=deg(c₁(T)/2)=2/2`.

**Repair:** State the scope of the supplier. Line 3059: "For Chow-valued GRR and its Hirzebruch consequence use proper morphisms between smooth quasi-projective varieties over a field, the scope of SchemeAndStackFoundations §5.8. That supplier does not give arithmetic-base Chow-valued GRR." Line 3065: "For proper maps of smooth quasi-projective varieties over a field, … the geometric GRR theorem is supplied by SchemeAndStackFoundations §5.8 in this scope (Borel–Serre prove it over an algebraically closed field)." Line 3069: "For smooth projective X over a field". Line 3168: "The Chow-valued geometric GRR theorem here is over a field; arithmetic bases are excluded." Add the Check: "For the conic `x²+y²+z²=0` over ℝ, which has no rational point, `χ(O)=1` and `deg(td₁)=deg(c₁(T))/2=2/2=1`, the degree of a closed point counting its residue degree 2; a degree that counted points without residue degrees would give `1/2`."

## R02 (P3) — Supplier layers cited by identifiers the suppliers do not have

**Location:** README line 1302: "EnhancedDerivedSheaves E.1 and E.4; SchemeAndStackFoundations SF.0, SF.2 and SF.4"; line 1712: "are the E.4/SF.4 contracts"; line 1788: "§§0.24–0.26, 2.12–2.14 and SF.4–SF.5".

**Claim:** `E.1`, `E.4`, `SF.0`, `SF.2`, `SF.4`, `SF.5` are identifiers of the two suppliers.

**Witness:** `SF.` occurs nowhere in SchemeAndStackFoundations' README on main; its layers are "Layer 0" to "Layer 5". EnhancedDerivedSheaves' headings are "Layer E1" (line 506) and "Layer E4" (line 2565), as the rest of this README writes them.

**Repair:** Line 1302: "EnhancedDerivedSheaves Layers E1 and E4; SchemeAndStackFoundations Layers 0, 2 and 4". Line 1712: "are the contracts of EnhancedDerivedSheaves Layer E4 and SchemeAndStackFoundations Layer 4". Line 1788: "SchemeAndStackFoundations §§0.24–0.26, 2.12–2.14 and Layers 4–5".

## Verified sound

Previous review (head 5571221), finding by finding: R01 repaired (line 2409: "unique up to weak homotopy … The class of f … is unique when `lim¹_N[ΣBGL_N(A),H]=0`", with its three dependants and StableHomotopyKTheory §4.11 in the *Needs:* line); R02 repaired (`groupHomology_stabilizeGL_of_ringKrullDim_le` and `groupHomology_stabilizeGL_of_isSemisimpleRing` stated, named at lines 107 and 2600); R03 repaired (lines 79, 1516, 1846, 1862); R04 repaired (line 3186); R05 repaired (lines 1045, 1051, 2544, 2715); R06 repaired (line 1336); R07 repaired (lines 73, 1344, 1352, 1603, 1702, 1762, 1846); R08 repaired (line 3152, and the GS87 pages of lines 2816, 2824, 2845, 2849).

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3 perfect objects (sample) | `k(0)` on A¹; k over `k[ε]/ε²`; `⨿_n k[n]` | x-resolution, amplitude `[−1,0]`; `Tor_i(k,k)=k` all i; no global interval; Stacks.cohomology lines 5400–5469 as restated | agree | none |
| §2.3 proper transfers (sample) | `O(n)` on P¹; `ℤ[i]/ℤ`; `∏k/⊕k` | `n+1`: 0 at −1, −1 at −2; `[O]↦2`; flat, proper, ideal not finitely generated; Stacks.perfect lines 249, 311, 1213, 3102, 4610 | agree | none |
| §2.4 base change, projection (sample) | P¹; `k(0)⊗ᴸk(0)`; `V→Spec k[t]` | `(1−[O(−1)])²=0`; `k⊕k[1]`, class 0; f′ not flat, target non-Noetherian; Stacks.perfect lines 2312, 4627; Weibel lines 23289, 23707 | agree | none |
| §2.5 affine and bundle comparisons (sample) | field; doubled plane; DVR | dimension and `λ(u)`; `K(k)×K(k)` against `K(k)`; `∂[π]=1` in both models; Stacks.perfect lines 4487, 4528; Weibel lines 22774, 9575, 25648 | agree | none |
| §2.7 continuity, proper support (sample) | countably many lines, one origin | pushforward `k[0]`; tags 0CYS, 08DS are Cohomology of Schemes Lemmas 26.7, 26.10; 01ZA, 01ZM are Limits 5.4, 10.1 | agree | none |
| §4.1 Mayer–Vietoris, Brown–Gersten (sample) | two P¹ at two nodes; two-point space, `F(∅)=E`, `F(a)=F(b)=0` | `(a,b)↦(a−b,a−b)`, cokernel ℤ; `F(X)=ΩE≠0` with zero stalks, so `F(∅)=0` is needed; Weibel line 27064 omits it | agree | none |
| §4.2 Nisnevich site (sample) | `Spec(k×k)→Spec k`; separable extension | section exists; no residue-isomorphic lift; Hoyois.2016 lines 8–26; Weibel lines 27133, 27151 | agree | none |
| §4.12 distinguished squares (sample) | constant `Hℤ` | every square cartesian, `F(∅)≠0`; AsokHoyoisWendt.2015 lines 423–436, 487–495 | agree | none |
| §5.2 regular Laurent extension (sample) | `k[T,T⁻¹]`, n=1; nodal cubic | `k^×⊕ℤ`; `K₋₁=ℤ`; Weibel lines 25130, 11819, 12402 | agree | none |
| §5.7 regular blowups (sample) | d=2 point; d=1, `F=k` | `RΓ(P¹,O(−1))=0`, recovery gives F; `k[−1]⊕k≠k`; Thomason93 lines 254–287, 345 (printed 200–202), 763–776 | agree | none |
| §5.8 blowup (headline) | `Bl_xP²`; `O_E(−1)` | `ℤ⁴=1+2+1`; `0→O→O(E)→O_E(−1)→0` gives `O(E)−1` | agree | none |
| §6.1 products (sample) | origin class on A¹; `Spec ℚ→Spec ℤ` | square 0; fibre `K₀=ℚ^×/±1=⊕_pℤ`; Weibel lines 15437, 15504 | agree | none |
| §6.4 operations and products | `C_{2,a,b}`; `z=[t][u][2]` | `(−1,2,2,−2)`; `γ²=1−2^{n−1}`: 0, −1, −3 in weights 1, 2, 3 | agree | none |
| §6.6 splitting (sample) | `Fl(k³)`; rank 2 | rank `3!=6` against 3; second line `π*det E⊗O(1)`; Weibel lines 8540, 8552 | agree | none |
| §6.7 van der Kallen, Noetherian form (headline, Lean) | `𝔽₂`, m=1, 2; ℤ, m=1; zero ring | `H₁`: `0,ℤ/2,0,0`; `H₂(GL₃,₄,₅)=ℤ/2,ℤ/2,0`, onto from 4, bijective from 5; `(ℤ/2)²→ℤ/2` at n=2; Kal80 lines 232–238, 875–877 | agree | none |
| §6.7 semilocal form (headline, Lean) | `𝔽₂×𝔽₂`; `M₂(𝔽₂)` | `H₁`: `(ℤ/2)²→0` at n=2; `GL_n(M₂(𝔽₂))=GL_{2n}(𝔽₂)`, `0→0` at n=2 | agree | none |
| §6.9 weights (sample, headline) | Moore comparison; projectors; `ℓ>N+1` | `[Σ^{m−1}S/n,E]=π_m(E/n)`; `2^i−2^j≠0`; `k^i` distinct mod ℓ for `i≤N` | agree | none |
| §6.10 Bott classes | line L; `R=ℤ`, `N=1` | `θ⁻²(L)=−L⁻²(1+L)`; `λ₋₁(1)=0`, `λ²_N(0,1)=−ψ²/2=−1` | agree | none |
| §1.6 `IsPerfectComplex.exists_strictlyPerfect` (headline, Lean) | doubled plane; ∅ | `hres` fails, `K₀` ℤ against ℤ²; `P=0`; Stacks.perfect lines 4197, 4392 | agree | none |
| §3.3 localisation (headline) | `ℤ_(2)`; degrees n, q | `∂[12]=2`; `∂(j*y·x)=(−1)^{nq+(n−1)q}y∂x=(−1)^q y∂x` | agree | none |
| §4.6 Gersten, Bloch (headline) | `𝔽_p[t]_(t)` | `0→K₂(R)→K₂(F)→𝔽_p^×→0` | agree | none |
| §4.11 Witt degree (headline) | `p^r`, exponent m | `(m+r)−m=r`; −1 at `r=−1` | agree | none |
| §5.5 projective bundle (headline) | `O(m)` on P¹ | `(m+1,−m)`; `m=−1` gives `(0,1)` | agree | none |
| §5.6 Bass (headline) | `k[ε]/ε²` | `NK₁={1+εf, f∈Tk[T]}` | agree | none |
| §7.3a Chern classes (headline) | units a, b, c; T8 | `c_{3,3}=−2·(−c₁c₁)c₁=2`; `ch` product sign `(−1)^i` on both sides | agree | none |
| §7.4 Euler transfers, GRR (sample, R01) | P¹; real conic | `deg((1+nH)(1+H))=n+1`; `χ(O)=1=2/2` over ℝ; supplier is over any field | narrower than supplier | R01 |
| §7.5 Adams Riemann–Roch (headline) | P¹, k=2; index | `π_*((1+h)/2)=1`; `k^{d−j}k^{−r}k^{−e}=k^{−j}` | agree | none |
| §7.6 excess, self-intersection (sample, headline) | zero section of L; point on a curve | `1−L∨`; `Tor₀=Tor₁=k`, operator 0; Thomason93 lines 519–543, 562–566 (printed 206–207) | agree | none |
| §7.7 supported cycles (headline) | `O/π^m`; GS87 line 1284 | `m[s]`; printed 274 | agree | none |
| Layer 3 and 4 Dependencies (R02) | six identifiers | none found in the two suppliers | not found | R02 |

- Source locators checked against the text: 103. Weibel 44 labels with pages, Stacks.perfect 20 tags, Stacks.cohomology 9, Stacks (Cohomology of Schemes 2, Limits 2, Divisors 1, Algebra 1), Thomason93 9, Kal80 6, GS87 6, AsokHoyoisWendt.2015 2, Hoyois.2016 1; none wrong.
- Library declarations opened at the pins: 36, all present, among them `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:79`, `TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean:88` and `:113`, `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:111`, `Mathlib/CategoryTheory/Sites/MayerVietorisSquare.lean:87`.
- Cross-roadmap citations resolved at main or the open heads: about 120 sections or names in 12 roadmaps (GeneralAlgebraicKTheory 42 sections, StableHomotopyKTheory 14, EnhancedDerivedSheaves 29, SchemeAndStackFoundations 23); six identifiers not found (R02).
- Gate at this head: every check passed. Dependency check: `depcheck: 240 roadmaps, 2175 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three warnings, `declaration uses sorry` at 74:8, 92:8 and 110:8.
- One-tactic probe on the three theorems (`rfl`, `infer_instance`, `simp`): none closes; no padding. The five elaborated signatures match README §§1.1, 1.3, 1.6 and 6.7; no binder lost. No other roadmap's `Suggested.lean` declares these names.
- Pull-request text read against the head: no sentence contradicted; nothing outside the folder is changed.
- Overlap check: read GeneralAlgebraicKTheory, KTheoryFiniteLocalFields, KTheoryLowDegrees, MotivicEtaleKTheory, SchemeKTheoryOperationsPartII, EnhancedDerivedSheaves, SchemeAndStackFoundations, AlgebraicKTheory, and HomologicalStabilityOfGeneralLinearGroups for shared objects. Chern classes on higher K-groups: this roadmap §7.3a (the others cite it); λ-ring and integral representation foundations: §§6.2–6.3 (KTheoryLowDegrees cites them); constant-coefficient stability of `GL_n`: §6.7 (HomologicalStabilityOfGeneralLinearGroups cites it and owns the twisted and elementary forms); ordinary scheme K-theory: this roadmap (Part II starts at formal support); `K₀`, `G₀`, Chow groups, geometric GRR: SchemeAndStackFoundations §§5.7–5.8 (cited here).
- Source independence: 16 passages compared with 8 sources, none shared; largest share Weibel, 209 of about 690 locators; contents compared with Weibel (chapters II, IV, V): independent, Layer 4 puts descent before coniveau where Weibel V.9–V.10 has the reverse, Layer 5 joins V.1, V.6 and V.8 with the blowup formula, Layers 1 and §§3.8–3.9 have no counterpart. TT90, the second source (159 locators), could not be read.

## Not verifiable

- TT90 (159 locators, among them those of the sampled §§2.3, 2.4, 2.7, 4.1, 4.2, 5.2, 6.1): the sources service found no legal copy; the README's link is to a personal site in no licence class.
- Soulé, Opérations en K-théorie algébrique (51 locators, sampled §§6.1, 6.9): not obtained from the journal's page.
- GS99 (17 locators, sampled §§6.6, 6.9): only an archived copy of a preprint server.
- Riou and Geisser (sampled §§6.1, 6.9): the service did not return a text in the time available.
- Quillen, Schlichting (sampled §2.7), Borel–Serre (sampled §7.4), Zhang.2021, LiLiu.2021: not opened this round.
- Gillet.1981: settled as uncertified; cited by locator only.
- Weibel line 23289 (Theorem V.3.7.2) is for quasi-projective schemes; §2.4's wider scopes rest on TT90, Proposition 3.18, not read.
- Thomason93 line 532: the scan's text does not show whether the source has `Z=Y∩W` or `Z⊂Y∩W`; §7.6 uses the second, which follows from the first by support enlargement.

## Source issues

- **Gap** in Weibel at Proposition V.10.8, PDF p.455: the source says a spectrum presheaf with the Mayer–Vietoris property and zero homotopy sheaves has zero homotopy groups; it should also assume a contractible value on the empty set, which the proof's first step uses; affects a stated result.
- **Gap** in Weibel at Proposition IV.5.7, PDF p.323: the source says the map out of the plus construction inducing a given natural transformation is unique up to homotopy; it should be unique up to weak homotopy, or assume the lim¹ term over the finite stages vanishes; affects a stated result.
- **Misprint** in Weibel at Corollary V.6.7.4, PDF p.420: the source says the map from the K-groups of an algebraically closed field to those of any commutative algebra over it is injective; it should be any nonzero commutative algebra; affects a stated result.

## For the human reviewers

- **Licence.** TT90, 159 of about 690 locators, is linked at a personal site (README line 3206); the sources service put that host in no licence class and found no other source. The status of the copy was not settled.
- **Licence.** Quillen (a third party's university page), Schlichting (another author's university page), GS99 (web archive of a preprint server), Zhang.2021 (a university archive) and Schneider (a seminar's copy of a book chapter) are linked at hosts not classified here.
