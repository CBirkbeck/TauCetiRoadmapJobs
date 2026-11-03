# Review of K3Surfaces (pull request #1285 at ce64e9f)
**Verdict:** needs changes

Incremental re-review of 123 changed lines since 771182d. The previous findings are accounted for under `## Previous findings`; the changed passages (the supplier contracts, §0.2 step 1, §1.1, the b₁=0 route, the §6.2 locator, the style repairs, the module docstring) were reviewed in full with their suppliers and locators; the gate and the elaboration were run as in a full review.

## R01 (P2) — The unirationality step asserts q(Ỹ)=0 and P₂(Ỹ)=0 without a route, and the second is not a consequence of the canonical-divisor formula when the vector field has only isolated zeros

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:181` ("Conclude from the canonical-divisor formula that the resolved quotient has H¹(O)=0 and no bicanonical sections, hence is rational by the Castelnuovo–Zariski criterion of NeronModelsAndSemistableAbelianVarietiesPartII §6.1").

**Claim:** The sentence that replaces the old implicit reduction is the only bridge from the quotient Y=X/ξ to "X is unirational", and both of its inputs to the criterion are unsupported. (a) H¹(Ỹ,O)=0 for the minimal resolution Ỹ→Y: nothing in step 1 or in the *Needs:* line gives it. Leray for the resolution gives only H¹(Y,O_Y)↪H¹(Ỹ,O_Ỹ) with cokernel inside H⁰(R¹f_*O_Ỹ), which vanishes only for rational singularities, and nothing stated bounds H¹(Y,O_Y) by H¹(X,O_X)=0 across the purely inseparable π (the inclusion O_Y⊂π_*O_X gives H¹(Y,O_Y)→H¹(X,O_X)=0, not injectivity). The cited criterion needs H¹(O)=0 as a hypothesis (NeronModelsAndSemistableAbelianVarietiesPartII at its head, `README.md:9823–9826`: the equivalence between rationality and H¹(O)=H⁰(ω²)=0). (b) "No bicanonical sections" follows from the formula only when the saturated line L=O_X(Δ) of the vector field has Δ≠0: then π^*ω_Y≅O_X(−(p−1)Δ) on the smooth locus, and a section of ω_Ỹ² restricts to the smooth locus, pulls back to O_X(−2(p−1)Δ) on X minus finitely many points, extends by normality and is zero. When the zeros are isolated (Δ=0, L=O_X), the formula gives ω_Y trivial on the smooth locus; if Y had only rational double points, K_Ỹ=0 and h⁰(ω_Ỹ²)=1. That case must be excluded by a different argument, and the sentence does not do it.

**Witness:** `huybrechts-k3 line 6817` through 6826 (Proposition 9.4.6, printed p.180): the (H.L)>0 case concludes from H⁰(Y,ω_Y^n)=0 by the Bombieri–Mumford–Enriques classification ("Y is a ruled surface") and then by a Leray bound on the base genus, not by Castelnuovo–Zariski. `huybrechts-k3 line 6827` through 6845 (p.181): the (H.L)=0, L=O_X case is handled separately, with ω_Y trivial on the smooth locus, ω_Ỹ=O(Σa_iE_i), a_i≤0, and the contradiction 22=b₂(X)=b₂(Y)≤b₂(Ỹ)≤22 forcing Y smooth and ξ nowhere zero against c₂=24. Computed instance for (b): Δ=0 and every singularity a rational double point gives a_i=0 for all i, so h⁰(2K_Ỹ)=h⁰(O_Ỹ)=1≠0. The primary source agrees: `rudakov-shafarevich-inseparable line 440` through 480 (Theorem 5, printed pp.1216–1217) proves the quotient rational by bounding the plurigenera, invoking the Bombieri–Mumford classification for κ=−1 (rational or ruled, with b₁(X)=0 excluding a base of positive genus) and excluding κ=0 by the étale Euler-number count e(Y′)≥e(Y)=e(X)=24 with equality only for smooth Y; it never uses an H¹(O)=0 criterion.

**Exact repair:** Replace the sentence by two named sub-targets of the reduction, each with its inputs. (1) Divisorial case Δ≠0: prove h⁰(ω_Ỹ^n)=0 for all n>0 from the canonical-divisor formula as above, and state how q(Ỹ)=0 is obtained: either prove that the singularities of Y are rational (then h¹(Ỹ,O)=h¹(Y,O_Y) and h¹(Y,O_Y)=0 by an argument to be named) and apply NeronModelsAndSemistableAbelianVarietiesPartII §6.1, or follow Huybrechts' route and name the ruledness input "a smooth projective surface with all plurigenera zero is ruled, in every characteristic" (Bombieri–Mumford) as an owned target or a cited supplier, after which the base is rational because X→Y→C would map a K3 onto a curve of positive genus. (2) Isolated case Δ=0: state Huybrechts' contradiction as a target: ω_Y trivial on the smooth locus, the discrepancy inequality a_i≤0 of the minimal resolution, h¹(Ỹ,O)=0, Noether's formula on Ỹ (SchemeAndStackFoundations §5.10) giving b₂(Ỹ)≤22, b₂(Y)=b₂(X)=22 since π is a universal homeomorphism (EtaleCohomologyFoundations topological invariance), and each exceptional curve adding a class (F.7), so Y is smooth, T_X/L≅O_X, and ξ has no zeros, contradicting the 24 zeros counted by c₂. Then "X is unirational" follows in both cases through the Frobenius factorization X→Y→X^(1). Keep the Proposition 9.4.6 locator for the statement.

**Repair test:** a vector field with a divisorial zero (Δ≠0) gives P₂(Ỹ)=0 by the formula; a vector field with 24 isolated zeros and rational-double-point quotient would give K_Ỹ=0 and P₂(Ỹ)=1, and is excluded by (2), not by the formula.

## R02 (P3) — "The Part II roadmap consumes the same contract under this slug" overstates the agreement

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:120–121` ("The Part II roadmap consumes the same contract under this slug; it is one supplier announcement").

**Claim:** The contract K3SurfacesAndSymplecticBoundedness states under `gap:integral-topology` is wider and names a different owner for part of it: it asks ComplexKahlerGeometry (its "Part II") for the exponential sheaf sequence 0→ℤ→O→Oˣ→1 and the identification of the connecting map with the integral first Chern class, which this README assigns to ComplexComparisonPartII C5.4, and it has a second item, the Chern-class intersection adapter. One slug announced once would carry one `needs` sentence; the two READMEs give different ones.

**Witness:** `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:202–204` at its open head ("Supply the following two generic results … construct the analytic exponential sheaf sequence … identify the connecting map … with the integral first Chern class"), and `README.md:13` there ("its Part II owns the exponential Chern comparison … and the Chern-class intersection adapter (gap:integral-topology)"); this README `:93` and `:237–242` give the exponential sequence and connecting class to ComplexComparisonPartII C5.4.

**Exact repair:** Write "The Part II roadmap's contract under this slug contains this comparison as its first item, together with the exponential sequence and the intersection adapter that this roadmap takes from ComplexComparisonPartII C5.4 and does not need" and drop "it is one supplier announcement". The reconciliation of the exponential-sequence owner between the Part II roadmap and C5.4 is the Part II roadmap's to make.

## R03 (P3) — Scope and ownership should name the unirationality reduction and ρ(X)=22 as K0.A targets, since the Part II roadmap restates them

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:18–22` (the new ownership sentence names only the suppliers of §0.2's inputs) and `:181` (sub-target (i)).

**Claim:** The vector-field unirationality reduction and "a unirational K3 surface has ρ(X)=22" are now targets of K0.A here, and the Part II roadmap, which is later in the merge order and declares K0.A as its supplier, plans the same two statements at its open head as interface laws of its own, with a second route (a SchemeAndStackFoundations gap for the unirational-surface cycle theorem). Two open pull requests build one object. This roadmap is the right owner (it is the earlier one and K0.A needs both statements), so the repair here is a sentence of ownership; the Part II roadmap must then consume K0.A instead of restating.

**Witness:** `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:413` at its open head ("Prove the Rudakov–Šafarevič vector-field unirationality reduction and apply the general unirational-surface cycle theorem to get rank 22"), `:417–418` (the two interface laws), `:124` (`gap:rational-surface-cohomology`). This README `:181` proves both inside K0.A.

**Exact repair:** Add to the Scope and ownership paragraph: "K0.A owns the vector-field unirationality reduction and the Picard-number theorem ρ(X)=22 for unirational K3 surfaces; the Part II roadmap consumes them." No change to §0.2.

## Previous findings

- R01 — repaired: the comparison is now a stated contract under "What ComplexKahlerGeometry must provide (gap:integral-topology)" (`README.md:103–121`); §1.1 consumes it and owns the exact segment, the Checks and the §3.1 application (`:227–235`); §§1.2, 3.1 cite "the holomorphic Picard comparison consumed in §1.1". The producer is ComplexKahlerGeometry K4.P at its open revision (#1234, `README.md:580`). `roadmaps grep 'Pic_hol'` now shows one construction (that revision) and consumers only. The slug matches the Part II roadmap's (R02 above for the wording). No `design/plan.json` exists for this roadmap in the board package (it holds only reports), so the slug cannot be registered there; that is for the intake, not the author.
- R02 — repaired, and the repair introduced R01 above: the pencil step now has the four sub-targets (i)–(iv) (`:181`) with ρ(X)=22 from unirationality (EtaleCohomologyFoundations §0.9, F.5–F.7; SchemeAndStackFoundations §2.11; Huybrechts Proposition 17.2.7), Hasse–Minkowski isotropy (GlobalQuadraticForms §5.5), reflection into the nef cone (Remark 8.2.13) and the pencil (Proposition 2.3.10); "cannot assume Picard rank at least five" became "proves ρ(X)=22 from unirationality". The new sentence that reaches unirationality is R01.
- R03 — repaired: `:277` proves b₁=0 from the C5.4 exponential sequence with H⁰(O)=ℂ→H⁰(Oˣ)=ℂˣ onto and H¹(X,ℤ)↪H¹(X,O)=0 (Huybrechts §1.3.2, p.15); "the surface identities" is gone; the Dependencies line `:324` matches.
- R04 — repaired: `:627–628` reads "Remark 6.3.7, p.114, with its quotient in §6.4, pp.115–118".
- R05 — repaired: "dimension 20", "19-dimensional", "degree 2", "20-fold", "order 2¹⁰ and exponent 2", the leading spaces at the §7.1 and §7.2 paragraphs, and "The gluing theorem" (`:25`).

## Verified sound

Independent AI review, incremental at head `ce64e9f5ae044fc26f124cee0d44817e315a45a7` after the full review at `771182d`. The diff outside the folder is empty (`git diff --stat origin/main...HEAD` excluding the folder prints nothing); the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only. No repair report marks a finding "not actionable in this package".

**Gate.** The worker's gate at this head passed every check (`gate.md`). I reran the prescribed dependency check with the candidate merge order and the content checkout:

```text
depcheck: 204 roadmaps, 1654 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The two new edges are the EtaleCohomologyFoundations and GlobalQuadraticForms citations (main) and NeronModelsAndSemistableAbelianVarietiesPartII (earlier in the merge order, another author's new roadmap at #870).

**Elaboration.** `lake env lean` on `TauCetiRoadmap/K3Surfaces/Suggested.lean` exits 0 with exactly the two `declaration uses sorry` warnings (lines 51 and 74). The Lean diff is docstring-only (two lines). Imports: `import Mathlib` plus five `TauCeti.*` modules at the pin; no `set_option`, no sorry'd data, `theorem` throughout.

**Signatures.** A scratch copy with `#check @` for the four declarations elaborated: `IsAlgebraicK3` keeps `[Field k] [IsAlgClosed k]` and `[X.Over (Spec k)]`; the vanishing theorem keeps `[CharP k p]`, `2 < p`, the structure morphism and `IsAlgebraicK3 k X`; the gluing theorem keeps both `IsNondegenerate` instances, `IsEven` for both lattices, the anti-isometry equation, the form and carrier equations and the pair of isometries. Nothing changed from the previous head.

**One-tactic probe.** On a scratch copy each `sorry` was replaced by `first | simp | rfl | infer_instance | sorry`; both theorems fell through to `sorry` (two warnings, exit 0). No padding; the headline coverage and the docstring's list of unstatable headlines are as in the previous review (the docstring now names "the exact Picard segment of Layer 1" instead of the comparison, consistent with §1.1 consuming the comparison).

**Source sample at the changed passages.** Every new locator was opened in the cache text (`huybrechts-k3` page markers coincide with printed pages; `stacks-09nu` is the Cohomology of Sheaves chapter).

| Target | Text opened; result |
| --- | --- |
| 0.2 step 1, unirationality | `huybrechts-k3 line 6797` through 6845 (Proposition 9.4.6, pp.180–181): H⁰(T_X)≠0 ⇒ unirational, via the quotient, the canonical formula π^*ω_Y≅L^(−(p−1)) and the Frobenius factorization. The proposition supports "X is unirational"; the README's route to it does not (R01). |
| 0.2 (i) ρ=22 | `huybrechts-k3 line 14076` through 14090 (Proposition 17.2.7, pp.367–368): resolution of indeterminacy by blow-ups, π^* injective with π_*π^*=deg·id, NS⊗ℚ_ℓ carried to NS⊗ℚ_ℓ; Y=ℙ² with b₂=ρ=1. Matches (i). |
| 0.2 (i) Pic torsion-free | `huybrechts-k3 line 349` through 354 (Remark 1.2.5, p.12): torsion L has χ(L)=2, L or its dual effective, an effective torsion bundle is trivial. Matches. |
| 0.2 (ii) isotropy | `huybrechts-k3 line 7879` through 7888 (Proposition 11.1.3, p.208): char≠2,3, ρ≥5 ⇒ elliptic, by Hasse–Minkowski (indefinite rank ≥5 represents zero) and (i) of that proposition. Matches. |
| 0.2 (iii) reflections | `huybrechts-k3 line 5646` through 5657 (Remark 8.2.13, p.151): L effective in the positive cone, s_C(L)=L+(L.C)C, (s_C(L).H)<(L.H), terminates at a nef class. Matches. |
| 0.2 (iii) pencil | `huybrechts-k3 line 1103` through 1125 (Proposition 2.3.10, p.32): nontrivial nef L with L²=0 is base point free; for char≠2,3 a smooth elliptic E with mE∈|L|; Stein factorization over ℙ¹. Matches (iii) and the "characteristic at least five" clause of (iv). |
| 0.2 Examples | `huybrechts-k3 line 14055` through 14072 (§17.2.3, p.367): the Fermat quartic in characteristic 3 is unirational with ρ=22. Matches. |
| 1.1 contract | `stacks-09nu line 217` through 246 (Lemma 20.6.1): H¹(X,O_Xˣ)=Pic(X) for a ringed space with local stalks, frame torsor and gluing inverse, no compactness. Matches the contract text. |
| 1.2 b₁=0 | `huybrechts-k3 line 452` through 458 (§1.3.2, p.15): exponential sequence, H¹(X,ℤ)=0 from H¹(X,O)=0. Matches. |
| 6.2 locator | `huybrechts-k3 line 4232` (Remark 3.7, p.114) and `line 4248` (§6.4 heading, p.115). Matches the corrected locator. |
| 3.1, 4.1, 7.1, 7.2, 7.3 | Changed by spacing or by the wording "the holomorphic Picard comparison consumed in §1.1" only; the previous review's checks of these targets stand. |

**Suppliers resolved for the changed passages** (main unless stated): SchemeAndStackFoundations §2.11 (`README.md:3656`: `hilbert90`, `fppf_kummer_sequence` with `0 → Γ(X,O)^×/n → H¹_fppf(X,μ_n) → Pic(X)[n] → 0`, étale exactness for n invertible) and §5.10 (`:7175`: adjunction, surface Riemann–Roch, Noether's formula, numerical equivalence, Hodge index); EtaleCohomologyFoundations §0.9 (`:1120`, cycle classes and projective bundle formula), F.5 (`:1179`, duality), F.6 (`:1200`, Gysin, projection and self-intersection formulas; étale Gauss–Bonnet `deg c_d(T_X) = Σ(−1)ⁱ dim Hⁱ_et(X,ℚ_ℓ)` at `:1219–1230`), F.7 (`:1239`, blow-up decomposition with one Tate class per blown-up point and the ℙ^r Check); GlobalQuadraticForms §5.5 (`:665`, isotropic over K ↔ locally isotropic for regular forms over number fields) with §5.4 (`:644`, the rank-at-least-five induction) and the local rank-five input in Layer 4; NeronModelsAndSemistableAbelianVarietiesPartII §6.1 at #870 (`:9793`; the characteristic-independent Castelnuovo–Zariski equivalence between rationality and H¹(O)=H⁰(ω²)=0 is a target there at `:9823–9826`); ComplexKahlerGeometry K4.P at #1234 (`:580–590`, the producer under the gap); K3SurfacesAndSymplecticBoundedness `gap:integral-topology` at #1375 (`:202`). `roadmaps resolve` reports nothing unresolved for this README.

**Adversarial table.** Rows for the changed statements carry computed values; rows for untouched statements are carried from the review at 771182d (its table, same instances and values) and are listed by statement.

| Statement | Instances tried | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| Unirationality route, divisorial case | Δ≠0, L=O(Δ), section of ω_Ỹ² | pulls back to O_X(−2(p−1)Δ), h⁰=0 | P₂(Ỹ)=0 holds; q(Ỹ)=0 has no route (R01). |
| Unirationality route, isolated case | Δ=0, Y with only rational double points | K_Ỹ=Σa_iE_i, a_i=0, h⁰(2K_Ỹ)=1 | Formula does not give P₂=0; needs Huybrechts' b₂ argument (R01). |
| Castelnuovo–Zariski hypotheses | ruled surface over a genus-g curve | q=g, P₂=0; rational iff g=0 | q=0 is a real hypothesis, not implied by P₂=0. |
| Kummer and b₁ | K3; abelian surface | kˣ/ℓⁿ=0 and Pic[ℓⁿ]=0 ⇒ H¹(μ_ℓⁿ)=0; abelian surface Pic[ℓⁿ]=(ℤ/ℓⁿ)⁴ ⇒ b₁=4 | Torsion-freeness is used; negative control separates. |
| Étale Gauss–Bonnet | K3; abelian surface; ℙ² | 1−0+22−0+1=24=deg c₂; 1−4+6−4+1=0; 1+1+1=3 | b₂=22 from c₂=24, b₀=b₄=1, b₁=b₃=0. |
| π_*π^*=deg | ℙ² blown up, π of degree d; class with π_*α=0 | d·α=0 ⇒ α=0 over ℚ_ℓ | Injectivity needs characteristic-zero coefficients: ℚ_ℓ as stated. |
| Cycle classes span | Y a blow-up of ℙ² at n points | b₂(Y)=1+n=ρ(Y) | Blow-up decomposition gives one Tate class per point. |
| NS signature and isotropy | ρ=22, Hodge index | signature (1,21), rank 22≥5, indefinite | Hasse–Minkowski applies; rank-4 negative control: x²+y²−3z²−3w² (norm form of the quaternion algebra ramified at 2 and 3) is indefinite and anisotropic over ℚ. |
| Primitive isotropic class, Riemann–Roch | L²=0, L≠0 | χ(L)=0/2+2=2 ⇒ h⁰(L)+h⁰(L⁻¹)≥2 | L or −L effective. |
| Reflection step | C a (−2)-curve, (L.C)<0, H ample | s_C(L)²=L²+2(L.C)²−2(L.C)²=L²; (s_C(L).H)=(L.H)+(L.C)(C.H)<(L.H) | Isotropy preserved, degree strictly decreases, terminates. |
| Pencil from D₀ | D₀ primitive nef, D₀²=0; char 5 vs 3 | base point free; smooth elliptic member for char≠2,3 | Char 3 smooth-fibre selection rests on Rudakov–Šafarevič 1983, p.1502 (uncertified); the 1976 paper says only "elliptic or quasi-elliptic" for p=2,3 (`rudakov-shafarevich-inseparable line 494` through 497). Not independently verified; unchanged since the previous head. |
| Fermat quartic Example | char 3; very general complex quartic | ρ=22 (Shioda); ρ=1, H⁰(T)=0 | Sub-target has a hypothesis; claims nothing for every K3. |
| b₁=0 by the exponential sequence | compact surface, H¹(O)=0; disconnected union of two | H⁰(O)=ℂ→ℂˣ onto, H¹(ℤ)↪0; ℂ²→(ℂˣ)² onto | Holds without connectedness. |
| Gap contract laws | O(1) on ℙ¹, zero section, frames e and 2e; tensor, dual, pullback | torsor without global section; 0 not a frame; 1+(−1)=0, −2, 2·3=6 | As the previous review's frame-torsor rows; the contract states them. |
| Gap contract, generality | non-compact M, H¹(M,O)≠0 | Lemma 20.6.1 needs only local stalks | "Without compactness, projectivity or H¹(M,O)=0" is correct. |
| Statements untouched by the diff | `IsAlgebraicK3` and its negative controls; double sextic; contraction; Noether; K0.A binders and the Theorem D cases (c₂ values 0, 12, 12, 12, 84, 36); frame torsor, inverse, tensor/dual/pullback, Čech, exact segment, point and empty manifold; Hodge diamond; positive component; nef root wall; Monge–Ampère constant; quaternion signs; sphere of structures; σ normalisation; splitting exclusion; cup lattice; Kuranishi dimensions; constant family; first-order base; primitive polarization; period domain degenerate cases, positivity, rescaling, components, Hodge hyperplane; Pic=0 cone; twistor conic; generic W; two components; strong Torelli; reflection; Riemann–Roch at a root; ι and eigenlattices; discriminants and index; projections; graph gluing Checks; gluing iff and its anti-isometry hypothesis; clean formula; normal determinants; double sextic fixed locus; fixed-locus classification; free quotient; free/nodal loci; lifted curves; marking group | values as computed in the review at 771182d (its adversarial table, 56 rows) | Carried; no statement in these rows changed. |

**Library declarations opened at the pins** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): unchanged from the previous review; the Lean statements are byte-identical, and the elaborated signatures above confirm every declaration still resolves.

**Ownership by object.** `roadmaps grep 'Pic_hol'`: constructions only in ComplexKahlerGeometry #1234 K4.P; K3Surfaces, GeometricQuantization and K3SurfacesAndSymplecticBoundedness consume. `roadmaps grep -i 'Castelnuovo|Bombieri–Mumford|Enriques classification'`: the Castelnuovo–Zariski criterion is owned by NeronModelsAndSemistableAbelianVarietiesPartII §6.1 as cited; no roadmap owns the Bombieri–Mumford ruledness criterion (relevant to the repair of R01). `roadmaps grep -i 'unirational|Picard number 22|ρ=22|Shioda'`: besides this roadmap, the Part II roadmap plans the unirationality reduction and ρ=22 (R03); NeronModelsAndSemistableAbelianVarietiesPartII's hits are the Shioda–Tate formula; LefschetzStructures, MotivesAndAlgebraicCycles, EnriquesSurfacesAndIntegralNonexistence, HyperellipticCurves and InverseGaloisAndArithmeticFundamentalGroups each have one unrelated hit. No open pull request builds the genus-one pencil of a K3 with a vector field. This roadmap is the owner of the reduction and of ρ=22 because it is earlier in the merge order than the Part II roadmap and its K0.A headline needs both. The Rudakov–Šafarevič 1976 text is a legal copy (mathnet.ru) cached under the Part II roadmap's key `rudakov-shafarevich-inseparable`; it was read for R01 and the pencil row only.

## Not verifiable

- Rudakov–Šafarevič p.1502 (the characteristic-3 smooth-generic-fibre selection in sub-target (iv)): paywalled, recorded uncertified in the README; not requested. The sub-target is stated as a target with that locator.
- Martin v3 and Gounelas–Liedtke: cited only in passages the diff leaves untouched; verified in the previous review and not reopened.
- The board package for this roadmap has no `design/plan.json`, so whether `gap:integral-topology` is registered where the intake reads it could not be checked; the README states it in the required form.
- Ownership against open pull requests whose files this brief does not provide was checked only through `roadmaps grep` at their heads.

## Source issues

- none
