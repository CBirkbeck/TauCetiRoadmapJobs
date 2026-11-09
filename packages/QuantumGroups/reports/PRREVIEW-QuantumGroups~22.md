# Review of QuantumGroups (pull request #1649 at 9b3ff6c)

**Verdict:** needs changes

This is an incremental re-review of the 10 lines changed in `TauCetiRoadmap/QuantumGroups/` since `7b6238f`. The diff rewrites the `### Dependencies` paragraph of Layers 1, 2, 4, 6 and 7 so that each names every supplier its sections' *Needs:* lines name. `Suggested.lean` is unchanged. Nothing changes outside the folder.

The five paragraphs are correct: each item they name is in a *Needs:* line of the same layer, every *Needs:* supplier is named (two by a containing id, noted below), and every cited supplier id exists on main. The gate passes. One finding remains, carried from the previous two reviews: the conflict with #1705 and the description that describes an earlier head (P3). It needs no edit in the folder.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise.

## R01 (P3) — Two open revisions of this folder still conflict with no stated order, and the description describes an earlier head

Carried from the previous review's R01 (itself carried from R03 and H01 before it). No repair report marks it as not actionable, and nothing at this head addresses it.

**Location:** this pull request's description (`scratch/pull-request.md`, data): "Current head `d7a6c540…`", "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged", "No Lean elaboration was repeated because no Lean files change".

**Claim:** When two open pull requests change one roadmap and their heads conflict, one is rebased on the other before either merges, and the description says which. The description also describes the head under review. At this head `Suggested.lean` carries two theorems the description says do not exist, and the five Dependencies paragraphs differ from #1705's in every case.

**Witness:**
- `roadmaps list` shows `#1649 QuantumGroups @kim-em 9b3ff6c` and `#1705 QuantumGroups @kim-em 7c3e850`.
- `roadmaps overlaps QuantumGroups` reports "#1649 and #1705 conflict in README.md, Suggested.lean".
- `roadmaps show QuantumGroups --pr 1705`, the Layer 1 Dependencies paragraph: "§1.1 uses only CStarAlgebras C1.7, C1.CommutativeMultiplierMorphisms and C5.1–C5.2 with VonNeumannAlgebras V13b.SpatialNorm" against this head's `:460` "§1.1 uses CStarAlgebras C1.CommutativeMultiplierMorphisms and C5.2". The Layer 2, 4, 6 and 7 paragraphs differ likewise (#1705 names §0.2/§0.3 and V13b.SpatialNorm where this head names §0.1, OperatorTheory/SelfAdjointSpectralTheory Part B and RepresentationTheory/CompactGroups).

**Repair (for the worker, outside the folder):**
- Rewrite the description to describe `9b3ff6c`: §1.1 ClassicalMultipliers; Layer 0 moved down with CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras as later owners; Layer 8 on native `TauCeti.UqSl2`; §0.2's sign-map parity argument; the two §4.1 headlines (modular automorphism, Kac equivalence) in a six-declaration `Suggested.lean` that elaborates with only `sorry` warnings; the layer Dependencies paragraphs that name every *Needs:* input.
- State which of #1649 and #1705 is rebased on the other. Whichever merges second keeps this head's §0.2 wording and these five Dependencies paragraphs, and declares the two §4.1 headlines once.

## Previous findings

- R01 — not repaired: the description still opens "Current head `d7a6c540…`" and states no order with #1705, which is still at `7c3e850` and still conflicts in both files. Carried as R01.

## Verified sound

**The changed passages.** Each rewritten paragraph was compared item by item with the *Needs:* lines of its layer (`:391`, `:452`, `:503`, `:531`, `:554`, `:822`, `:869`, `:916`, `:1042`, `:1096`, `:1132`, `:1197`, `:1255`). The computed sets are in rows 1–5 of the adversarial table. Two items are covered by a containing id rather than verbatim: §1.2's *Needs:* "C5" is reached through §1.1's "C5.2" plus the supplier table's row "C5 minimal tensors and slice maps" (`:103`), and §7.2's "Subfactors 3.2–3.3" is contained in the paragraph's "Subfactors 3.1–3.3", which is what §0.2 (`:306`) cites. Neither misleads an implementer: the *Needs:* lines keep the exact ids.

**Supplier ids resolved on main (`1bea835`):**
- CStarAlgebras: `C1.CommutativeMultiplierMorphisms` is §1.8 (`TauCetiRoadmap/CStarAlgebras/README.md:497`); C2 is §§2.1–2.10 (`:544`–`:812`); C5.2 "Tensoring maps and functionals; concrete identifications" (`:1143`); C5 is §§5.1–5.5 (`:1112`–`:1230`). Its Downstream consumers line (`:1957`) names QuantumGroups as consuming `C1.CommutativeMultiplierMorphisms` and Layer 5.
- VonNeumannAlgebras Layer 0 "C*-algebra and state prerequisites" (`TauCetiRoadmap/VonNeumannAlgebras/README.md:275`): the state space (`:284`–`:288`) and the GNS construction via `PositiveLinearMap.GNS` (`:294`–`:295`).
- OperatorAlgebraDynamics D1 (`:148`) and D2 (`:221`).
- RepresentationTheory/CompactGroups Layer 0 "normalized Haar measure and averaging" (`:205`) and "Engine case: `SU(2)` and the maximal torus" (`:390`).
- OperatorTheory/SelfAdjointSpectralTheory "Part B — the Borel functional calculus and projection-valued measures" (`:252`).
All of these are on main, so none is an upward or open-PR supplier.

**Gate.** Rerun on this head with the merge-order file: every scanner 0, ending `… outside-folder=0 source-material=0 OK`; the worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.

**Dependency check** (output of the required command, unmodified):

```text
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The edge count rose from 2260 to 2262 with the two supplier names the paragraphs add (RepresentationTheory/CompactGroups, OperatorTheory/SelfAdjointSpectralTheory); both are on main.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` exits 0 with four `declaration uses sorry` warnings (`:83`, `:111`, `:122`, `:130`). The scratch `#check @name` file for the six declarations elaborates and its types equal `scratch/signatures.md`; the file is byte-identical to the one the previous review checked, so `AlgebraicHaar`'s dropped `[StarModule ℂ A]` is still harmless (no field uses it) and the four theorems carry their binders explicitly.

**Headline theorems, padding, sources.** `Suggested.lean` and every source locator are unchanged since `7b6238f`; the previous review's padding probes (every one-tactic attempt fails on the four theorems) and its `nt` checks (Thm 1.6.6 line 810, Thm 1.7.3 lines 977–978, Prop 1.7.7 lines 1036–1040) stand. The seeded sample falls in the changed layers at §§2.2, 4.1, 4.3, 6.1, 7.1 and 7.2; the changed paragraphs add no locator, and those sections' locators were checked by the previous reviews (Timmermann uncertified, see below).

**Duplication and ownership.** The paragraphs introduce no object; they name suppliers. Ownership of the roadmap's objects was settled by the previous review's `roadmaps grep` over all open heads and is unchanged. The one other open revision of the folder is #1705, covered by R01.

**Overlaps.** `scratch/overlaps.md`: no id this README cites is dropped by an open pull request, no id is defined only by an open revision, and this pull request drops no id. The only item is the #1705 conflict (R01).

**Adversarial table.** Rows 1–5 are the changed paragraphs, computed here as the set the paragraph names against the union of its sections' *Needs:* suppliers. Rows 6–38 carry forward the previous report (PRREVIEW-QuantumGroups~20, at `7b6238f`) for the statements this diff leaves untouched, with the values that review computed (q=1/2 unless stated).

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Layer 1 Dependencies (`:460`) | §1.1 *Needs:* `:391`; §1.2 *Needs:* `:452` | *Needs:* union = {C1.CommutativeMultiplierMorphisms, C5.2, C2, C5, VNA L0, OAD D1–D2, RT/CompactGroups Haar}. Paragraph = {C1.CMM, C5.2} ∪ {C2, VNA L0, OAD D1–D2, RT/CG Haar}. Difference: "C5" named only through "C5.2" | consistent | none |
| 2 | Layer 2 Dependencies (`:562`) | §2.1 `:503`; §2.2 `:531`; §2.3 `:554` | Union = {Layer 1, HM H1–H3, C5, §0.1, OT/SAST Part B, VNA L0 GNS, native spectral theorem}. Paragraph names all of them, with Part B assigned to §2.2 and GNS to §2.3 as the *Needs:* lines do | consistent | none |
| 3 | Layer 4 Dependencies (`:924`) | §4.1 `:822`; §4.2 `:869`; §4.3 `:916` | Union = {§3.1, §§3.2–3.3, C1–C5, HM H2, OAD D2, AmenableGroups 1,5,7, FP F3, §6.3}. Paragraph names all nine; "§4.1 is algebraic and uses §§3.1–3.3" now matches §4.1's line, which was the previous review's remark | consistent | none |
| 4 | Layer 6 Dependencies (`:1140`) | §6.1 `:1042`; §6.2 `:1096`; §6.3 `:1132` | Union = {§4.1–§4.2, §5.2, §0.1, VNA Layers 1 and 3, C1 Gelfand duality, Layer 1 cancellation}. Paragraph = {Layers 4–5, §0.1, VNA 1 and 3, Layer 1 cancellation, C1 Gelfand duality}; "Layer 1 cancellation" is §1.2 "Cancellation and Haar states" (`:393`) | consistent | none |
| 5 | Layer 7 Dependencies (`:1263`) | §7.1 `:1197`; §7.2 `:1255` | Union = {Layers 3–6, C2,C4,C8, RT/CG SU(2), §§5.2,6.1–6.2, TL Layers 0–7, §0.2, Subfactors 3.2–3.3, FP F1,F6}. Paragraph names all, with Subfactors 3.1–3.3 ⊇ 3.2–3.3 | consistent | none |
| 6 | `haar_modular_automorphism` (§4.1) | ℂ; ℂ[C₂]; ℂ[S₃]; SU_q(2); inverse convention; zero ring; ℂ[ℤ] with `u*=u` | r20: ℂ θ=id; ℂ[C₂] `u↦−u` gives `h(u·u)=1` vs `−1`, excluded; ℂ[S₃] `δ_(gk,e)=δ_(kg,e)`; SU_q(2) `θ(a)=4a`: `h(aa*)=4/5=4·h(a*a)`, `θ(c)=c`; inverse `a/4` gives `1/20≠4/5`; zero ring `h(1)=0≠1`; ℂ[ℤ] `−2<0` | pass | none |
| 7 | `haar_trace_iff_antipode_involutive` (§4.1) | ℂ; ℂ[C₂]; ℂ[S₃]; SU_q(2); SU_1(2) | r20: ℂ[S₃] trace and `S²=id` both true (excludes "iff commutative"); SU_q(2) `1/5≠4/5` and `S²(c)=c/4≠c`, both false; SU_1(2) both true | pass | none |
| 8 | §0.2 sign map respects relations | TL₃, TL₄, inverse | r20: `s(e₁e₂e₁)=−e₁=s(e₁)`; `s(e₁)²=(−d)s(e₁)`; `s(e₁)s(e₃)=s(e₃)s(e₁)`; `s′s=id` | pass | none |
| 9 | §0.2 closure parity | (k,c,n)=(0,1,1),(0,2,2),(1,1,2); d=3/2 | r20: `k+c≡n`; `T₁^(d)(s1)=d=−(−d)`; `T₂^(d)(−e₁)=−d` | pass | none |
| 10 | §4.1 Check | ℂ[S₃]; SU_q(2) | r20: `4/5=4·(1/5)`; `S²(c)=c/4`; inverse `1/20` | pass | none |
| 11 | Docstring not-statable list | pins grep | r20: only `PivotalCategory`, `SphericalCategory`, no positivity carrier | pass | none |
| 12 | `schur_orthogonality` (§3.1) | SU_q(2); character; ι=∅ | r18: `F̃=diag(2,1/2)`; `h(a*a)=1/5`, `h(c*c)=4/5`, `h(aa*)=4/5`; ι=∅ excluded by `IsSimpleOrder` | pass | none |
| 13 | `compactType_iff` (§4.1) | ℂ; ℂ[C₂]; zero ring; ℂ[x]; ℂ[ℤ] `u*=u` | r18: zero ring `h(1)=0≠1`; ℂ[x] x=0 both false; ℂ[ℤ] `−2<0` both false | pass | none |
| 14 | §0.2 Checks | ℂ; ℂ² | r18: δ=1, `T₂(f₂)=[3]=0`; `‖R‖²=2`, `(−RR*)²=−2(−RR*)` | pass | none |
| 15 | §0.1 conjugate solutions | `R=2e₀⊗e₀+e₁⊗e₁` | r18: `√5·√(5/4)=5/2>2`; HS `√17` vs 5; `J²z=−z` | pass | none |
| 16 | §1.1 classical multipliers | S₃; ℤ | r18: `Δf(g,h)=1`, `Δf(h,g)=0`; `r₊=aS(b)`, `r₋=S(a)b` | pass | none |
| 17 | §1.2 cancellation, Haar | monoid {1,0}; C(C₂); ℤ | r18: span dim 3; `h(1[e])=1/2` vs 1; Fell unitary | pass | none |
| 18 | §2.1 coefficient order | S₃; C₂ | r18: `u₁₃(gh)=1`, `u₁₃(hg)=0`; `(−1)²=1` vs −2 | pass | none |
| 19 | §2.2 unitarization | `U=[[1,2],[0,−1]]` | r18: `U²=I`; averaged form `[[1,1],[1,3]]`, det 2 | pass | none |
| 20 | §2.3 regular corepresentation | isometry; S₃ | r18: `h(a*b)1`; `1+1+4=6` | pass | none |
| 21 | §3.2 characters, Plancherel | SU_q(2) | r18: `f_z(a)=2^z`; `f₁*f₁(a)=4=f₂(a)`; Vandermonde det 3 | pass | none |
| 22 | §3.3 `S²u=FuF⁻¹`, traces | SU_q(2) | r18: `S²(c)=c/4`; `tr F=tr F⁻¹=5/2` | pass | none |
| 23 | §3.4 σ, τ, KMS | SU_q(2) | r18: `σ_(−i)(a)=4a`; `4/5` vs `1/20`; `τ_(−i)(c)=c/4` | pass | none |
| 24 | §4.2 regular unitary | ℤ; ℂ; C₂ | r18: pentagon (1,2,5),(1,3,3)→(1,3,6); `‖1+u‖=2` vs √2 | pass | none |
| 25 | §4.3 coamenability | ℤ; F₂ | r18: Følner `2/(2N+1)→0`; `2√3<4` | pass | none |
| 26 | §5.1 SU_q(2) presentation | `u*u`, `uu*` | r18: `ac=qca`, `c*c=cc*`; `S²(c)=c/4` | pass | none |
| 27 | §5.2 O_F^+ | `F=[[0,1],[−2,0]]`; n=1 | r18: `FF̄=−2I`; `‖E‖²=5`; n=1 `u=u*`, `u²=1` | pass | none |
| 28 | §6.2 finite generators | H=0; H=ℂ | r18: quotient ℂ; `dim A_(≤1)=2` | pass | none |
| 29 | §7.1 Haar on SU_q(2) | q=1/2; q=±1 | r18: `4/5`; `16/21`; endpoints 1/2, 1/3 | pass | none |
| 30 | §7.2 fusion, dimensions | `F=[[0,1],[−2,0]]` | r18: `β=25/4`; `δ=−5/2`; dims `1, 5/2, 21/4, 85/8` | pass | none |
| 31 | §8.1 Hopf convention | Virelizier §2.3 | r18: `[2]=5/2`; `KF=4FK` | pass | none |
| 32 | §8.2 ladders | L₂⁺; L₁⁻ | r18: weights `1/4,1,4`; `EF−FE=diag(−1,1)` | pass | none |
| 33 | §8.3 Casimir | L₀⁺, L₁⁺, L₂⁺ | r18: `10/9, 17/9, 65/18` | pass | none |
| 34 | §8.4 local finiteness | L₀⁻; Verma | r18: L₀⁻ not type 1; Verma weights `4^j` | pass | none |
| 35 | §8.5 Clebsch–Gordan | m=n=j=1 | r18: `α₁=−1/2`; `tr K⁻¹=ε[m+1]` | pass | none |
| 36 | §8.6 compact form | m=1 | r18: `h₁=1/2`; `⟨FE,a*a+c*c⟩=0` | pass | none |
| 37 | §8.7 classical specialization | v=1, m=2 | r18: `[E,F]=diag(2,0,−2)` | pass | none |
| 38 | Layer 4 paragraph vs §4.1 *Needs:* (r20 remark) | `:924` | Now row 3 | repaired | none |

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, unchanged file): `TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean:46`), `TauCeti.PivotalCategory` (`CategoryTheory/Monoidal/Pivotal/Basic.lean:76`), `TauCeti.SphericalCategory` (`Pivotal/Spherical.lean:69`), as in the previous review; no Lean statement changed, so no new declaration was needed.

**Remarks on untouched text** (no change requested in this incremental round):
- §4.3's *Needs:* line (`:916`) cites §6.3, a later layer, for the commutative reconstruction comparison, and the Layer 4 paragraph says only that comparison uses it. No §6.x *Needs:* line cites §4.3 (they cite §4.1–§4.2), so there is no target-level cycle; the layer-level order Layer 4 → Layer 6 → §4.3 is a forward pointer only.
- The board manifest's `nt` entry records `cited_for = ["Q0.3"]` only, while §4.1 cites `nt` Thm 1.6.6, Thm 1.7.3 and Prop 1.7.7 (for the worker; the manifest is outside the folder).

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008): recorded `uncertified` (paywalled). The locators of §§2.2, 4.1, 4.3, 6.1, 7.1 and 7.2 that fall in the changed layers are cited by locator only; the changed paragraphs add none. Their mathematics was checked by the previous reviews' computations (rows 6–37) and against `nt`.
- Ownership against open pull requests: the changed paragraphs introduce no object. #1705 was read through `roadmaps show`; other open pull requests were not reread this round.

## Source issues

- none
