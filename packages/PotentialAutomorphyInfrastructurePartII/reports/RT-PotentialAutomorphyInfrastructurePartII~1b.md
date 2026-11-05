<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2224#issuecomment-6643913929 -->
Red team round 1 pass b (claude) of 6b4e6a1

Verdict: needs_changes

1. **F01** (P3) Tho17 page locators in §5.3 are not the accepted manuscript's pages

   Location: `packages/PotentialAutomorphyInfrastructurePartII/README.md:1232` ("Tho17, Theorem 5.1, p. 18"), `:1234` ("Tho17, Theorem 4.2 and Corollary 4.3, pp. 17–18"), `:1240` ("Tho17, Theorem 6.1 (pp. 22–23)").

   Claim: the Conventions say Tho17 is cited by the pages of the accepted manuscript; the other Tho17 pages in the README (Lemma 2.16 p. 11, Proposition 2.21 p. 14, Definition 3.3 p. 16, Proposition 7.1 p. 31) match that file, but these three do not.

   Witness: Tho17 line 905 (Theorem 4.2, page 20), line 958 (Corollary 4.3, page 22), line 997 (Theorem 5.1, page 23), line 1038 (Theorem 6.1, page 24).

   Repair: replace "Tho17, Theorem 5.1, p. 18" by "Tho17, Theorem 5.1, p. 23"; "Tho17, Theorem 4.2 and Corollary 4.3, pp. 17–18" by "pp. 20–22"; "Tho17, Theorem 6.1 (pp. 22–23)" by "(p. 24)".

2. **F02** (P3) Tho12 and Tho15 page locators that do not match the cited files

   Location and claim, each with its witness in the source file:

   - `README.md:1280` "Tho12, Theorem 10.1, p. 57": Tho12 line 2339 is on page 55 (running head "55" at line 2327). The same README cites the proof as "pp. 55–56" in §3.14, which is right.
   - `README.md:1294` "Tho12, Theorem 10.2, p. 59": Tho12 line 2404, page 56.
   - `README.md:1690` "Tho15, Proposition 3.37, pp. 31–33": Tho15 line 1362, page 28; Lemma 3.38 (line 1450) is already on page 30, so the proposition occupies pp. 28–30.
   - `README.md:1718` "Tho15, Theorem 4.19 and Lemma 4.22, pp. 43–49": Tho15 line 2286 (Theorem 4.19) is on page 47 and line 2446 (Lemma 4.22) on page 51.
   - `README.md:1732` "Tho15, Theorem 4.19 and Corollaries 4.20, 5.7, pp. 43–62": pp. 47–62.
   - `README.md:1614` "Tho15, Lemmas 3.36, 3.38, 3.40, Corollary 4.14, Propositions 4.17–4.18, pp. 29–46": Lemma 3.36 is at line 1326, page 28; Proposition 4.18 at line 2180, page 45.
   - `README.md:1834` "Tho15, Proposition 6.2, p. 65": line 3111, page 64.

   Repair: substitute the pages above (55; 56; pp. 28–30; pp. 47–51; pp. 47–62; pp. 28–45; p. 64).

3. **F03** (P3) NT21, NT23 and ANT20 page locators off by one to three pages

   Location and claim, each with its witness (the three files are the arXiv versions named under References; their printed page numbers agree with the file's page markers, e.g. NT21 line 3581 "73", NT23 line 566 "13", ANT20 line 717 "15"):

   - `README.md:1518` "NT21, Lemma 5.3, p. 66": NT21 line 3441, page 70.
   - `README.md:1932` "NT21, Corollary 5.4, p. 69": NT21 line 3455, page 70.
   - `README.md:2142` "NT23, Lemma 2.13, p. 10" and "Proposition 2.14, p. 11": NT23 lines 578 and 605, both page 13.
   - `README.md:2086` "NT23, Definition 1.1, p. 4": NT23 line 197, page 5.
   - `README.md:1532` "ANT20 §§2, 3.2, Lemmas 3.4–3.5, pp. 5–9": ANT20 lines 456 and 491, page 10.
   - `README.md:1553` "ANT20, Lemma 3.6, p. 10": line 523, page 11.
   - `README.md:1567` "ANT20, Definition 3.7, p. 10": line 577, page 12.
   - `README.md:1585` "ANT20, Lemma 3.8, p. 11" and "Lemma 3.9, p. 11": lines 583 (page 12) and 606 (page 13).
   - `README.md:1732` "ANT20, Theorem 4.1, p. 12": line 684, page 15 (§7.20 at line 1760 cites it correctly as p. 15).
   - `README.md:1782`, `:1820` "ANT20 §5, Lemma 5.2, p. 14": line 731, page 16; `:1801` "ANT20 §5, p. 14": the definition of potentially pro-automorphic is at line 762, page 16.
   - `README.md:1834` "ANT20, Proposition 5.3, p. 14": line 763, page 16.
   - `README.md:1876` "ANT20, Theorem 6.2, p. 20": line 890, page 19.

   Repair: substitute the pages above (70; 70; 13 and 13; 5; p. 10; 11; 12; 12 and 13; 15; 16; 16; 16; 19).

4. **F04** (P3) "Downstream consumers" overstates what ModularityAndLanglandsExtensions imports

   Location: `packages/PotentialAutomorphyInfrastructurePartII/README.md:2363` ("its §2.1 uses potential diagonalizability and its criteria (Layer 1)").

   Claim: ModularityAndLanglandsExtensions §2.1 at the head of its open pull request (e3a0748) defines diagonalizable and potentially diagonalizable representations itself, from LocalGaloisDeformationRings §6.8 and BLGGT14 §1.4, and proves Lemma 1.4.3 again; it does not cite this roadmap. Two open pull requests therefore plan the same object. This roadmap is the owner (it precedes ModularityAndLanglandsExtensions in the merge order, position 258 after the move against 269, and its Layer 1 is the general statement), so nothing moves here.

   Witness: sibling `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md`, heading "### 2.1 Potential diagonalizability and its criteria" and its *Needs:* line ("LGD §6.8, connects and component operations; PH, potentially crystalline representations; FiniteFlatGroupsAndIntegralPadicHodgeTheory, …"), which names no section of this roadmap.

   Repair: replace the bullet by "its §2.1 restates potential diagonalizability and its criteria, which §§1.4–1.5 own; that section imports Layer 1 once this roadmap is merged;". The intake should repoint ModularityAndLanglandsExtensions §2.1 to §§1.4–1.5 and §1.7 when this package is accepted.

All findings are P3 (locators and one ownership statement). No mathematical defect, no missing hypothesis, no unowned prerequisite, no supplier drift and no upward dependency was found. `Suggested.lean` declares nothing, and I confirm that none of the twelve headline theorems listed in its docstring is statable at the pins (Tau Ceti a91d3aa has no automorphic representations, no Galois deformation rings, no `𝒢_n`-valued representations and no pseudodeformation rings; Mathlib 6b7abb3 has none of these either).

## Verified sound

Counts: 0 Lean declarations (the file declares nothing, so there is nothing to `#check`; I confirmed the docstring's twelve headlines each name a missing carrier and that the missing carriers are indeed absent at the pins by grepping Tau Ceti for automorphic, deformation, pseudocharacter and `GaloisRep` carriers: only cocharacter Galois modules and elliptic-curve Tate modules exist). 110 targets read in full. 17 declared gaps checked against `design/plan.json` (same 17 slugs, same suppliers and sections). 176 cross-roadmap section citations resolved against supplier READMEs dumped at their current heads (AdelicAlgebraicGroups #792, ComplexComparisonPartII #848, ArithmeticGaloisRepresentations #856, ArithmeticGaloisDuality #858, SelmerIwasawaCohomology #869, ArithmeticLocallySymmetricSpaces #871, DeformationAndDerivedPatchingAlgebraPartII #872, LefschetzPencilsAndVanishingCycles #873, FiniteFlatGroupsAndIntegralPadicHodgeTheory #879, GlobalGaloisDeformations #920, LocalGaloisDeformationRings #923, EndoscopicTransferAndUnitaryTraceComparison #999, AutomorphicGaloisRepresentationsPartII #1006, PadicFamilies #1019, DeformationAndDerivedPatchingAlgebra #1034, AutomorphicFormsOnReductiveGroups #1037, PadicHodgeTheory #1062, PotentialModularityAndCompatibleSystems #1075, PotentialAutomorphyInfrastructure #1081, ModularityAndLanglandsExtensions #1180, SmoothRepresentationsOfLocalGroups #1688, IntegralHeckeAndGaloisDeterminants #1689; ReductiveGroupsPartII, EtaleCohomologyFoundations, ClassFieldTheory and Chebotarev on main): every cited section, layer and AG2 heading exists with a title matching the use (list in `scratch/suppliers`). 8 pinned Mathlib declarations and 2 Tau Ceti theorems verified at the cited file and line; `Module.finite_of_surjective_of_ker_le_nilradical`, `Ideal.finite_minimalPrimes_of_isNoetherianRing`, `IntermediateField.normalClosure`, `Ideal.primesOver`, `Group.IsSolvable`, `PrimeSpectrum`, `Ideal.comap` found at the pins. 214 source locators mapped to lines and printed pages (script `scratch/pages.py`); all agree with the README except those in R01–R03. 19 source-issue claims of the README re-read at the source lines and confirmed (listed under Source issues). About 60 Checks recomputed (table below). Depcheck: `moved: PotentialAutomorphyInfrastructurePartII moved in the merge order from #85 to #258, right after its last supplier PotentialAutomorphyInfrastructure (…); checked as moved` and `depcheck: 235 roadmaps, 2152 edges, 0 problem(s)`; no UPWARD or CYCLE line. Policy: no pull-request numbers, process words, `lemma`, `set_option` or machine paths in the README or the Lean file; the diff touches only the package folder. `roadmaps resolve`: no unresolved cross-roadmap citation; the three backticked names `ResidualImage.IsAdequate`, `IsGHTAdequate`, `IsEnormousCharZero` are declared in ArithmeticGaloisRepresentations' README at its head (lines 4882, 4886, 4990 of the dump).

Conventions verified against suppliers: LocalGaloisDeformationRings states `HT(ε)=+1` (its Conventions, dump line 38) and AutomorphicGaloisRepresentationsPartII states `HT(ε)=−1` and `χ_v(−1)=(−1)^{n+w}` (dump lines 245, 251, 705), as the README's Conventions and §0.3 say.

Ownership: Schur condition (defined here §2.1; LocalGaloisDeformationRings §F.1.5 and GlobalGaloisDeformations use "Schur" as a hypothesis, the latter in the sense `End = k`, and neither defines the `𝒢_n`-Schur condition of Tho15), weak and strong primitivity (nowhere else), the global ordinary-of-weight notion (PotentialAutomorphyInfrastructure §3.48 proves the local flag conclusion, §3.45 defines the unpolarized ordinarily automorphic notion; neither defines the global weight predicate) and genericity (imported from AG2.6) were searched by object in the sibling dumps. Ownership against open pull requests outside the list the brief gives was not checked.

Adversarial pass (values computed; "src" means the source line was read):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.1 definition vs Tho15 Def 2.5, NT26 Def 2.5(2) | exponent | both print `λ_{τ,n−i+1}+i−1` (Tho15 line 529–532, NT26 line 538) | agrees |
| §0.1 Check: Tate curve | `λ=(−1,−1)` | `HT={λ_1+1,λ_2}={0,−1}`; `ψ_1=ε_l` (`ψ_1·x^{λ_2}=ε_l(Art x)x^{−1}=1`), `ψ_2=1` | holds |
| §0.1 Check: supersingular | `D_cris(V_lE)` | slopes `−1/2,−1/2`, sum `−1` = slope of `D_cris(ε_l)` | holds |
| §0.1 API dual weight | `n`, `λ` | `μ_{τ,i}=−λ_{τ,n+1−i}−(n−1)` reproduces `HT(ρ^∨)=−HT(ρ)`; dominant | holds |
| §0.1 Check 5 | `n=2`, `λ_τ=(0,−1)` | `ρ^∨ε^{1−n}` weight `−λ_{τ,n+1−i}`: `(1,0)` | holds |
| §0.2 (1) vs Tho15 Lemma 2.3 | formula | identical (Tho15 line 419–421); CT14 Lemma 2.5(2) gives `val(α_j)=val(u^j/u^{j−1})−e^{−1}Σa_{τ,j}` | agrees |
| §0.2 Steinberg Check | `λ=0`, `St_n⊗ψ` | characters `ψ|·|^{(n−1)/2−(i−1)}`, valuations `f_v(i−1−(n−1)/2)`; (1) gives `e^{−1}[F_v:ℚ_l](i−1−(n−1)/2)` | agrees |
| §0.2 trivial-rep Check | `GL_n`, `0<j<n` | `[Iw α^j Iw : Iw]=q^{j(n−j)}`, weight factor `1` | not a unit, holds |
| §0.2 `GL₂(ℚ₃)` Check | `n-Ind(|·|^{1/2}⊗|·|^{−1/2})` | Jacquet module dim `2`; constituents get `δ_B` and `1`, dim `1` each | holds |
| §0.3 Check: parity | `n=1`, `w=1` | `(−1)^{n−1+w}χ_v(−1)=(−1)(−1)=+1` with printed sign; `−1` with corrected | holds |
| §0.3 Check: `H¹(E)` | split mult. | `H¹=V^∨≅Vε^{−1}`, `r^∨=r⊗ε`, multiplier `ε^{−1}=ε^{1−n}` | holds |
| §0.4 Check: ordinary `E` | `l≥3` | `H¹(E)|G_{ℚ_l}`: sub unramified, quotient `ε^{−1}·unr`; weight `(0,0)`: `ψ_2x^{λ_1+1}=x^{−1}x=1` | holds |
| §0.6 unit | weight `0`, `π_v=St⊗ψ_v` | `ω_π` finite order ⇒ `ψ_v(ϖ)^n` root of unity ⇒ `ι⁻¹ψ_v(ϖ)` unit | holds |
| §0.7 vs CT14 Lemma 2.6 (src line 245) | shifts | `π_i|·|^{(n_i−n)/2}`, `w_τ` depends on `v` only | agrees |
| §0.10 Check: `GL_1(ℂ)` | `(z/|z|)^k|z|^{it}` | `π^c=(z/|z|)^{−k}|z|^{it}`, `π^∨=(z/|z|)^{−k}|z|^{−it}`; equal iff `t=0`; parameters `(±k+it)/2` half-integral iff `t=0` | holds |
| §0.11 Check: `χ(c_v)` | transfer | `(θ∘V)(c_v)=θ(c_v²)=1` | holds |
| §1.1 Check: unramified, `H⁰(ad(1))=0` | `l≠p` | framed dim `n²+h¹−h⁰=n²+h²=n²` | holds |
| §1.2 Check: two components | `diag(1,q)`, `N≠0` | family `sN` on Steinberg component through `ρ_1`; `ρ_1` also unramified | holds |
| §1.3 Check: trivial of `GL_2` | `ψ⊕ψε` | `Hom(ψε,ψε)⊂H⁰(ad ρ(1))` nonzero | holds |
| §1.6 convention | `1⊕ε^{−1}` | weights `{0,1}` with `HT(ε)=−1` | holds |
| §2.1(3) | `char k≠2` | `H⁰(Δ,ad)=k^d`, `c` acts by `−1` | holds; `char 2` gives `k^d` |
| §2.1 Check: `n=2` characters | `k` finite | torsor `(k^×/k^{×2})²`, 4 classes; `µ(c)=−1` forced by symmetric line pairing | holds |
| §2.1(2) multiplier needed | induced `ρ` with self-twist `η` | `ρ^c≅ρ^∨⊗µ≅ρ^∨⊗µη` | multiplier not determined by trace; hypothesis needed (src Tho15 line 591 omits it) |
| §3.1 even degree | `L/L⁺` finite-unramified | `δ(−1)=∏_{v|∞}(−1)=(−1)^{[L⁺:ℚ]}=1` | holds (ANT20 line 622 same) |
| §3.1 Check: `L⁺=ℚ`, `n=2` | product formula | `(n/2)[L⁺:ℚ]=1` odd ⇒ no form | holds |
| §3.1 Tho12 hypothesis | src line 1349 | "4 divides n[L⁺:ℚ]" | agrees |
| §3.2 Check: cokernel | `0→M→M→M/ϖ→0` | coker `=H¹(Γ_j,M)[ϖ]`; `Γ=ℤ/l` on `I`: `I^Γ=0`, `N=Σg∈(I⊗k)^Γ` | holds |
| §3.3 Check: `T_{w^c}^j` | `ι_{w^c}=ᵗ(ι_w)^{−c}` | image `ϖ^{−1}diag(1_j,ϖ1_{n−j})` ⇒ `(T_w^n)^{−1}T_w^{n−j}` | holds |
| §3.6 (i) | Tho12 Thm 6.5(i), src line 1541 | prints `(r_l(π_v∘ι_w^{−1}))^{ss}` with `v∉S_l` only | corrected form as README says |
| §3.7 Check: scalar conjugation | `a=2`, `A=I`, `b=1` | `(aI,1)(A,b)j(aI,1)^{−1}=(a²A,b)j=(4I,1)j` | holds |
| §3.8 normalization vs PAI §3.44 | exponent | `∏_τ∏_{i≤j}τ(ϖ)^{−λ_{τ,n−i+1}}` both | agrees |
| §3.9 twist vs Tho12 Def 8.3 (src line 1993–2001) | `u↦∏τ(u_i)^{1−i}⟨u⟩` | identical; `n=2`: `τ(u_2)^{−1}⟨u⟩` | agrees |
| §3.10 generator | `𝔽₇`, `q=2`, `det=1` | `X²−T¹X+qT²` ⇒ `2T²=1`, `T²=4`; printed `q^{+1}` gives `T²=2`, `det=4` | README right; NT21 line 3893 wrong |
| §3.11 Check: `Λ_{b₀}` dimension | rank of `T(l)` | `n[L⁺:ℚ]`, Krull dim `1+n[L⁺:ℚ]` | holds |
| §3.12(2) arithmetic prime | `n=1`, `λ=(a)` | `u↦u^{1−1−a}=u^{−a}` | holds |
| §3.12 Check: `ℤ₅[ζ₅]` | `ϖ=ζ₅−1` | `1≡ζ₅ mod λ`, not mod `λ²` | holds |
| §3.13 Check: `λ=0` characters | `i=1..n` | `ψ_i(Art x)=x^{1−i}` ⇒ `1,ε^{−1},…,ε^{1−n}` | holds |
| §4.1 Check: GGD §8.5 vs block | `n=2`, `p=5`, `q=11` | inertia `(1+ε)I` ramifies `s`-block | excluded, holds |
| §4.3 generator count | Tho12 Prop 4.4 / Tho17 Prop 7.1 (src lines 688–700, 1375–1392) | `#Q−Σ_{v|l}[F⁺_v:ℚ_l]n(n−1)/2−nΣ_{v|∞}(1+χ(c_v))/2`; Tho17 requires `ζ_l∉F` | agrees |
| §4.4 formulas | Tho17 Prop 2.21 (src line 597–606) | `q=h¹−1`, `g=q+|T|−1−[F⁺:ℚ]n(n−1)/2`; prints `µ(c_v)` | agrees; misprint confirmed |
| §4.4 Check: `p=2` | `(1_n,1)j`, `(Ψ_2,1)j` | `X+ᵗX` alternating, `1∉` image; `Ψ_2`: `(a+d)I∋I` | holds |
| §4.5 dimension count | `R_∞`, `S_∞` | `dim R^loc=1+n²#T+[L⁺:ℚ]n(n−1)/2`; `g=q−q₀`; `dim R_∞=1+n²#T+q−[L⁺:ℚ]n(1−(−1)^{µ−n})/2` | agrees |
| §4.5 Check: parity drop | `n=1`, `[L⁺:ℚ]=2` | drop `2·1·(1+1)/2=2` | holds |
| §5.1 vs Tho12 Thm 7.1 (src line 1784–1812) | hypotheses (i)–(vi) | `l` odd, `ζ_l∉F`, adequate on `G_{F(ζ_l)}`, `⇝` at `v∤l`, `∼` at `v|l` | agrees |
| §5.2 Check | `σ(c_v)=(1 1;0 1)`, `J^{−1}=(0 1;1 0)` | `A=(1 1;1 0)`, diagonal `(1,0)` not alternating; `σ(c_v)=1` gives `Ψ_2` | holds |
| §5.3 vs Tho17 Thm 5.1 (src line 997–1012) | (i)–(v) | identical | agrees |
| §5.4 | `H¹(H,k)=0` | `0→H¹(H,ad)→H¹(H,ad₀)` | GHT ⇒ relaxed holds |
| §5.6 Check: `κ=1`, `n=1` | pairing sign | `ν=δ²=1`, `⟨x,y⟩=−⟨y,x⟩` on a line ⇒ `0` | holds |
| §5.8 bound | `µ(c_v)=−1` | `1+[F⁺:ℚ]n(n−1)/2−[F⁺:ℚ]n(n−1)/2−h⁰=1−h⁰`; BG19 line 1782 confirms `H⁰` is needed | holds |
| §6.1(1) pairing | twist | `H^{N−2}×H^{N−2}→ℤ(2−N)`; `2(N−1−n)/2+2−N=1−n`; BLGHT11 line 1019 prints the same | agrees |
| §6.1(5)(b) Check | `n=2`, `N=5`, `q=11` | `det V=ε^{−3}`: `11³=1331`; roots `±11,±121`; twisted roots `±1,±11` product `11`; BLGHT11 line 1271–1273 prints the twisted polynomial for `V_{λ,t}` | README right; source error |
| §6.1(7) Check | `m=2`, `l=3`, `N=5` | order of `3` mod `5` is `4` | holds |
| §6.3 weights | `ψψ^c=ε^{1−2n}µ^{−1}` | `b_τ+b_{τc}=2n−1−w` | holds |
| §6.5 vs BLGGT14 Thm 4.2.1 (src line 2389–2402) | (1)–(3) | identical, incl. `l≥2(d+1)`, `ζ_l∉F` | agrees |
| §7.2 | `χ_i|Γ′=χ_j|Γ′` | order of `χ_i/χ_j` divides `[Γ:Γ′]≤n` | holds (NT21 line 3277–3280 same) |
| §7.3 | `n<p`, `d=[Γ:H]` | `[Γ:N]|d!` invertible; `Ind τ^{ss}` semisimple ⇒ `≅ρ` | holds; `𝔽₂`, `C₂` has `n=p` |
| §7.4 | `p∤n` | `ker ρ` unipotent `p`-group, orbits on `Γ/H` of equal `p`-power size dividing `n` ⇒ points | holds |
| §7.12 | reduction of block-split self-dual lattice | Schur for multiplicity-free data depends only on pairs `(i≠j)` ⇒ new reduction Schur ⇒ semisimple ⇒ `≅ρ̄`; midpoint in common apartment of block-adapted splitting bases, weights in `½ℤ`, `T=u²` | holds |
| §7.15 Check | `S₃` over `𝔽₅`, `𝔽₂₅` | `𝔽₅^×` has no element of order `3`; `3|24` | holds |
| §7.19 vs ANT20 Thm 4.1 (src line 684–692) | (1)–(6) | identical with weak primitivity over `k` | agrees |
| §8.5 bounds | ANT20 proof lines 786–791 | `dim R/(Q₁,Q₂,J_R)≥nD−|R|n(n+1)−2` then Lemma 3.9 needs `dim A/(λ)` (line 606); one dimension uncharged | README's `+3` justified |
| §8.5 Check | `n=2`, `|R|=1` | `|R|n(n+1)+3=9` | holds |
| §8.7–8.8 vs ANT20 Thms 6.1–6.2 (src lines 804–911) | hypotheses | identical up to strong/weak primitivity | agrees |
| §8.9 vs Tho15 Thm 7.1 (src lines 3181–3206) | (1)–(9) | identical | agrees |
| §8.11 Check | `n=2`, `w=1` | `w−{1,0}={0,1}`; `w=3` gives `{2,3}` | holds |
| §8.12 Check | `n=p=2` | `tr Φ²=(tr Φ)²−2det=0` | holds |
| §9.1 Check | `(1⊕|·|,0)` | `|·|→1(1)` isomorphism, Hom dim `1` | holds |
| §9.2 Check | unramified `(1,q)` | `α_2=qα_1` | not generic, holds |
| §9.3 Check 3 | odd `r` | `dim(ad ρ)^{c_v}=n(n−1)/2`, `h¹≥[F⁺:ℚ]n(n+1)/2` | holds |
| §9.4 Check 3 | weight `0` semistable | slopes `0` ⇒ `N=0` ⇒ unramified ≠ `ω` | holds |
| §9.5 Check 3 | `F=ℚ`, `S={p}` | `H¹=Hom(1+pℤ_p,O/ϖ^m)≅O/ϖ^m`; `H¹_𝓔=0` | holds |
| §10.1 | `κ_µ`, `δ` | `dim R_∞=1+A+f+aκ_µ+b−f−Ndδ−aκ_µ=1+A+b−Ndδ`; `N=2,d=1`, `µ` odd: `χ(c_v)=+1`, term `3` | agrees |
| §10.3 Check | `y²=x³+3x+2/𝔽₅`, `ℓ=7`, `N=3` | `#E=5`, `X²−X+5≡(X−2)(X+1)`, `α/β=2·6=12≡5=q`; printed set `{4,1,2}`; LTXZZ line 1755 prints same-parity exponents only | README right; source error |
| §10.4 | `n=3`, `λ^s=(2,1,0)` | `λ^c=(−2,−3,−4)`, `λ^c+η=(0,−2,−4)=−rev(4,2,0)` | holds |

## Not verifiable

- Ger19's published numbering ("published Lemma 5.9 is the preprint Lemma 5.2.1", "published Lemma 5.6", "Lemma 2.25 of the published numbering"): the published Mathematische Annalen version is paywalled; the preprint numbering, which the README says it uses, was checked.
- NT23's "earlier numbering" cited by NT21B and NT26 (§9.8 Check 2): only arXiv v3 is cached.
- Labesse's Théorème 5.4 and Corollaire 5.3 (§3.5) are cited through Ger19 and CT14; Labesse's text is not in the cache.
- Sk13 was checked only for Remark 3.2 (page 519, line 205); the geometric step of §7.12 (midpoint of a norm and its dual in the building) was checked by hand, not against a source statement.
- Ownership against open pull requests whose files the brief does not list was not checked.

## Source issues

- **Misprint** in Tho17 at Proposition 2.21(i), printed page 14 (line 599): the source writes the multiplier as `µ(c_v)` although the problem's multiplier is named `χ`; it should be `χ(c_v) = −1`; affects nothing.
- **Misprint** in Tho15 at Proposition 4.4, items 1(c) and 2(c), printed page 37 (lines 1817, 1823): the source composes `π_w` with `ι_w^{−1}` to describe a representation of `G(L⁺_v)`; it should compose with `ι_w`; affects nothing.
- **Error** in Tho15 at Lemma 3.36, printed page 28 (line 1326): the source splits the universal ring as the fixed-Teichmüller-determinant quotient tensored with the anticyclotomic Iwasawa algebra; a Teichmüller determinant has finite-order conjugate norm, so that quotient is killed by a power of `ϖ` whenever `µ^n` has infinite order, and the lift of `det r̄` must be chosen with `d₀d₀^c = µ^n`; affects a stated result.
- **Error** in Tho15 at Lemma 3.3(2), printed page 13 (line 591): the source concludes `GL_n`-conjugacy of two Schur homomorphisms from equal traces on `Δ` alone; the multipliers must also agree, since an induced constituent with a self-twist admits two multipliers with the same trace; affects a stated result.
- **Gap** in Tho15 at Proposition 5.3, printed page 58 (lines 2849–2851): the hypothesis is primitivity (not induced) but the proof contradicts only the semisimplified induction, and it asserts that enlarging the coefficient field does not affect the hypotheses, although primitivity can fail after a finite extension of the residue field (the `S₃` standard representation over `𝔽₅` and `𝔽₂₅`); affects the proof. The same gap is inherited by ANT20 Theorem 4.1 (line 689) through its citation of this proposition.
- **Error** in Tho12 at Theorem 6.5(i), printed page 35 (line 1541): the source identifies the semisimplified local Galois representation at a split place with `r_l(π_v ∘ ι_w^{−1})` without the dual and the twist by `(1 − n)`, and excludes only the places above `l`; it should read `(r_l(π_v ∘ ι_w^{−1})^∨(1 − n))^{ss}` for `v ∉ S_l ∪ R`; affects a stated result.
- **Misprint** in NT26 at Definition 2.5(1), printed page 11 (line 512): the source applies `ι` to the value of a complex character; it should apply `ι^{−1}`; affects nothing.
- **Misprint** in NT21 at the set-up of §5 before Theorem 5.7, printed page 72 (line 3554): the source writes the `𝒢_n`-valued extension of `⊕χ_i` with domain `G_{F,S}`; it should be `G_{F⁺,S}`; affects nothing.
- **Misprint** in NT21 at Corollary 5.4, printed page 70 (line 3458): the source writes the lift with domain `G_{F⁺,S}` although it is of Steinberg type at the places of `Σ`; it should be `G_{F⁺,S∪Σ}`; affects nothing.
- **Error** in NT21 at the definition of `𝔪_D`, printed page 79 (lines 3892–3893): the source generates the ideal by `T_w^j − q_w^{j(j−1)/2} tr ∧^j r̄(Frob_w)`; the Hecke polynomial forces `q_w^{−j(j−1)/2}` (for `n = 2`, `q_w = 2`, `det = 1` over `𝔽₇` the printed sign gives determinant `4`); affects a stated result.
- **Error** in LTXZZ at the proof of Proposition 4.1.1, printed page 36 (line 1755): the source tests only the ratios `(α/β)^{N−1}, (α/β)^{N−3}, …, (α/β)^{1−N}` against `q`; the eigenvalue ratios of `Sym^{N−1}` are all `(α/β)^j` with `|j| ≤ N − 1`, and `y² = x³ + 3x + 2` over `𝔽₅` with `ℓ = 7`, `N = 3` passes the printed test while having a ramified lift; affects the proof.
- **Error** in BLGHT11 at Lemma 5.1(2), printed page 34 (lines 1271–1273): the source gives the Frobenius characteristic polynomial `∏(X − α q^i)` for `V_{λ,t}` itself; with the pairing of Lemma 4.1 (line 1019) that polynomial belongs to the twist `V_{λ,t}((N−1−n)/2)`, and `V_{λ,t}` has roots `α q^{(N−1−n)/2+i}`; affects a stated result.
- **Gap** in ANT20 at the proof of Theorem 5.1, printed page 16 (lines 788–791): the source applies Lemma 3.9 to `R/(Q₁, Q₂, J_R)` with the bound `n[L⁺:ℚ] − |R|n(n+1) − 2`, but Lemma 3.9 (line 606) needs the dimension of the special fibre, which can be one less; hypothesis (4) should read `d_{L,0}, d_{L,l} > |R|n(n+1) + 3`; affects the proof.
- **Gap** in ANT20 at Lemma 3.8, printed page 12 (line 586): the source states the lemma for every `A ∈ C_Λ`, but its ideals live in `Λ/(λ)`, so the conclusion `I_iA = 0` is meaningful only for `A` killed by `λ`, which is how it is used; affects nothing.
- **Gap** in BLGGT14 at Proposition 1.5.1(2), printed page 30 (line 1374): the source bounds the Krull dimension below by `1` assuming only `r̆` absolutely irreducible, odd multiplier and distinct weights; the presentation count also needs `H⁰(G_{F⁺,S}, ad r̄(1)) = 0`, which holds when `r̄|G_{F(ζ_l)}` is absolutely irreducible and `ζ_l ∉ F` (BG19, Corollary 5.1.1, line 1782); affects the proof.
- **Misprint** in BCG25 at the proof of Theorem 3.1, printed page 10 (line 443): the source cites "[Tho17, Thm. 7.1]", which does not exist; the intended result is Tho17 Corollary 7.3 (Thorne 2012's Theorem 7.1 with GHT-adequacy); affects nothing.
- **Misprint** in NT26 at the proof of Proposition 6.1, printed page 46 (line 2170): the source cites BLGGT14 Lemma 1.4.1 for potential diagonalizability in the Fontaine–Laffaille range; the intended reference is Lemma 1.4.3(2); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6b4e6a1e81bebe1f9726ea69fb6da2b3b3f6a757", "job": "RT-PotentialAutomorphyInfrastructurePartII~1b", "model": "fable", "worker": "chris-f"} -->
