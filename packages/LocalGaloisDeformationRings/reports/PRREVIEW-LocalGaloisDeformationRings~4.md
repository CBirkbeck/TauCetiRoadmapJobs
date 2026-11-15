# Review of LocalGaloisDeformationRings (pull request #923 at e8e7f63)

**Verdict:** needs changes

Ten P3 findings, none blocking. The gate passes at this head.

## Previous findings

- R01 (4.9 type convention) — repaired: `README.md:2626` "so on the generic fibre `v_ψ` is the rank of `im φ/E_K(u)𝔐` at `ψ` and the cokernel of `φ` has rank `d − v_ψ` there", with rank 2 at the roots of `Q`.
- R02 (own backticked API names) — repaired: `README.md:696` "For `f,g : R_D → A` in `C_𝒪`, `f=g` iff `f_*ρ_D` and `g_*ρ_D` have the same strict class"; the only dotted or underscored names left are the nine declarations, library declarations and supplier names (each resolved, see the counts).
- R03 (unnumbered subsection) — repaired: `README.md:1182` "### 0.2.1 The ordinary flag predicate and its elementary API", `1184` "Define the following common predicate"; 1230, 1382 and 1394 cite 0.2.1.
- R04 (description's supplier paragraph) — partly repaired: the section list now matches the head except for one supplier, written again in R10.
- R05 (description's validation sentence) — partly repaired: the sentence is gone, but the summary block still names three Lean identifiers the head does not have (R10).

## R01 (P3) — Downstream consumers cites four identifiers that exist nowhere, and lists a supplier as a consumer

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:3907` "`PotentialAutomorphyInfrastructure:PA.3` and `PotentialModularityAndCompatibleSystems:R24.2` consume … `GL2ModularityLifting:R32` consumes … `PadicLocalLanglandsForGL2Qp:R30.5` consumes the local block/type-ring interface of 3.8."

**Claim:** These four targets exist and consume this roadmap; PadicLocalLanglandsForGL2Qp is downstream of 3.8.

**Witness:** At their open heads none of `PA.3`, `R24.2`, `R32`, `R30.5` occurs (the four roadmaps number by Layer and §). PadicLocalLanglandsForGL2Qp is a supplier (`README.md:68`); its line 2440 lists this roadmap's §§3.7.1–3.8 as consumer of its §§5.1–5.6, 5.12.

**Repair:** Replace by: "`PotentialAutomorphyInfrastructure` (supplier contracts for §1.6 and §§1.12–1.13, 3.7, 6.24, 7.4–7.6) and `PotentialModularityAndCompatibleSystems` (§§1.3, 1.6, 1.9, 1.13 and Layers 2–8) consume local component and nonemptiness results. `GL2ModularityLifting` (its contract *From LocalGaloisDeformationRings*) consumes the KW conditions of Layer 8." Delete the PadicLocalLanglandsForGL2Qp sentence.

## R02 (P3) — 2.19 counts four cases and states the hypotheses of three

**Location:** `README.md:1984` "the four ramified obstructed rank-two cases below give two group-algebra power-series rings and two hypersurfaces"; `1989` "In the two ramified-extension cases, `R_v≅𝒪[[x₁,x₂,x₃,x₄]]/(r)`".

**Claim:** Each of the four cases is specified.

**Witness:** Only the `q≡1` extension of 1 by 1 is given hypotheses. The cited proof (CG18 line 2285–2288, arXiv v2) lists three non-smooth cases: `q≡1` diagonal, `q≡−1` induced, `q≡1` with one-dimensional inertia invariants.

**Repair:** After "two hypersurfaces" add the list: "(i) `q≡1 mod p`, `ρ̄|I_v≅χ̄⊕1` with `χ̄` ramified; (ii) `q≡−1 mod p`, `ρ̄` absolutely irreducible and induced from the unramified quadratic extension; (iii) `q≡1 mod p`, nonsplit extension of 1 by 1 with ramified class; (iv) `q≡−1 mod p`, nonsplit ramified extension of 1 by `ε̄`, where `ε̄²=1` gives `H⁰(ad⁰ρ̄(1))≠0`", and say that (iv) is not among the cases of the cited proof. Tested on (iv): `dim Z¹(ad⁰)=3−h⁰+h¹=4`, `h²=1`, one relation.

## R03 (P3) — 2.19 Check gives a condition for the failure of discrete formal smoothness that plays no part

**Location:** `README.md:1995` "in the discrete-topology sense (Mathlib's `Algebra.FormallySmooth`) it fails whenever `Ω_{E/ℚ}` is infinite-dimensional, for example `E=ℚ_p`."

**Claim:** Discrete formal smoothness of `E[[X]]` over `E` fails because `Ω_{E/ℚ}` is large.

**Witness:** `E=ℚ̄`, `Ω_{E/ℚ}=0`: `Ω_{E[[X]]/E}⊗E` is spanned by `dX` (rank ≤ 1), `Ω_{E[[X]]/E}⊗E((X))=Ω_{E((X))/E}` has infinite rank, so the module is not free, hence not projective; formal smoothness fails.

**Repair:** Replace the clause by: "in the discrete-topology sense (Mathlib's `Algebra.FormallySmooth`) it fails for every characteristic-zero field `E`: `Ω_{E[[X]]/E}` has fibre rank one at `X=0` and infinite generic rank, so it is not projective."

## R04 (P3) — Equation labels of a source used as names without a definition

**Location:** `README.md:3610` "`R̃^{det,ord}_v`, the quotient by (6.2.7)–(6.2.8)." (also 3612, 3613, 3615, 3620, 3621); `README.md:3379` "### 6.28 Explicit rings `R^{expl,∇}` and the comparison diagram (3.9)".

**Claim:** `(6.2.7)`, `(6.2.8)` and `(3.9)` name objects of this roadmap.

**Witness:** No equation or diagram of the README carries these labels; 7.1 states the two families in prose without numbers (`README.md:3604`). They are the numbering of ACC+ §6.2.6 and of LLHLM20.

**Repair:** In 7.1 write "the characteristic-polynomial equations" for (6.2.7) and "the ordered-product equations" for (6.2.8) in the six places; retitle 6.28 "Explicit rings `R^{expl,∇}` and the gauge-chart comparison diagram", with the locator "([LLHLM20], diagram (3.9))" in the Sources line.

## R05 (P3) — Page of KW II Theorem 3.1

**Location:** `README.md:3885` "(Sources: [KW209], Theorem 3.1, p. 19.)"

**Claim:** Theorem 3.1 is on p. 19 of the author copy.

**Witness:** KW209 line 842: the statement opens on printed p. 18 (the archimedean, `p`-adic and semistable bullets) and ends on p. 19 (line 857–862). `README.md:3799` already has "Theorem 3.1 and §3.3, pp. 18–19".

**Repair:** "(Sources: [KW209], Theorem 3.1, pp. 18–19.)"

## R06 (P3) — A supplier cited without a section and absent from the supplier contracts

**Location:** `README.md:2129` "`ReductiveGroupsPartII`, compact subgroups;"

**Claim:** 2.26.1 consumes ReductiveGroupsPartII.

**Witness:** No section is named; `## Exact supplier contracts` (`README.md:43–73`) and the scope section do not mention ReductiveGroupsPartII. On main its layers are RG2.0–RG2.5 (`TauCetiRoadmap/ReductiveGroupsPartII/README.md:729` "RG2.0.3 integral points and congruence subgroups").

**Repair:** Cite the section meant ("`ReductiveGroupsPartII`, RG2.0.3, compact open subgroups of `D×` and `GL_d(𝒪_K)`", if that is the input) and add a contract bullet saying what 2.26.1 assumes of it; or drop the item if SR.0 already supplies the compact open subgroups used.

## R07 (P3) — The coefficient prime is written `l` in 1.6 and 6.4

**Location:** `README.md:1371` "The crystalline character `ε^{−(l−1)}` has filtration jump `l−1`"; `1372` "For `l≥3`, `r̄=ε⁻¹⊕ε⁻¹`"; `2928` "### 6.4 Discrete series deformations away from `l` (CHT §2.4.5)".

**Claim:** `l` is a symbol of this roadmap.

**Witness:** `README.md:29` fixes "the coefficient prime `p`"; 1.6 itself has "filtration in `[0,p−2]`" (`README.md:1351`). `l` is CHT08's letter and is defined nowhere here.

**Repair:** Write `ε^{−(p−1)}`, "jump `p−1`", "`Fil^{p−1}M=0`", "`−(p−1)`" and "For `p≥3`" in the two Checks, and "away from `p`" in the 6.4 heading (updating the links to its anchor).

## R08 (P3) — Code spans around the article "a", and a malformed ClassFieldTheory citation

**Location:** `README.md:217` "equivalent to factoring through `a` finite quotient of `G`" (also 259, 280, 293, 352, 470 "`A` determinant law", 667, 887, 895, 899, 1040); `README.md:1329` "ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors" (also 1553, 1600, 1954, 2068, 3193, 3258, 3375, 3432).

**Claim:** House style: code spans hold mathematics; a citation names the roadmap and its layer.

**Witness:** In the eleven lines the span holds the English article. The nine `*Needs:*` items are a lower-cased heading slug; the same supplier is "`ClassFieldTheory`, Layer 7" at `README.md:58` and 1202.

**Repair:** Remove the backticks around the article in the eleven lines; write "`ClassFieldTheory`, Layer 7 (local Artin map and its normalization)" in the nine.

## R09 (P3) — `Suggested.lean` sections are not in README order

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRings/Suggested.lean:75` "/-! ### Layer 8: the completed node (8.4) -/" precedes `:93` "/-! ### Layer 7: determinant-ordinary equations and ordered flags (7.4) -/".

**Claim:** Section comments follow the README's layer order.

**Witness:** README has Layer 7 at line 3598 and Layer 8 at 3684.

**Repair:** Move the `DeterminantOrdinary` section (lines 93–127) above line 75, so the order is Layers 1 and 8 (quadric), Layer 7, Layer 8 (node); nothing else changes. Tested on a scratch copy in that order: the same three `sorry` warnings and no other message.

## R10 (P3) — The pull request description names Lean identifiers the head lacks and omits a supplier

**Location:** description, summary block: "the `UniversalDeformation` pair with `hom_ext` and `mapOfLE`"; supplier paragraph: "On main, the README uses SchemeAndStackFoundations … and the completed LocalGaloisGroups (Layers 3 and 7) and LocalFieldsRamification".

**Claim:** Consumers use declarations of those names; the list of on-main suppliers is complete.

**Witness:** `UniversalDeformation`, `hom_ext`, `mapOfLE` occur nowhere in the README or `Suggested.lean` at this head (F.2.5 states the facts in prose, `README.md:694–708`). `README.md:2129` cites `ReductiveGroupsPartII`, which the paragraph does not list.

**Repair:** In the summary block write "the universal deformation pairs of F.2.5, with their extensionality and inclusion maps". After R06, add "ReductiveGroupsPartII RG2.0.3" to the on-main list, or nothing if R06 drops the citation.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.15 coefficient rings `Λ` | `κ=k`, `κ=L`, `κ=k((t))` | BIP23 line 1307–1317: unramified `𝒪_{L′}`; `κ`; `p`-adic completion of `𝒪_{L′}[[t]][1/t]`, a DVR with residue `κ`. README the same three. | Pass. |
| 1.19 character ring | `K=ℚ_p` odd `p`; `μ_p⊂K` | `K×` pro-`p` part `μ_{p∞}(K)×ℤ_p^{[K:ℚ_p]+1}`: `𝒪[[X,Y]]`; `𝒪[μ_p]` has `p` components. BIP23 line 1850–1857 agrees. | Pass. |
| 1.24 `𝒳`, `φ_d` | `d=p`; `p∤d` | `y↦(1+y)^d−1`: `y^p` mod `ϖ` (Frobenius); isomorphism for `p∤d`; `f+1` variables. BIP23 line 2436–2471. | Pass. |
| 2.19 component count | `p=3`, `q=7` | `p^a=3`; `ζ∈μ_3`: `T=2` and `T=−1`; `(3+1)/2=2`. | Pass; hypotheses R02, Check R03. |
| 2.20 rigidity | `q=2`, `p=5`, `Φ≡I` | `(1−q)X=−X`, a unit multiple, so `X=0` at each step of the filtration. LTXZZ line 5623–5632: four clauses. | Pass. |
| 3.5 family quotients | ramified quadratic over `ℚ₃`; `T_{s_m}=(1+p)^{(p−1)p^m}−1` | `A^{st,[0,0]}=0`, `A^{pcrys,τ}=A`; `T_{s_m}→0` distinct, so `J=0`; `s=1/2` not Hodge–Tate. Published (2.7.5)–(2.7.7), KisinPSTPub line 1073–1108. | Pass. |
| 4.9 Check (previous R01) | `E_K=PQ`, `φ=P·I₂` | `im φ/E𝔐=P𝔐/PQ𝔐≅(𝔖/Q)²`: `v=2` at roots of `Q`; cokernel rank `d−v`. | Pass. |
| 5.9 cocycle rank | finite `A` | `|Z¹(A(χ_p))|=|A|·|H⁰(A)|=|A|²` (KW209 line 1783). | Pass. |
| 6.10 partition rings | `q=11`, `p=5`, `Φ=I` | `q(tr)²=44`, `(1+q)²det=144`. `{1,q,q²,b}`: chains `(3,1)`, not `(2,2)`. | Pass. |
| 6.29 `GSp₄` incidence | `ad⁰=𝔰𝔭₄`; `p=2` | Root heights `1,1,2,3`: `6,4,2,1,0`; `𝒪[(ℤ/2)²]`: 4 components. BCGP25 line 6433–6485. | Pass. |
| 6.30 patching axioms | Definition 3.5.1 | Four axioms, support dimension `d` with `d+1=dim X∞(τ)`; README "`dim R∞(τ)−1`". LLHLM20 line 1249–1263, 1275–1289. | Pass. |
| 6.35 one component | standing hypothesis | BCGP25 line 6560 "`p>2`" for the rest of §6.2; Lemma 6.2.5 dimension 16, 6.2.6 surjectivity hypothesis. | Pass. |
| 6.7 / 6.18 eigenvalue ring | `det Φ=1`, `α=1+β`; mod `(β,a,φ₂+φ₃,b+c+φ₁)` | `(1+β)²−(2+t)(1+β)+1=β²−tβ−t`. Quadrics become `b²,c²,φ₂²,bc,bφ₂,cφ₂`: quotient `k[x,y,z]/(x,y,z)²`, socle 3. | Pass. |
| 7.1 Checks | `ℤ/9`, `M=diag(4,7)`, `U=I+E₁₂`; scalar `I` | `(X−4)(X−7)=X²−2X+1`; `(M−I)(U−I)=3E₁₂≠0`. `(1−4^i)(1−7^j)≡0 mod 9`; `B⁻¹IB=I` has diagonal 1, not 4. | Pass. |
| 7.4 / `det_ordinary_iff_ordered_triangularization` | `n=0,1,2,3`; char `p≤n`; reversed order | `W_{k−1}=ΣN_k(g)W_k` stable; `Σ(d_i−1)χ_i=0` and Dedekind give `d_i≡1`, `d_i≥1`, `Σd_i=n`, so `d_i=1`. Reversed: `diag(1,0)·E₁₂≠0`. ACC+ line 5666–5684. | Pass. |
| 8.4 / `completedNode_isDomain_flat` | `A=ℤ_(3)`, `π=3`; `π=0`; `π=u=1` | `(XY−c)Â[[X,Y]]∩A[[X,Y]]=(XY−c)A[[X,Y]]` by induction on coefficients; `Â`-quotient normal (`A_{k−1}` point). `π=0`: `XY=0`. `π=u=1`: unit. KW209 line 1142. | Pass. |
| 1.14, 8.7 / `oddRealRing_geometry` | `(1,0,0)`, `(1,1,0)` at residue characteristic 2; odd residue characteristic | `X²+2X+YZ`; `X²+2X+YZ+Z`. Singular locus of the quadric: one closed point, codimension 3, so normal; dimension `4−1=3`, generic fibre 2. KW209 line 899–909. | Pass. |
| 8.10 crystalline lift | Lemma 7.2 bullets | FKP22 line 1518–1520 (p. 34): `F=ℚ`, `r=k(ρ̄)`, weights `{0,r−1}`; ordinary choice line 1563–1564. | Pass. |
| 8.17 completed product | `ℚ`, `S={∞,p}` | `2+4=6=3|S|`; KW209 line 877–884. | Pass. |
| F.2.5 hull-only Check | `A=k[t]/(t³)`, `M=I+tE₁₂` | `(I+tE₁₁)M(I+tE₁₁)⁻¹=I+(t+t²)E₁₂`; in the fibre product `[X,E₁₂]` would be `0` and `E₁₂`. | Pass. |
| F.1.5 nonlocal Check | `a=[[2,5],[5,12]]` | `det a=−1`, `a≡2I mod 5`, `±2≢1`; `13·2≡1 mod 25`. | Pass. |

- Source locators checked against the text: 44, in 12 sources (BIP23 6, LLHLM20 9, Gee22 12, KW209 5, BCGP25 4, KisinPST 3 in the published text, one each in CG18, LTXZZ, FKP22, ACC+, TUNG21); one wrong (R05).
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): 24, all present under the cited names and modules, e.g. `TauCeti/RingTheory/Henselian/Basic.lean:89, 96`, `TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean:253–269`, `TauCeti/RingTheory/Node/` (polynomial node only, no power-series node), `Mathlib/RingTheory/RegularLocalRing/Defs.lean:93`.
- Cross-roadmap citations resolved at main or the open head: 45 supplier sections and names (PadicLocalLanglandsForGL2Qp §§0.4, 5.4, 5.12, 6.9; DeformationAndDerivedPatchingAlgebra §§1.8, 1.9, 1.12, 2.7, 3.9, 4.6, 6.7; the others of the supplier contracts); 4 consumer identifiers do not resolve (R01).
- Gate at `e8e7f63`: every counter zero, build passes. Dependency check: `depcheck: 245 roadmaps, 2221 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: three `declaration uses 'sorry'` warnings (lines 64, 88, 121), nothing else. `#check @name` on the nine declarations: no binder lost; types equal the README statements of 1.14, 8.4 and 7.4.
- Padding probe: `simp`, `rfl`, `infer_instance`, `tauto`, `decide`, `trivial` close none of the three theorems. Headlines: the three stated; the docstring names the others as not statable with their missing carriers.
- Sections read in full this round: 76 of the numbered sections (Layer F, Layer 0, 1.1–1.7, 1.11, 1.14–1.15, 1.19, 1.24, 2.1–2.6, 2.14, 2.19–2.20, 3.5, 4.9, 4.11, 5.2, 5.9, 5.14, 6.7, 6.10, 6.18, 6.29–6.30, 6.35, Layer 7, 8.4, 8.7, 8.10, 8.17–8.19); the others were covered by the gate, the resolver and the text searches only.
- Overlap check: read PotentialAutomorphyInfrastructurePartII, GlobalGaloisDeformations, PadicLocalLanglandsForGL2Qp, GL2ModularityLifting, SmoothRepresentationsOfLocalGroups; generic lifting functors and representing pairs: PadicLocalLanglandsForGL2Qp §0.4 (cited); presentations: DeformationAndDerivedPatchingAlgebra (cited); nothing else shared. No `Suggested.lean` at a readable head declares one of the nine names.

Source independence: 21 passages compared with 12 sources, none shared (longest common run 7 words, a forced hypothesis list, BIP23 line 1318); largest share Gee22, 34 of 389 locators (KW209 33); contents compared with Gee22 §3 (3.1–3.30) and KW209 §3: independent (Layer F places restriction and fixed determinant before representability, Layer 8 interleaves four other sources).

## Not verifiable

- KisinFlat (4.11) and Kisin2adic (5.2): the author DVI files are not read by the sources service and the published texts are behind a paywall or not found; statements checked for internal consistency only.
- CT17 (6.10): the Cambridge host failed TLS verification twice.
- KisinPST author-DVI page numbers: the published article was read instead; its numbering (2.7.5)–(2.7.7), (2.5.5) agrees.
- CG18 journal pages (pp. 335–365) and the published form of Lemma 4.11: only arXiv v2 was readable; whether the published proof lists a fourth case is not known (R02 asks for the hypotheses either way).

## Source issues

- **Misprint** in LTXZZ at Definition 6.3.4, clause (4), arXiv v3 p. 115: the source says the unbarred homomorphism at the place is unramified; it should be the residual homomorphism `r̄_v`, as in clauses (1)–(3); affects nothing.

## For the human reviewers

- **Licence.** `README.md:690` says the representing-pair interface "follows the Imperial College London FLT project", a public Lean formalisation; no declaration of `Suggested.lean` carries its names. Its licence was not read.
- **Licence.** The [Geraghty] reference links a CiteSeerX copy of the 2010 preprint, a host the sources service places in no licence class; [KisinNotes] and [Conrad] are author manuscripts.
- **Not tested.** KisinFlat, Kisin2adic and CT17 (14, 10 and 3 locators) could not be read: wording and locators of the sections citing them were not compared with the texts.
