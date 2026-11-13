The comment makes two findings, F01 and F02, numbered H01 and H02. It closes with a request to use and check two sources, numbered H03. Supplier heads read: SchemeKTheoryOperations `46fa384`, KTheoryFiniteLocalFields `e987a1b`. Line numbers below are for `TauCetiRoadmap/MotivicEtaleKTheory/README.md` at the new commit `8d34493e`.

## H01 (CBirkbeck) — applied

§2.0b no longer builds the classes from imported universal classes. It now fixes functorial models of the shared complexes on smooth k-schemes over every field: moving and specialization over infinite k, functorial Tate complexes over perfect k, with agreement on the overlap. On those models cₚ,ₙ is SchemeKTheoryOperations §7.3a's instance (T1–T3), and KTheoryFiniteLocalFields §6.10 proves that theory's two conditions (:245). The three API bullets now cite T3 for naturality and additivity, T6 for the product formula and the coefficient (−1)ⁿ⁻¹(n−1)!, and T8 for the character (:249–251). §7.3a is added to the SchemeKTheoryOperations contract with T1–T3, T5, T6 and T8 (:53). The KTheoryFiniteLocalFields contract (:57), the MotivesAndAlgebraicCycles contract (:61) and the Scope sentence (:9) now say that §6.10 proves the conditions, rather than that it "builds the integral motivic Chern-class theory".

The same pattern was repaired in two other places. §2.4 had re-derived the Newton coefficient (−1)ᵖ⁻¹/(p−1)! itself; it now cites T8 through §2.2 (:330, :332). The §2.2 route now names §2.0b's models.

## H02 (CBirkbeck) — applied

§7.1 now states the real Beilinson character as §7.3a's instance for real Deligne cohomology (:652). The theory is: 𝒱 the smooth schemes of finite type over ℂ; Γ(p) the Zariski sheaves D_log(−,p) of §3.4, for every p∈ℤ; the products and unit of §§4.1–4.2; and c₁(u)=log|u|. T1–T3 give the classes and T8 the character. The Grassmannian paragraph is now the proof of the projective bundle condition: an affine-cell Betti argument, then strictness on the mixed Hodge structures of §3.2, then the five lemma on §3.4's fiber (:654).

An instance also needs the divisor condition, which the comment does not mention. It is proved by §7.3a's Gysin criterion: ι_* is inverse purity H_Dᵏ(D,ℝ(i))≃H_D,Dᵏ⁺²(Y,ℝ(i+1)) followed by forgetting support, with ι_*1 equal to §5.2's supported class (:654). The normalization sentences and Checks are unchanged. Two Checks are added, one witnessing the twist drop in the projective bundle formula and one witnessing the twist shift in purity (:666–667).

## H03 (CBirkbeck) — applied differently

The Weibel locators were checked against the legal author's copy that the manifest already records (key WeibelKBook):
- Definition V.11.5: p.454, WeibelKBook line 27490.
- Proposition V.11.8: p.455, line 27552.
- Lemma V.11.3, product rule: pp.452–453, line 27403.
- Theorem V.11.11 and its proof: pp.457–459, lines 27688–27808.
- Lemma V.11.13: p.458, line 27746.

These now support §§2.0b and 7.1 and the reference entry (:753). Schneider's §4 is not cited. The roadmap's manifest has no key for it, and this job cannot add one. The Deligne-specific facts are cited from BKK, which is already in the manifest:
- formula (5.5) for c₁: p.110, BKK line 3971;
- Definition 5.32 and Theorem 5.34 (D_log is a Gillet complex): pp.119–120, BKK lines 4323 and 4334;
- the purity condition of Gillet complexes: p.38, BKK lines 1379–1383.

SchemeKTheoryOperations §7.3a keeps its own Schneider locators.

## Ownership, citations and interfaces

- **Direction.** SchemeKTheoryOperations (merge-order line 37) and KTheoryFiniteLocalFields (line 90) both come before this roadmap (line 138). The dependency check reports 0 problems.
- **Ownership search.** The search was by object: real or Deligne Chern classes or characters, "functorial model", and §7.3a citations. Across main and the open heads, it finds no other owner of the Deligne instance or of functorial motivic models. BorelRegulators and ColemanIntegration already import §7.1 from here.
- **Owner of the motivic models.** KTheoryFiniteLocalFields §6.10 states its instance on §3.0a's complexes. BF line 964–965 notes that Bloch's complexes are not sheaves on the big Zariski site. So that instance also rests on the functorial models §2.0b fixes, and §2.0b is later in the merge order. This is not repaired here, because the comment places the models in §2.0b. If those models should be supplied to KTheoryFiniteLocalFields, their owner has to move to its §3.0a.
- **Library check.** Neither pin has a carrier for motivic or Deligne cohomology or for higher K-theory: a grep of both pins for motivic, Deligne complex, HigherChow, BlochCycle and KTheory returns nothing.
- **Suggested.lean.** It still declares nothing, so the `#check @name` inventory is empty and no binder changed. Two docstring bullets (Layer 2.0b, Layers 7.1–7.2) now name the instance and the missing functorial models and Deligne sheaves.
- **Sources and pasted text.** No new source was fetched and no missing-text request was made. Nothing in the comment was suspicious.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.0b instance target H²ᵖ⁻ⁿ(X,ℤ(p))=CHᵖ(X,n) (:245) | a=2p−n in KTheoryFiniteLocalFields §3.0a's Hᵃ(X,ℤ(i))=CHⁱ(X,2i−a); field, p=n=1 | a=1 gives CH¹(F,1)=F× | holds | new |
| Models compatible with pullbacks (:245) | divisor condition's ι* along {0}→𝔸¹ | not flat, so "compatibly with flat pullback" was too weak | fixed to KTheoryFiniteLocalFields §3.0a's pullbacks | changed |
| T6 product formula (:250) | i=2, j₁=j₂=1; i=3 on {a,b}·[c] | c₂,₂{a,b}=−c₁(a)c₁(b); c₃,₃=(−2)(−1)c₁c₁c₁=2·∏c₁ | 1,−1,2 as in :258 | new citation |
| Sign of c₂,₂ (:250) | {2,5} over ℚ, tame symbol at 5 | ∂₅{2,5}=2; ∂₅(−{2,5})=2⁻¹=3 mod 5 | sign detected | none |
| T8 coefficient (:251, :330) | p=1,2,3 | (−1)ᵖ⁻¹/(p−1)! = 1, −1, 1/2 | agrees with :338 | citation |
| Degree-zero character (:251, :652) | ℙ², O(1)⊕O(−1) | ch₂=h²/2+h²/2=h², c₂=−h²; T8 needs j≥1 | degree 0 stated separately via T1 | wording |
| Deligne c₁(u)=log abs u (:652) | u=2, i, 1/2, 6=2·3 | log 2, 0, −log 2, log 6=log 2+log 3; −2∂∂̄log abs u=0 | cocycle, homomorphism | new |
| Twist range p∈ℤ (:652) | point, p=−1 | H⁰_D=ℝ(−1), H¹_D=0 | Γ(−1) defined | none |
| Zariski descent (:652) | point ⊔ point, p=0 | H⁰_D=ℝ² | as in :438 | none |
| Weight-one value through T5 (:654) | u=2eⁱᶿ | c₁,₁=c₁∘det gives log 2; branch change by 2πi gives 0 | holds | none |
| Projective bundle formula (:654, :666) | ℙ¹ over a point; n=0; X=∅ | H¹_D(ℙ¹,ℝ(1))=ℂ/ℝ(1)≅ℝ=ℝ⊕0; H²_D=ℝ=0⊕ℝ; n=0 identity; ∅ gives 0=0 | holds | new Check |
| Wrong twist in the ξ-summand (:666) | point, H⁰_D(ℝ(1)) | ker(ℝ(1)⊕0→ℂ)=0≠ℝ | excluded | new Check |
| Purity (:654, :667) | {0}⊂𝔸¹ with (k,i)=(1,1), (0,0), (−1,0); D=∅ | H²_D(𝔾_m,ℝ(2))=ℂ/iℝ≅ℝ=H¹_D(pt,ℝ(1)); H²_D,{0}(ℝ(1))=ℝ=H⁰_D(pt,ℝ(0)); H¹_D,{0}(ℝ(1))=0=H⁻¹; ∅ gives 0 | holds | new Check |
| Purity without the twist shift (:667) | H³_D,{0}(𝔸¹,ℝ(1)) | H²_D(𝔾_m,ℝ(1))=ℂ/(ℂ+ℝ(1))=0≠ℝ | excluded | new Check |
| Gysin criterion and projection formula (:654) | ι*a=0; a=1 | a∪c₁(O(D))=a∪ι_*1=ι_*(ι*a)=0; with a=1 both sides are ι_*z | holds | new |
| ι_*1=c₁(O_Y(D)) (:654) | point and {0,∞} on ℙ¹ | degrees 1 and 2 = c₁ of O(1) and O(2); §5.2 coefficient +1 | holds | new |
| Supply direction (:9, :53, :57) | merge order 37, 90 → 138 | depcheck 0 problems | holds | none |

## Build and gate

Committed as `8d34493e` ("MotivicEtaleKTheory: review repairs (motivic and Deligne Chern classes as SchemeKTheoryOperations §7.3a instances)"); nothing was pushed.

`lake build TauCetiRoadmap.MotivicEtaleKTheory.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (82s)
Build completed successfully (8976 jobs).
```

Gate against origin/main, after the commit, exited 0:

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable --pr 1470`), with no UPWARD, CYCLE or moved line:

```text
depcheck: 222 roadmaps, 1971 edges, 0 problem(s)
```
