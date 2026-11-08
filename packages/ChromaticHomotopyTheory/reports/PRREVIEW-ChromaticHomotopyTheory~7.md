# Review of ChromaticHomotopyTheory (pull request #1643 at 31ab257)

**Verdict:** needs changes

This is a full review of the same head the previous review read; the folder has not changed since then. One P3 finding is carried over unrepaired (R04). The full pass found four further P3 findings. There is no P1 or P2 finding, the gate passes, and the dependency check is clean.

## R01 (P3) — The negative control for the weak-ring hypothesis is not p-local

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:438`, §4.4, last Check: "The Brown–Comenetz dual I_(ℚ/ℤ) of the sphere has empty Morava support, so it satisfies the third condition for every n. But F(n+1)⊗I_(ℚ/ℤ) … is nonzero."

**Claim:** §4.4 is stated "for every nonzero p-local weak ring R". This Check is meant to show that only the weak-ring hypothesis cannot be dropped. Its instance also breaks the p-local hypothesis, so it does not isolate the weak-ring hypothesis.

**Witness:** π₀I_(ℚ/ℤ)=Hom(π₀S,ℚ/ℤ)=ℚ/ℤ. At p=2, multiplication by 3 sends 1/3 to 0, so it is not injective and I_(ℚ/ℤ) is not 2-local (csy line 3726 states the support for this unlocalized spectrum).

**Repair:** Replace I_(ℚ/ℤ) by its p-localization R′=I_(ℚ/ℤ)⊗S_(p) and keep the argument. Tested at p=2: π₀R′=ℤ/2^∞≠0, so R′ is nonzero and 2-local. K(j)⊗R′=K(j)⊗I_(ℚ/ℤ)=0 for every 0≤j≤∞, because K(j) is p-local. F(n+1)⊗R′=F(n+1)⊗I_(ℚ/ℤ), the Brown–Comenetz dual of DF(n+1), is nonzero, because F(n+1) is p-local. So the third condition holds and the first fails, and R′ is not a weak ring, since csy Theorem 5.1.14 would force it to be zero.

## R02 (P3) — The support of T(n) is cited to a section that does not state it

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:377`, §4.2 proof route: "nil-conservativity of L_(K(n)) on Sp_T(n) (support of T(n) equal to {n}, GeneralAlgebraicKTheoryPartII §4.3)".

**Claim:** Nil-conservativity needs K(m)⊗T(n)=0 for every m≠n with 0≤m≤∞. GeneralAlgebraicKTheoryPartII §4.3 does not prove this.

**Witness:** Head of GeneralAlgebraicKTheoryPartII, README line 692. §4.3 gives periodic detection, S/p-acyclicity ⇒ T(n)-acyclicity, and "T(n)-acyclicity implying K(n)-acyclicity" (from BordismFormalGroups F6.3). That yields n∈supp(T(n)) only. BordismFormalGroups F6.3 (main, line 1171–1173) gives the same inequality.

**Repair:** Cite §4.4 (line 708), the ring comparison that T(n)⊗R=0 iff K(n)⊗R=0 for every associative unital ring R. Write "(support of T(n) equal to {n}: GeneralAlgebraicKTheoryPartII §4.4 applied to R=K(m), 0≤m≤∞)". Tested at n=1. For R=Hℚ, K(2) and H𝔽_p, K(1)⊗R=0, so T(1)⊗R=0. For R=K(1), K(1)⊗K(1)≠0, so T(1)⊗K(1)≠0. Hence supp(T(1))={1}. §4.4 is already on the *Needs:* line at README:397.

## R03 (P3) — Supplier-contract text that no target consumes, one passage overstating its supplier

**Location:** (a) `README.md:11`: "E5 supplies relative Thom colimits and their multiplicative refinements". The E5 clause of the EllipticCohomology contract at README:105 is unused in the same way. (b) `README.md:129–135`: the Honda-theory paragraph "For the Honda theory used in §§4.26–4.27, put k=𝔽_(p^(h+1)) …" and its three Checks, the last on the Bousfield–Kuhn functor.

**Claim:** (a) EllipticCohomology E5 on main does not supply general relative Thom colimits. GeneralAlgebraicKTheoryPartII asks EllipticCohomology for them as two declared gaps. No *Needs:* or *Dependencies* line of this README cites EllipticCohomology E5. (b) No target here consumes GeneralAlgebraicKTheoryPartII §4.11 or §§4.26–4.27; the Dependencies of Layer 4 list §§4.2–4.4, 4.14–4.16 and 4.20–4.24. The paragraph restates the Weierstrass and valuation data that §§4.26–4.27 own there, with their Checks.

**Witness:** EllipticCohomology README (main) lines 1733–1736 build only the relative Thom form over S//σ from ΩS⁹→N→ΩS¹³. The GeneralAlgebraicKTheoryPartII plan declares `relative-thom-colimit` and `multiplicative-thom-refinement` on E5 for every f:X→BGL₁R. A grep of this README finds "EllipticCohomology E5" only at :11 and :105.

**Repair:** Delete the E5 sentence at README:11 and the E5 clause at README:105, which runs from "E5's units spectrum gl₁(R)" to "the comparison to G5.3". Delete README:129–135. The Thom families are GeneralAlgebraicKTheoryPartII §§4.31–4.33, which the Scope bullet at README:10 already cites. The values in (b) are correct (at p=2, h=1: d=2, val(z)=val(P(u₁))=1/2), so nothing is lost. Its own section owns and checks them.

## R04 (P3) — Two Tau Ceti declarations are cited at a pin that lacks them

**Location:** `README.md:17` ("Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower` …"; "Tau Ceti's `TauCeti.SymmetricSpectrum` is the point-set category …"). The same declarations appear at README:71 (with the path `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`), README:101 and README:409, and at `Suggested.lean:9–11`.

**Claim:** This is R01 of the previous review, unrepaired; the head is the same. The branch builds against a Tau Ceti that has neither declaration.

**Witness:** The branch's `lake-manifest.json` pins TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In that package, `TauCeti/AlgebraicTopology/` has no `SerreClass/` and no `Spectra/`. `grep -rln 'isKilledBySomePower\|SymmetricSpectrum'` finds no file. Main's manifest pins `2fd255d9`.

**Repair:** Rebase the branch on current main so that the manifest pins Tau Ceti at `2fd255d9` or later, then re-run the targeted build. The README and the docstring are then correct as written. If the old pin stays, delete those sentences at README:17, :71, :101 and :409 and Suggested.lean:9–11, and cite DGFloer Layer 1 item 4's power-torsion Serre class without a Lean name.

## R05 (P3) — The lower bound of §4.3 restates GeneralAlgebraicKTheoryPartII §4.15

**Location:** `README.md:407`, "The value n+1 cannot be lowered: K(ℤ/p,n) is n-connective …". Also README:409: "For the lower bound use the Ravenel–Wilson computation of §4.2 at k=n and BordismFormalGroups F6.3's ⟨K(n)⟩≤⟨T(n)⟩."

**Claim:** The supplier already states and checks this inequality, with the same witness. README:401 itself says that §4.15 gives "an existential connectivity bound m≥n+1". Proving it again here is a second owner of one statement. The locators at README:407 (lmmt Remark 2.12, csy Theorem 5.3.5) support the upper bound, not this lower bound.

**Witness:** Head of GeneralAlgebraicKTheoryPartII, README line 915: "every admissible m satisfies m≥n+1 (Checks)". Its first Check, at line 923, uses K(ℤ/p,n), the reduced K(n)-rank p−1 (csy line 3655) and F6.3's ⟨K(n)⟩≤⟨T(n)⟩.

**Repair:** At README:407, write "The value n+1 cannot be lowered (GeneralAlgebraicKTheoryPartII §4.15, whose first Check gives the witness K(ℤ/p,n))", keeping the lmmt and csy locators for the upper bound. Delete the "For the lower bound use …" sentence at README:409. Tested at n=1: §4.15's Check gives BC_p=K(ℤ/p,1), reduced K(1)-rank p−1≥1, so m≥2. That is the value §4.3 claims.

## Previous findings

- R01 of the previous review (Tau Ceti pin): not repaired. The folder is unchanged and `lake-manifest.json` still pins `a91d3aaf`. README:17 and :71 still name `isKilledBySomePower` and the `SerreClass/PowerTorsion.lean` path. It is carried forward as R04.

No repair report marks any finding as not actionable, so nothing is re-raised under that rule.

## Verified sound

### Gate, dependency direction, Lean

- **Gate**, re-run with the brief's command on this head, exit 0: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate also reports `build=0`.
- **Dependency check** (brief's command):

  ```text
  depcheck: 229 roadmaps, 2316 edges, 0 problem(s)
  ```

  The check printed no UPWARD, CYCLE or `moved:` line. Every supplier is on main (GeneralizedCohomology, BordismFormalGroups, EnhancedDerivedSheaves, EllipticCohomology, ModularCurves, DGFloer, AlgebraicTopology) or earlier in `ORDER.txt`. StableHomotopyKTheory is at line 16, RefinedTraceMethods at 327, StableHomotopyKTheoryPartII at 330 and GeneralAlgebraicKTheoryPartII at 332; this roadmap is at 333. No roadmap on the never-cite list appears.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with no output. The file is `import Mathlib`, one module docstring and an empty `namespace TauCetiRoadmap.ChromaticHomotopyTheory`. It has no declaration, so there was no `#check @name` comparison to make and no padding to probe. It has no sorry'd data and no `set_option`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ChromaticHomotopyTheory'` is empty. `metadata.toml` is `topic = "math.AT"`.

### Headline theorems and statability

The headline theorems are §3.1 (the generalized Serre filtration with monodromy and strong convergence) and §4.1 (π₀((KU_p^∧)^tC_p)=ℚ_p(ζ_p), with zero T(1)-localization). §4.2 gives ∞-semiadditivity of Sp_T(n) and of K(n)-local E_n-modules, and the π-finite n-connected T(n)-equivalence. §4.3 gives the sharp value m=n+1. §4.4 gives the four-way weak-ring criterion. §5.1 shows that TMF[1/N]→TMF(N) is faithful GL₂(ℤ/Nℤ)-Galois for every N≥1. The module docstring names all six, each with its missing carrier. None is statable at the pins: the pinned Mathlib (`6b7abb3`) and Tau Ceti (`a91d3aaf`) contain no spectra, stable homotopy category, E∞ rings or Tate construction. A search for `SymmetricSpectrum`, `StableHomotopy`, `SequentialSpectrum`, `OmegaSpectrum` and `E∞` found only an unrelated homotopy-category equivalence of complexes. Leaving them unstated is correct. The Part II separation target is not a headline of this folder.

### Seeded sample: sources at their locators

| Target | Locator checked | What the text says | Supports the statement as written? |
| --- | --- | --- | --- |
| 3.1 | lmmt line 398 (p.10, proof of Proposition 2.11(ii)) | Serre spectral sequence in T(i)-homology of X→Y with T(i)-acyclic fibers | Yes, as the motivating use. Strong convergence for every E rests on StableHomotopyKTheory §7.24, which states it with no connectivity hypothesis on E |
| 3.1 | bhm line 258 (p.6, Lemma 3.5) | map of fiber sequences, E-equivalence on fibers and bases ⇒ on totals, via the AHSS of the fibrations | Yes |
| 4.1 | greenlees-sadofsky line 343 (p.400, Corollary 2.4) | Tate for cyclic H as the inverse limit of Thom spectra of −rξ, ξ the faithful line | Yes: the proof route's inverse Thom tower |
| 4.1 | hesselholt-ku lines 1658–1662 (printed p.844, confirmed at line 1636) | π_*KU^tC_p=π_*KU((t))/((t+1)^p−1)=π_*KU⊗ℚ_p(μ_p), uncompleted KU | Yes. The README marks it as uncompleted and proves the completed case |
| 4.1 | cm-tate line 129 (p.4, Remark 2.8) | L_K(n₁)(E_n₂)^tC_p≠0: a localized Tate of a non-local input survives | Yes, as the parallel non-vanishing example. The vanishing half is GeneralAlgebraicKTheoryPartII §4.24 on the *Needs:* line |
| 4.2 | csy line 1597 (Lemma 3.1.2), 1603 (Def 3.1.3), 1632 (Def 3.1.5), 1645, 1673 (Prop 3.1.9), 1692 (Def 3.1.10) | BC₁/BC_* for q-(co)limits; diagonally induced norm ν_q=(μ_δ)∘β!⁻¹ and its mate; inductive weak m-ambidexterity from m=−2; independence of m; identity/composition/base change; m-semiadditivity | Yes, word for word in the README's own terms. The direction q′_!s′^*→s^*q_! matches |
| 4.2 | csy lines 672, 682 (Defs 2.1.11, 2.1.13, p.17); 1705 (Ex. 3.1.12); 2000 (Thm 3.2.3); 336 (p.9) | integral = c_!∘Nm⁻¹∘q_*f∘u_*; \|q\|=∫id; finite-set integral is a sum; functoriality for F preserving (m−1)-finite colimits; Nm_BG is the classical norm, iso iff X^tG=0 | Yes |
| 4.2 | csy line 3882 (Thm 5.3.1, p.79); 3445 (Thm 4.3.10); 3639 (Lemma 5.1.7); 3655 (Cor 5.1.9); 3753, 3773 (Prop 5.1.15, Cor 5.1.17); 3923, 3930, 3970 (Lemma 5.3.4, Thm 5.3.5, Cor 5.3.7) | Sp_T(n), Mod_En ∞-semiadditive for n≥0 (csy's T(0) rational); bootstrap; dimension d; p^(binom(n,k)); nil-conservativity; π-finite n-connected ⇒ T(n)-equivalence; L(F(n+1))=0 version on Sp_(p) | Yes. The README correctly replaces T(0)=S[1/p] by Hℚ at n=0, and states that Sp_S[1/p] is not 1-semiadditive |
| 4.3 | lmmt line 406 (p.10, Remark 2.12); csy line 3930 | m=n+1 suffices via the Postnikov tower, filtered colimits and CSY | Yes for the upper bound (see R05 for the lower bound) |
| 4.4 | csy line 3616 (Def 5.1.4), 3705, 3726, 3731, 4036 (Thm 5.4.4), 4060 (Rem 5.4.5) | weak ring = one unit law; Lemma 5.1.12; supp(I_Q/Z)=∅; nilpotence for weak rings; (1)⇔(2)⇔(3); (2)⇔(2′) for p-local E | Yes, with the four conditions as stated (see R01 for the Check) |
| 5.1 | mm line 1757–1775 (Defs 7.3–7.4, p.37), 1776 (Ex. 7.5), 1801 (Thm 7.6, p.38) | M_ell(n) over ℤ[1/n], GL₂(ℤ/n)-torsor, TMF(n)=Γ(M_ell(n)[1/n],Otop), affine for n≥3, BZ/2 factor at n=2; faithful GL₂(ℤ/n)-Galois for every positive n | Yes, for every N≥1 |

Also spot-checked, outside the sample: bhls lines 98, 1596, 2227, 2300, 2876, 2886, 2893 and 3194 (Theorem A, Definition 4.1, Corollary 4.33, Theorems 5.4, 6.1, 6.2 and 6.25, Corollary 6.3), and hahn-wilson lines 93 and 1422. The fixed-point trace comparison is stated without T(h+1)-acyclicity. That matches bhls's proof of the upper-right map at lines 2906–2912, which uses only DGM, Levy and Mitchell.

### Cross-roadmap citations resolved (55 ids)

| Supplier (copy read) | Ids, with line |
| --- | --- |
| GeneralAlgebraicKTheoryPartII (open head) | §4.2 :666, §4.3 :690, §4.4 :706, §§4.5–4.9 :722–794, §§4.10–4.12 :809–857, §§4.13–4.16 :873–929, §§4.18–4.21 :961–1010, §4.22 :1026, §4.23 :1048, §4.24 :1064, §4.25 :1080, §4.26 :1096, §4.27 :1119, §4.28 :1135, §4.29 :1159, §4.30 :1174, §4.30a :1190, §4.30c :1243, §§4.31–4.33 :1268–1323, §4.45 :1541, §5.2 :1602, §5.5 :1664, §6.5 :1799, §8.8 :2183; gap `elliptic-level-three-galois` :204; its scope line 7 assigns ∞-semiadditivity and the sharp bound to ChromaticHomotopyTheory §4.2 |
| StableHomotopyKTheory (open head, via `roadmaps show`) | §§2.4–2.7 :573–609, §3.18 :1210, §3.21 :1247, §§7.21–7.27 :2594–2695 (§7.24 at :2661: strong convergence, "No connective hypothesis on E") |
| StableHomotopyKTheoryPartII (open head) | §2.7 :372 (Tate diagonal, B=S gives S^tC_p≃S_p^∧), §7.2 :923 (x=L−1, KU_*⊗ℚ_p(ζ_p)) |
| RefinedTraceMethods (open head) | §2.6 :646, §2.9 :853, §2.10 :879 (THH(Perf(A))≃THH(A) at :904), §4.9 :1825, §4.11 :1948, §4.17 :2226 (DGM), §6.8 :2907 (L_K(1)X≃(L_KU X)_p^∧) |
| GeneralizedCohomology (main) | G2 items 1–10 from :211 (G2.10 mapping-path fibers), G3.4, G3.7 (finite-CW mapping formula), G3.8, G3.9 from :663; G4.5; G5.1 :1512 (integral duality only, hence the gap), G5.3, G5.4 |
| BordismFormalGroups (main) | F1 :46, F2 :145, F3 :284 (Adams splitting :303–305), F5 :466, F6.1 :555, F6.2 :586 (H𝔽_p endpoint :977), F6.3 :760 (⟨K(n)⟩≤⟨T(n)⟩ :1173, thick classification :1107), F6.4 :1248, F6.5 :1526 (pointwise comma formula and composition :2105, `L_(K(n))X≃holim_i(L_nX∧M_i)` :2536, Landweber E(n)-locality :2556) |
| EnhancedDerivedSheaves (main) | E0.4 :211, E0.5 :242, E3.4 `coherentMate` :1257, E5:abstract :1436, E5:presentability.1 :1597 |
| EllipticCohomology (main) | E1 :182, E2 :486, E3 :784, E4 :885, E5 :1527 (see R03), E6 :1807 (Γ(N) level sheaves and deck-group descent :1840–1849) |
| ModularCurves (main) | §3D :1711, §4B :1780, §4C :1803, §5B :2193, §7E :2442, §7F :2528 |
| DGFloer (main) | Layer 1 item 4 :659 (Hurewicz mod a Serre class; power-of-d class; fixed exponent not a class) |
| AlgebraicTopology (main) | Stage 4 :499, Stage 5 :849, Stage 8 :1602 |

### Gaps

- `p-local-finite-duality` (GeneralizedCohomology G3.9, G5.1) and `spectral-ringed-sites` (EnhancedDerivedSheaves E5) have the same slug, supplier and wording in `design/plan.json` and at README:77 and :89. Neither is already provided. G3.9 constructs E_(p) and completion, and G5.1 integral finite duality, but neither identifies compact p-local spectra or proves p-local duality. EnhancedDerivedSheaves has no E∞-ringed site or quasicoherent spectral module. Both are precise and minimal.
- `elliptic-spectral-affineness` and `all-height-morava-realization` (README:107, :109) are not in this plan's `gaps`. They are declared with identical wording in GeneralAlgebraicKTheoryPartII's plan (E3 and E2 items 2–3) and its README lines 210 and 212. So the intake announces them on EllipticCohomology. EllipticCohomology on main has no affineness or all-height statement, so they are not already provided.

### Library declarations opened at the pins

Mathlib `6b7abb3`: `FormalGroup` (`Mathlib/RingTheory/FormalGroup/Basic.lean:56`), `FormalGroup.IsComm` (:74), `FormalGroup.Point` (:126, an `MvPowerSeries` with `HasSubst`), `FormalGroup.𝔾ₐ` (:145), `FormalGroup.𝔾ₘ` (:161, X+Y+XY), `FormalGroup.map` (:184). Also `CategoryTheory.ObjectProperty.isLocal` (`Mathlib/CategoryTheory/Localization/Bousfield.lean:55`, a `MorphismProperty`: precomposition is bijective into every P-object), `IsLocalization.flat` (`Mathlib/RingTheory/Flat/Localization.lean:37`), `Module.Flat.lTensor_exact` (`Mathlib/RingTheory/Flat/Basic.lean:323`) and `CategoryTheory.ObjectProperty.IsSerreClass` (`Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45`). Tau Ceti `a91d3aaf`: `WeierstrassCurve.formalGroup` (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58`). `AddCommGrpCat.isKilledBySomePower` and `TauCeti.SymmetricSpectrum` are absent (R04).

### Ownership and overlaps

`overlaps.md` and `citations.md` list nothing dropped, nothing defined only by a revision, and nothing unresolved. Searches of all open heads and main for "semiadditiv", "ambidextr", "TMF(N)", "generalized Serre" and "weak ring" hit only this folder. GeneralAlgebraicKTheoryPartII's scope line defers to §4.2 here, and GL2ModularityLifting's single hit is an unrelated phrase. Each object has one owner.

### Adversarial table

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| 3.1 abutment, degenerate bases | Y=*; Y=∅; E=0 | E²_(0,t)=E_t(F_+)=abutment; all 0; all 0 | Pass |
| 3.1 monodromy (Klein bottle) | E=Hℤ, reflection torus | E²: (0,0)=ℤ, (1,0)=ℤ, (0,1)=ℤ/2, (1,1)=ker 2=0 ⇒ H₁=ℤ⊕ℤ/2, H₂=0 = H_*(Klein); constant transport ℤ², ℤ | Pass |
| 3.1 periodic coefficients | KU, id of ℂP^∞ | E² ℤ only at (even, even); d_r lowers total degree by 1 ⇒ all zero; strong convergence by §7.24 | Pass |
| 3.1 non-cellular map | I, t↦t/2 | image of filtration 0 {0,1/2}⊄{0,1}; E²: id on H₀=ℤ | Pass |
| 3.1 convergence | any E, X₋₁=∅ | d_r out of (s,t) zero for r>s, exiting differentials ⇒ strong convergence (Boardman); §7.24 states it with no hypothesis on E | Pass |
| 4.1 Euler inversion | p=2; p=3 | (2+z): z=−2, ℤ₂→ℚ₂=ℚ₂(ζ₂); z²+3z+3 Eisenstein, ℚ₃(ζ₃) of degree 2 | Pass |
| 4.1 completed vs uncompleted | ℤ[[t]]/Φ_p(1+t) vs ℤ_p[[t]]/Φ_p(1+t) | p∈(t) in the first, so it is p-complete: both are ℤ_p[ζ_p]; both give ℚ_p(ζ_p) = StableHomotopyKTheoryPartII §7.2 = hesselholt-ku line 1662 | Pass |
| 4.1 raw vs localized | KU_p^∧, T(1) | raw π₀=ℚ_p(ζ_p)≠0; rational ⇒ S/p-acyclic ⇒ T(1)-acyclic, so L_T(1)=0 | Pass |
| 4.1 sphere | S, trivial C_p | S^tC_p≃S_p^∧: π₀=ℤ_p, π_(<0)=0, not periodic | Pass |
| 4.2 Beck–Chevalley | s=id; B′=∅ | BC map = identity; both sides on the empty space | Pass |
| 4.2 two-point norm | {a,b}→*, stable C | norm = identity matrix, \|{a,b}\|=2; all-ones matrix det 0 | Pass |
| 4.2 rational cardinality | Sp_ℚ, BC_p, unit | norm ×p on π₀=ℚ ⇒ \|BC_p\|=p⁻¹; csy Lemma 5.3.3 at n=0: p^(binom(−1,1))=p⁻¹ | Pass |
| 4.2 Hℤ, C₂ in Sp | trivial action | norm ×2 on π₀; coker ℤ/2=Ĥ⁰; Ĥ^(−1)=ker N/I=0, Ĥ¹=Hom(C₂,ℤ)=0 | Pass |
| 4.2 non-semiadditive cases | H𝔽_p in Sp_(p); H𝔽_q in Sp_S[1/p] | norm on π₀ is p=0; q=0: not invertible | Pass |
| 4.2 dimension formula | n=1, k=0,1,2; n=2, k=1,2,3 | p, p, 1; p², p, 1; wrong p^(nk) at n=k=2: p⁴ | Pass |
| 4.2 dimension, evenness | S² at p=2, n=2; S¹ | κ₀=k², κ₁=0, dim 2=χ; \|v₂\|=6 convention gives 1; S¹: κ₁≠0, dim 1−1=0 | Pass |
| 4.2 π-finite comparison | n=1: BC_p, K(C_p,2); n=0: BC_q | reduced K(1)-rank p−1 vs p⁰−1=0; H̃(BC_q;ℚ)=0 but H₁(BC_q;ℤ[1/p])=ℤ/q, so Hℚ is needed at n=0 | Pass |
| 4.2 bootstrap step | k=1 | dim BC_p=p^n=\|BC_p\|·\|C_p\| ⇒ \|BC_p\|=p^(n−1)=csy p^(binom(n−1,1)) | Pass |
| 4.2 support of T(n) (R02) | n=1; R=Hℚ, K(2), H𝔽_p, K(1) via §4.4 | K(1)⊗R=0,0,0,≠0 ⇒ T(1)⊗R=0,0,0,≠0; §4.3 alone gives only 1∈supp | Finding R02 |
| 4.3 sharp bound | n=1: K(ℤ/p,2), BC_p; n=2: K(ℤ/p,3), K(ℤ/p,2) | reduced K(n)-ranks 0, p−1; 0, p−1 | Pass |
| 4.3 height-zero hypothesis | K(ℤ/q,n+1), q≠p | π_(n+1)[1/p]=ℤ/q≠0; not S[1/p]-acyclic; Hℚ-acyclic | Pass (negative control) |
| 4.3 third assertion | Σ^(n+1)H𝔽_p→0; Σ^nH𝔽_p→0 | ↦ Σ∞K(ℤ/p,n+1)→0 acyclic; ↦ Σ∞K(ℤ/p,n)→0, reduced K(n)-rank p−1 | Pass |
| 4.3 infinite group | K(ℤ/p^∞,n+1) | colim of K(ℤ/p^r,n+1), each acyclic ⇒ 0 | Pass |
| 4.3 Serre class | ℤ/4 | killed by 2², not by 2; 0→ℤ/2→ℤ/4→ℤ/2→0 | Pass |
| 4.3 lower bound (R05) | GeneralAlgebraicKTheoryPartII §4.15 at n=1 | its statement m≥n+1; its Check BC_p, rank p−1 — same as README:407 | Finding R05 |
| 4.4 four conditions | Hℚ, n=0, F(1)=S/p | S/p⊗Hℚ=0; H̃(BC_p;ℚ)=0; K(j)⊗Hℚ=0 for 1≤j≤∞; π₀-iso ⇒ Hℚ-iso: all true | Pass |
| 4.4 ∞ endpoint | H𝔽_p | K(j)⊗H𝔽_p=0 for finite j>n, K(∞)⊗H𝔽_p≠0; H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p: all false | Pass |
| 4.4 sphere | S_(p) | supp={0,…,∞}: all four false together | Pass |
| 4.4 weak-ring definition | Hℚ with μ=0; S | μ(η⊗id)=0≠id; passes | Pass |
| 4.4 weak-ring negative control (R01) | I_(ℚ/ℤ) at p=2 | π₀=ℚ/ℤ, 3·(1/3)=0 ⇒ not 2-local; p-localized R′: π₀=ℤ/2^∞, supp ∅, F⊗R′≠0 | Finding R01 |
| 5.1 group orders | N=1,2,3,5 | 1; (4−1)(4−2)=6; (9−1)(9−3)=48; (25−1)(25−5)=480 | Pass |
| 5.1 row action | N=3, unipotents g, h | (P,Q)g=(P,P+Q), then h: (2P+Q,P+Q); other order: (P+Q,P+2Q) | Pass |
| 5.1 determinant | diag(−1,1) | e(−P,Q)=ζ⁻¹; fixing ζ: 48/2=24 | Pass |
| 5.1 Galois definition | C₂, B=A×A; B=0, A=Hℤ; trivial S₃ | A⁴=∏_(C₂)B, B^hC₂=A; B⊗_AHℤ=0 with Hℤ≠0; 36=36 | Pass |
| 5.1 small levels | N=1; N=2 at p=2; N=3 at p=2 | identity, trivial group; ℤ[1/2]⊗ℤ_(2)=ℚ, BZ/2 factor (mm Ex. 7.5); ℤ[1/3]⊗ℤ_(2)=ℤ_(2) | Pass |
| Conventions | ΣS; S→S→0 | π₁=ℤ, swap (−1)^(1·1)=−1; cofib(id)=0, cofib(0→S)=S | Pass |
| p-series | X+Y+XY at p=2,3 | 2X+X²; 3X+3X²+X³ | Pass |
| p-local duality | D(S/p); V=S_(p), X=Hℤ | fib(p)=Σ⁻¹S/p; Hom(ℤ_(p),ℤ)=0 vs ℤ_(p) | Pass |
| v-degrees | p=2,3 | \|v₁\|=2, 4; π₂BP=0 vs π₂MU_(3)=ℤ_(3) | Pass |
| Δ²⁴ | weight, degree | 12·24=288; 576 | Pass |
| EllipticCohomology E5 contract (R03) | main E5 lines 1733–1736; README Needs | only the relative Thom form over S//σ; general case declared as gaps; 0 Needs citations | Finding R03 |
| Honda paragraph (R03) | p=2,h=1; p=3,h=1 | d=2, val z=val P(u₁)=1/2; d=6, 1/6, 1/3 — correct, but consumed by no target | Finding R03 |
| Tau Ceti carriers (R04) | pin a91d3aaf | `SerreClass/`, `Spectra/` absent; grep 0 files | Finding R04 |
| Part II fixed points | p=2, n=2, k=0 | π₋₁(BP⟨1⟩^hℤ)=H¹(ℤ;ℤ₂)=ℤ₂ | Pass |
| Part II fp-type index | ku₂^∧, U=cofib(v₁⁴ on S/2) | 𝔽₂[v₁]/v₁⁴ in degrees 0,2,4,6; S/2: 𝔽₂[v₁] infinite | Pass |

### Notes for the human approver (no change requested)

- GeneralAlgebraicKTheoryPartII's `gap:elliptic-level-three-galois` asks EllipticCohomology E6 for TMF[1/3]→TMF(3). §5.1 here proves every N≥1 without that input, and README:11 says so. An earlier review recorded this arrangement as accepted by the author on a human reviewer's suggestion. Today each statement has one builder.
- Three open revisions of BordismFormalGroups (#1807, #1808, #1854) move the generic Kan-extension and straightening foundations out of F6.5 into GeneralizedCohomology G2.11. The pointwise formula this README cites at F6.5 would then sit under G2.11. The F6.5 heading, the holim formula and Landweber locality stay.
- DGFloer's open revision renumbers Layer 1 item 4 as §1.4, and one AlgebraicTopology revision (#1652) retitles "Stage k" as "Layer k" with unchanged numbers. Neither counts as a dropped id in `overlaps.md`, and by policy this README cites both as they are on main.

## Not verifiable

- HL13, Proposition 3.4.3, behind csy Lemma 5.1.7, is not in the source cache. csy states the lemma for E_n with residue field 𝔽_p. The README states it for any perfect k, which needs the same proposition or base change along W(𝔽_p)→W(k). I did not open it.
- Ravenel–Wilson, Theorem 9.2, was read only through csy line 3660.
- Pull-request comments were not read; no repair report for this head is on the board.

## Source issues

- none
