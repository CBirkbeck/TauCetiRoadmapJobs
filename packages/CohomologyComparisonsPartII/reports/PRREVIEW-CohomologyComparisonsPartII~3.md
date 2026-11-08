# Review of CohomologyComparisonsPartII (pull request #1364 at 212f91b)

**Verdict:** needs changes

Incremental re-review of the 25 changed lines since c9807db (20 insertions, 5 deletions, all in `TauCetiRoadmap/CohomologyComparisonsPartII/README.md`; `Suggested.lean` unchanged). The change adds to §2.2 the fixed fibre coordinates and their isomorphism to the Huber–Kings order, the tube-filtered rigid syntomic variant RΓ̃_rsyn with the comparison map κ_r, three Checks, a scope sentence, an Examples sentence, the consumer line, and the HuberKings reference. Five findings: 1 P1 (the worker's gate fails its build check at this head), 4 P3. The mathematics of the new passage is sound (rows C01–C13 below); the findings are the gate, locators, one missing hypothesis clause and one citation of an earlier owner.

## R01 (P1) — the worker's gate fails its build check at this head

**Location.** `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean` line 1, `import Mathlib`.

**Claim.** The pull request description says the targeted build succeeds with `sorry` as the only warning. The worker's gate at 212f91b reports `build=2 FAIL`, every other counter 0.

**Witness.** The two build lines are lake's advisory that `Suggested.lean` "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". It appeared because the merge of main (fb47c48e) moved the pull request's `lake-manifest.json` to Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (the pins of main), and the gate's fresh targeted build under that Mathlib emits the advisory. Elaboration itself is clean: `lake env lean` on the file exits 0 with no output (17 s), and a rerun of the gate on the already-built oleans prints every counter 0 and `OK` because a cached build emits no advisory. The worker's fresh compile is the authoritative result, and its build counter is what acceptance is conditioned on, so this is a finding under the brief's failed-build rule, and no acceptance is possible while it stands.

**Repair (tested).** Prepend the single line `module` before `import Mathlib` in `Suggested.lean` (the file has no declarations, so no `public import` or `public section` is needed). A scratch copy with that line prepended elaborates with `lake env lean` from the pinned worktree: exit 0, no warning. On main at eaf17b1, 26 of 141 `Suggested.lean` files already start with `module`.

## R02 (P3) — HuberKings is not in the roadmap's manifest and its line locators do not match the service's extraction

**Location.** `README.md` lines 353, 355, 362 and 947: "HuberKings Definition 2.2.1, HuberKings line 529", "HuberKings line 513, HuberKings line 543, HuberKings line 573", "HuberKings Proposition 2.1.6, HuberKings line 469", "HuberKings Proposition 2.1.7, HuberKings line 504", and the reference entry listing lines 469, 504, 513, 529, 543, 573.

**Claim.** The README cites a new source by `<source id> line N` locators. `packages/CohomologyComparisonsPartII/sources.toml` has no HuberKings entry, so there is no agreed extraction for those line numbers; the brief lists every manifest text and HuberKings is not among them.

**Witness.** The sources service does hold an extraction of arXiv math/0612611v1 (pdftotext, 38 pages). Against it only one of the six line locators lands on its target:

| README locator | what is at that line of the service's extraction | where the target is |
|---|---|---|
| line 469 for Proposition 2.1.6 | Definition 2.1.3 (†-space with reduction) | Proposition 2.1.6 at line 495–499 |
| line 504 for Proposition 2.1.7 | inside the proof of Proposition 2.1.6 | Proposition 2.1.7 at line 532–535 |
| line 513 for §2.2 | inside the proof of Proposition 2.1.6 | §2.2 heading at line 536 |
| line 529 for Definition 2.2.1 | last lines of the proof of Proposition 2.1.6 | Definition 2.2.1 at line 543; its cone and map (a,b)↦(a−b,(1−Φ*/pⁿ)b) at line 556–559 |
| line 543 for Remark 2.2.2 | Definition 2.2.1 | Remark 2.2.2 at line 563–569 |
| line 573 for Example 2.2.4 | Example 2.2.4 | correct |

Proposition 2.2.7, cited by number, is at line 605–611. The theorem numbers and the page range 12–15 are right (page markers: 12 at line 459, 13 at 500, 14 at 541, 15 at 588).

**Repair.** Record HuberKings in `sources.toml` through the sources service (citation arXiv:math/0612611v1; locator scheme theorem; cited for 2.2), and renumber the line locators to the service's extraction: Proposition 2.1.6 line 495; Proposition 2.1.7 line 532; §2.2 line 536; Definition 2.2.1 line 543 (map at line 559); Remark 2.2.2 line 563; Example 2.2.4 line 573; Proposition 2.2.7 line 605. The reference entry at line 947 lists the same lines.

## R03 (P3) — three BesserI line locators of the new passage point beside their targets

**Location.** `README.md` line 353 "(BesserI line 738–739)"; line 362 "BesserI line 1112–1115"; line 355 "BesserI line 1137" for Proposition 9.5; line 945 reference entry.

**Claim.** Line 738–739 of BesserI is cited for "the component order A⊕F^r→A⊕C of BesserI Proposition 6.3".

**Witness.** BesserI line 738 is blank and line 739 is the page marker for manuscript p. 20. The cone with that component order, Cone(RΓ_rig(X/K0)⊕Filⁿ RΓ_dR → RΓ_rig(X/K0)⊕RΓ_rig(X/K))[−1], is at line 741–743, which the preceding paragraph of §2.2 already cites. Likewise the independence of the filtered rigid complex under smooth change of Y and proper change of X̄ is stated at line 1116–1119 (line 1112–1115 is the formula for Fil Ω and the ideal I), and Proposition 9.5 begins at line 1141 (line 1137 is the end of Proposition 9.4). Definition 9.1 is at line 1109, Remark 9.2 at 1126, Definition 9.3 at 1131; the pages 29–30 are right (marker for p. 30 at line 1124).

**Repair.** Replace "BesserI line 738–739" by "BesserI line 741–743", "BesserI line 1112–1115" by "BesserI line 1116–1119", and cite Proposition 9.5 at "BesserI line 1141"; update the line list of the reference entry accordingly.

## R04 (P3) — κ_r analytifies logarithmic forms on a compactification that the definition does not require to carry them

**Location.** `README.md` line 355: "Choose a compactification X⊂X̄ over V and a closed embedding of X̄ into a V-scheme Y smooth in a neighbourhood of X̄ … Construct the natural map κ_r … on filtered terms, analytification of logarithmic forms on X̄_K followed by restriction to strict neighbourhoods."

**Claim.** The filtered term of RΓ_rsyn is F^rRΓ_dR(X_K/K), computed by Ω^(≥r)(log D) on a smooth proper normal-crossings compactification of X_K (contract `relative-hodge`, README line 92; BesserI Definition 5.1, line 652). The compactification X̄ chosen for Fil^r_tub is any V-compactification with an embedding into a Y smooth near X̄ (BesserI Definition 9.1), and nothing in the sentence makes X̄_K smooth with normal-crossings boundary.

**Witness.** Take X=A¹_V and X̄ the closure of A¹_V in the weighted projective plane ℙ(1,1,2)_V (or any V-compactification whose generic fibre is singular at the boundary); then "logarithmic forms on X̄_K" is not the complex that computes F^rRΓ_dR(A¹_K/K), and the map described is undefined as written. The Check at line 373 silently uses X̄=ℙ¹_V, whose generic fibre is the normal-crossings compactification; the Spec(V) Check uses X̄=Spec(V). Such an X̄ always exists: start from any V-compactification, resolve its generic fibre to a normal-crossings compactification by blow-ups, and blow up the V-model along the closures of the centres (blow-up commutes with the flat base change V→K), then re-embed into a smooth Y.

**Repair.** In the sentence defining κ_r, add the clause that X̄ is chosen with X̄_K smooth and X̄_K−X_K a normal-crossings divisor, so that F^rRΓ_dR(X_K/K) is computed on X̄_K (such X̄ exist, by the blow-up argument above), and note that the first API bullet (independence of (X̄,Y)) makes κ_r independent of this choice. One clause; the Checks and the proper-X proof are unchanged.

## R05 (P3) — the Y=X̄ case of Fil^r_tub is the stupid-filtered overconvergent complex that ColemanIntegration §L3.Fb.1 already defines

**Location.** `README.md` line 355: "for Y=X̄ this is the stupid filtration of the overconvergent de Rham complex"; line 17 (scope).

**Claim.** The scope paragraph at line 17 says ColemanIntegration §L3.Fb.1 owns the modified syntomic theory and now says §2.2 owns the tube-filtered variant "in the Besser and Huber–Kings presentations". The ingredient shared by both is the stupid-filtered overconvergent de Rham complex on strict neighbourhoods of the tube of X_k in X̄_K.

**Witness.** ColemanIntegration (an open roadmap earlier in the merge order, read at its head with the roadmaps tool) §L3.Fb.1 defines, for smooth affine X with a projective X̄ and U_λ={|h_i|>λ}, Ω•(U)=colim_λ Γ(U_λ,Ω•) computing H*_rig(X_κ/K) (BDJ Proposition 4.2) and F^nΩ^j=Ω^j for j≥n, 0 otherwise, as the filtered term of its fixed-Frobenius cone. That is the Y=X̄, I=0 case of Fil^r_tub here (BesserI Definition 9.1 with Y=X̄), restricted to affine X. The two roadmaps then diverge: ColemanIntegration takes the unramified single cone with a Frobenius lift and its direct limit over Frobenius iterations; §2.2 keeps the two-component K0/K fibre, general (X̄,Y) with the I-adic filtration, and no Frobenius lift.

**Repair.** At the clause "for Y=X̄ this is the stupid filtration of the overconvergent de Rham complex", cite ColemanIntegration §L3.Fb.1 for that complex (its Ω•(U) with F^n, for affine X and projective X̄) and say in one clause how Fil^r_tub extends it (general closed embedding X̄⊂Y, filtration by powers of the ideal of X̄_K, any smooth separated X of finite type, no Frobenius lift). Add ColemanIntegration §L3.Fb.1 to the §2.2 *Needs:* line. No construction moves.

## Previous findings

The previous report (head c9807db) recorded no finding (0 P1, 0 P2, 0 P3), so there is nothing to account for under R01, R02, …. The change set is not a repair of an AI finding; it answers the consumer PadicHodgeRegulators (at its open head), which asks at its README lines 90, 259 and 268 for the fixed fibre coordinates, the coordinate isomorphism to the Huber–Kings order, the tube-filtered variant and κ_n.

## Verified sound

### Gate, dependency check, elaboration

The worker's gate at 212f91b: every text scanner 0 (`set_option`, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, metadata, stray-files, dirty, outside-folder, source-material), `depcheck=0`, `build=2 FAIL` (R01). Independently ran the prescribed dependency check with `--movable` against the board merge order and the main content tree:

```text
depcheck: 239 roadmaps, 2359 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Independently elaborated `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean` with `lake env lean` from the pinned worktree (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the pins of the head's `lake-manifest.json`, which now agree with main's): exit 0, no error, no warning. The file is unchanged since the previous two reviews: one `import Mathlib`, the module docstring naming the eleven headline groups as not statable at the pins, the namespace, and zero declarations; hence zero signatures to compare and zero sorried statements to probe for padding. The `module`-prepended scratch copy (R01) also elaborates: exit 0.

`git diff --stat origin/main...HEAD` outside the roadmap folder is empty at the true merge base (origin/main = eaf17b10 = the merge base, after the pull request's merge commit fb47c48e); the long file list in the worker's change summary is the artefact of a diff against an older base, not an edit of the pull request. The 34 contract slugs of the README's `## Exact supplier contracts` equal the 34 `gaps` slugs of `packages/CohomologyComparisonsPartII/design/plan.json` (checked by script, no slug missing in either direction); the diff touches no contract.

### The changed passages, line by line

| README line | Change | What was checked |
|---|---|---|
| 17 (scope) | §2.2 owns the fibre coordinates, the tube-filtered variant and the comparison map; Chern-class compatibility is regulator content | Consistent with PadicHodgeRegulators head line 96, which keeps "the compatibility of κ_n with syntomic Chern classes (§4.1)" as its own target. Ownership of the shared Y=X̄ ingredient: R05. |
| 353 (§2.2) | component order A⊕F^r→A⊕C, sign bc(a)−sp_r(b), Huber–Kings order (b,a)↦(sp_r(b)−bc(a),(1−p^(−r)φ)a) into C⊕A, coordinate change (a,b;u,v)↦(b,a;−v,u) | BesserI line 741–743 gives the order (locator: R03). HuberKings Definition 2.2.1, line 556–559: source Filⁿ_{X†}Ω*(]X_k[_P)⊕Ω*(]X_k[_{P0}), target Ω*(]X_k[_P)⊕Ω*(]X_k[_{P0}), map (a,b)↦(a−b,(1−Φ*/pⁿ)b); with HK's a = our b (filtered, over K) and HK's b = our a (over K0, mapped by bc into the K-term) this is exactly the displayed formula into C⊕A. Chain-map check: row C01; projections and connecting map: C02; the swap without the sign is not a chain map: C03. |
| 355 (§2.2) | Fil^r_tub, RΓ̃_rsyn, κ_r, equivalence for proper X, hypotheses | BesserI Definition 9.1 (line 1109–1115): compactification X̄ over V, X̄⊂Y with Y smooth near X̄, I the ideal of X̄_K in ]X̄_k[_Y, limit over strict neighbourhoods of ]X_k[ in ]X̄_k[_Y, Fil = Iⁿ→I^(n−1)Ω¹→…, I^k=(1) for k≤0: matches the README's F^r_IΩ• clause for clause. Definition 9.3 (line 1131–1134) replaces the filtered de Rham term by the filtered rigid term; Proposition 9.5 (line 1141–1145) gives the functorial map RΓ_syn→RΓ̃_syn (κ_r), which Besser states as a map only; the equivalence for proper X is this roadmap's own target with its own route (proper GAGA, RigidAnalyticGeometry §8.4 on main), rows C06–C07. "The Huber–Kings identification assumes V finite over ℤ_p and X affine": HuberKings line 413 ("R a discrete valuation ring finite over Z_p") and §2.2 opening line 536–540 (affine †-spaces). Missing choice clause for X̄: R04. |
| 357–360 (API bullets) | independence of (X̄,Y), functoriality; κ_r compatibilities; proper case; Huber–Kings morphisms and the weak-completion identification | Independence: BesserI line 1116–1119 (smooth change of Y, proper change of X̄) and HuberKings Proposition 2.1.6 (line 495–499, filtered Poincaré lemma for smooth u:P′→P) and 2.1.7 (line 532–535, dagger forms compute rigid cohomology). Huber–Kings morphisms of syntomic data induce quasi-isomorphisms: Remark 2.2.2, line 563–565. The weak-completion identification: Proposition 2.2.7, line 605–611, which identifies the Huber–Kings complex with Besser's Definition 9.3 through Proposition 2.1.7 and says the definitions otherwise agree; the coordinate change supplies the component order, row C01. |
| 362 (route) | Poincaré lemma, proper morphisms of compactifications, dagger forms as forms on strict neighbourhoods, proper GAGA on the stupid filtration | Locators as above (R03 for the BesserI lines). For proper X with X̄=Y=X: I=0, the tube of X_k in X_K^an is all of X_K^an since every point of a proper V-scheme's generic fibre specialises, the only strict neighbourhood is X_K^an itself, and GAGA on each coherent Ω^j with the finite stupid filtration gives RΓ(X_K,Ω^(≥r))≃RΓ(X_K^an,Ω^(≥r)); row C06. |
| 364 (*Needs:*) | adds contract `rigid-realizations`, AdicSpacesPartIV §§F1.5,F1.7, RigidAnalyticGeometry §8.4 | Resolved on main: AdicSpacesPartIV `### F1.5 weak completions and algebras of Monsky–Washnitzer type` (its README line 3766) and `### F1.7 dagger spaces, coherent modules and strict neighbourhoods` (line 4238); RigidAnalyticGeometry `### 8.4 Proper GAGA` (line 762); EnhancedDerivedSheaves §§0.1–0.4 (lines 429–492). `rigid-realizations` is this roadmap's own contract (README line 112). All earlier in supply (depcheck 0 problems). R05 adds ColemanIntegration §L3.Fb.1. |
| 371 (Check, Spec V) | both filtered terms K for r≤0, 0 for r>0, κ_r the identity | Row C04; HuberKings Example 2.2.4 (line 573–577) computes the same point values (I=0, Ω^(≥n)(X†)=0 for n>0, Ω⁰=K). |
| 373 (Check, A¹_V, r=1) | F¹RΓ_dR(A¹_K) acyclic, H¹_rsyn(A¹_V,1)=K, tube term H¹=K⟨x⟩†dx, κ_1 not an equivalence | Row C05. |
| 374 (Check, Spec ℤ_p, r=2) | H¹ as a quotient, detector v−u/(1−p^(−2)), Huber–Kings C-element ↦ (0,−c), value −c | Rows C02–C03; agreement with the consumer's η: row C08. |
| 397 (Examples) | A¹_V in weight one | Matches the Check at line 373. |
| 937 (consumers) | fixed coordinates, tube-filtered variant, comparison map, boundary rescaling | PadicHodgeRegulators head lines 90, 259–277: same fibre map and order, same coordinate isomorphism (a,b;u,v)↦(b,a;−v,u), same statements on κ_n (identity at Spec R, equivalence for proper X, no equivalence on general affine X, Huber–Kings identification for R finite over ℤ_p and X affine), same η-sign convention (row C08). No drift across the supply edge. |
| 945, 947 (references) | BesserI entry extended; HuberKings entry added | HuberKings entry's two facts (base finite over ℤ_p; filtered term first) verified at lines 413 and 556–559. Line locators: R02, R03. |

### Adversarial pass

Rows A01–A150 of the first report (head 8858e49) and B01–B10 of the previous report (head c9807db) carry forward for every statement the diff leaves untouched: Conventions A01–A07; §1.1–1.6 A08–A38; §2.1 A39–A41, B01; §2.2 A42–A44, B02–B03; §2.3 A45–A48, B04–B05; §3.1–3.3 A49–A60; §3.4 A61–A66, B06–B09; §4.1–4.5 A67–A90, B10; §5.1–5.3 A91–A103, A150; §6.1–6.7 A104–A128; §7.1–7.5 A129–A149. The rows below are the computations for the changed statements, in the fibre coordinates of the Conventions (Fib(f)^q=A^q⊕B^(q−1), d(x,y)=(dx,f(x)−dy), connecting image of y is (0,y)).

| ID / statement | Instance tried | Values on the two sides, or valid versus wrong model | Result / change |
|---|---|---|---|
| C01 §2.2 coordinate change is a chain isomorphism | f(a,b)=((1−p^(−r)φ)a, bc(a)−sp_r(b)) into A⊕C; g(b,a)=(sp_r(b)−bc(a),(1−p^(−r)φ)a) into C⊕A; T(a,b;u,v)=(b,a;−v,u) | T∘d_f(a,b;u,v)=T(da,db;(1−p^(−r)φ)a−du, bc(a)−sp_r(b)−dv)=(db,da; sp_r(b)−bc(a)+dv, (1−p^(−r)φ)a−du); d_g∘T(a,b;u,v)=d_g(b,a;−v,u)=(db,da; g(b,a)−d(−v,u))=(db,da; sp_r(b)−bc(a)+dv, (1−p^(−r)φ)a−du). Equal in every component; T is bijective with inverse (b,a;v′,u′)↦(a,b;u′,−v′) | Chain isomorphism; retain. |
| C02 §2.2 projections and connecting map | element (a,b;u,v) and the connecting image (0,0;u,v) of (u,v)∈(A⊕C)^(q−1) | T keeps a (the A-coordinate) and b (the filtered coordinate) in place; T(0,0;u,v)=(0,0;−v,u): the A-component u is kept, the C-component v is negated | "Preserves the projections to A and to the filtered term and negates the C-component of the connecting map": exact. |
| C03 §2.2 swap without the sign (wrong model) | T′(a,b;u,v)=(b,a;v,u), same f, g | T′∘d_f has third component bc(a)−sp_r(b)−dv; d_g∘T′ has third component sp_r(b)−bc(a)−dv; they differ by 2(bc(a)−sp_r(b)), nonzero whenever bc(a)≠sp_r(b) (at Spec ℤ_p, r=2: a=1, b=0 gives 2≠0) | Not a chain map; the sign in the Check at line 374 is forced. |
| C04 §2.2 Check, X=Spec(V), κ_r | X̄=Y=Spec V, r≤0 and r>0; V=ℤ_p and V=ℤ_p[π] | Algebraic: F^rRΓ_dR(Spec K/K)=K in degree 0 for r≤0 (F^r=F^0), 0 for r>0. Tube: ]Spec k[_{Spec V} is the point Sp K, I=0, F^r_I=Ω^(≥r) of a point: K for r≤0, 0 for r>0. κ_r on filtered terms: K→K the identity, or 0→0; on A and C the identity | Check correct; for r>0 both fibres are [K0→K0⊕K], a↦((1−σ/p^r)a,a). |
| C05 §2.2 Check, X=A¹_V, r=1 | X̄=Y=ℙ¹_V, D=∞; V with K0 arbitrary (σ semilinear on K0) | Algebraic: F¹=RΓ(ℙ¹_K,Ω¹(log∞)); Ω¹_{ℙ¹}(log∞)≃O(−2)⊗O(1)=O(−1), H⁰=H¹=0, so F¹ is acyclic. A=RΓ_rig(A¹_k/K0): H⁰=K0, H¹=0; C likewise over K. Long exact sequence: H¹_rsyn=coker(H⁰(A)→H⁰(A)⊕H⁰(C))=coker(a↦((1−σ/p)a,a)). 1−p^(−1)σ is bijective on K0 with inverse −Σ_{n≥1}p^nσ^(−n) (p-adically convergent; (1−p^(−1)σ)(−Σ_{n≥1}p^nσ^(−n)a)=−Σ_{n≥1}p^nσ^(−n)a+Σ_{m≥0}p^mσ^(−m)a=a), so (u,v)↦v−(1−σ/p)^(−1)u is surjective onto K with kernel the image: H¹_rsyn=K. Tube: strict neighbourhoods of the closed unit disc in ℙ¹_K^an have the discs {|x|≤ρ}, ρ>1, cofinal; Fil¹_tub=colim_ρ Ω¹({|x|≤ρ})=K⟨x⟩†dx in degree 1 with zero differential, so H¹(Fil¹_tub)=K⟨x⟩†dx, infinite-dimensional; H¹(RΓ̃_rsyn) sits in 0→K→H¹(RΓ̃_rsyn)→K⟨x⟩†dx→0 (H¹(A)=H¹(C)=0) | Check correct; κ_1:K→H¹(RΓ̃_rsyn) is not surjective. |
| C06 §2.2 κ_r an equivalence for proper X | X proper smooth over V, X̄=Y=X; X=ℙ¹_V, r=1 | I=0; tube ]X_k[_X=X_K^an (every point of X_K specialises); the only strict neighbourhood is X_K^an; Fil^r_tub=RΓ(X_K^an,Ω^(≥r)); GAGA on each Ω^j and induction over the finite stupid filtration gives RΓ(X_K,Ω^(≥r))≃RΓ(X_K^an,Ω^(≥r)). For ℙ¹_V, r=1: both sides have H¹=H¹(ℙ¹,Ω¹)=K, H⁰=0 | Proof route closes; retain. |
| C07 §2.2 non-example: X_k empty (X=Spec K as a finite-type V-scheme, X̄=Y=Spec V) | r=0 | Algebraic fibre: A=C=0, RΓ_rsyn=F⁰RΓ_dR(Spec K/K)=K (the existing Check at line 372). Tube: ]X_k[=]∅[=∅, and ∅ is a strict neighbourhood of ∅ (∅∪]Spec k[ covers the point), so Fil⁰_tub=0 and RΓ̃_rsyn=0; κ_0:K→0 | Consistent with "No equivalence is asserted for general smooth affine X" (Spec K is affine, not proper); no change. |
| C08 §2.2 Check, Spec ℤ_p, r=2, and the consumer's η | class with A-component c, class with C-component c, in the fixed order; Huber–Kings C-element | H¹=ℚ_p²/⟨((1−p^(−2))a,a)⟩; the detector v−u/(1−p^(−2)) kills ((1−p^(−2))a,a). The Huber–Kings order element (v′,u′)=(c,0)∈C⊕A is T(0,0;u,v) with (−v,u)=(c,0), so (u,v)=(0,−c), detector value −c. PadicHodgeRegulators head line 261 defines η[(u,v)]=(1−σ/pⁿ)^(−1)u−v = minus the detector, and its line 272 Check says the class with C-component c has η-value −c and the detector is −η: the same assignment | Supplier Check and consumer convention agree; retain. |
| C09 §2.2 Fil^r_tub at r≤0 | I^m=(1) for m≤0, any (X̄,Y) | F^r_IΩ• has I^(r−j)Ω^j=Ω^j for every j≥0 when r≤0, so Fil^r_tub=colim_W RΓ(W,j†Ω•)=RΓ_rig(X_k/K) and the forgetful map to C is the identity | Matches F^r=F^0 for r≤0 on the algebraic side (B01); κ_r on filtered terms is then sp_X itself. |
| C10 §2.2 Huber–Kings map in the roadmap's letters | HK (a,b)↦(a−b,(1−Φ*/pⁿ)b) with a∈Filⁿ (over K), b over K0 | a_HK=b (filtered), b_HK=a (A-term): (a_HK−b_HK,(1−Φ/pⁿ)b_HK)=(sp_r(b)−bc(a),(1−p^(−r)φ)a); target Ω*(]X_k[_P)⊕Ω*(]X_k[_{P0})=C⊕A; source Filⁿ⊕Ω*(P0)=F^r⊕A | Line 353's transcription is exact. |
| C11 §2.2 HuberKings point example versus the fixed order | HuberKings Example 2.2.4: Cone(K0→K⊕K0, (1,1−σ/pⁿ))[−1], n>0 | Their K⊕K0 is C⊕A, their map a↦(a,(1−σ/pⁿ)a); through T^(−1) this is the fixed-order map a↦((1−σ/pⁿ)a, a) into A⊕C, the Check at line 370 | Same object; the coordinate change is the only difference. |
| C12 §2.2 Fil^r_tub for Y=X̄ | X affine, X̄ projective with X_k={h_i≠0}, as in ColemanIntegration §L3.Fb.1 | I=0 so F^r_I is the stupid filtration; strict neighbourhoods U_λ={|h_i|>λ} are cofinal, so Fil^r_tub=colim_λ Γ(U_λ,Ω^(≥r))=F^rΩ•(U) of ColemanIntegration (BDJ Proposition 4.2) | Same object in that case: R05 (citation, no change of construction). |
| C13 §17 scope / §4.1 of the consumer | Chern-class compatibility of κ_r | README line 355 and 17 exclude it; PadicHodgeRegulators head lines 96 and 939 state it as their own target | Single owner (the consumer); no change. |

### Library and cross-roadmap checks

The diff adds no Lean declaration and no library citation; the pinned files opened in the first review stand, now at main's pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, which the pull request's manifest adopted in fb47c48e). Cross-roadmap citations in the changed lines, each resolved: AdicSpacesPartIV §§F1.5, F1.7 (main), RigidAnalyticGeometry §8.4 (main), EnhancedDerivedSheaves §§0.1–0.4 (main), the roadmap's own contracts `relative-hodge` and `rigid-realizations` (README lines 92, 112), ColemanIntegration §§L3.Fb.1–L3.Fb.2 (open head, read with the roadmaps tool; line 17 is unchanged), and the consumer PadicHodgeRegulators (open head, lines 90, 96, 259–277, 939). The worker's `roadmaps resolve` listed one lead, "HuberKings §2.2": HuberKings is a source, not a roadmap, so the lead is a false positive (its reference entry is at README line 947); the real defect with it is R02. Ownership of the tube-filtered rigid syntomic fibre and of the coordinate isomorphism: the roadmaps grep for "Huber–Kings" over main and the 466 open heads hits only this roadmap and its consumer PadicHodgeRegulators (which cites §2.2 for both), and the grep for the tube-filtered/weak-completion syntomic complex hits the same two; BorelRegulators (#1461) does not mention syntomic cohomology. The one shared ingredient is the Y=X̄ stupid-filtered overconvergent complex of ColemanIntegration §L3.Fb.1 (R05). Overlaps: the worker's overlap report lists no other pull request changing this roadmap, no dropped id in either direction, and no id only an open revision defines. Ownership against open pull requests whose files the brief does not supply was checked only through the roadmaps tool's grep.

## Not verifiable

- As in the previous reviews, the cited sections of AInfCohomology, CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology and PrismaticCohomologyPartIII are not in the supplied main content tree; the diff adds no new citation of them. ColemanIntegration was read at its open head through the roadmaps tool. BesserII remains settled uncertified and is not used by any changed line.
- The OCR of BesserI Definition 6.1 (line 712–714) and of the map (6.2) (line 733–734) drops the arrows and the formula; the component order was read from the cone description at line 741–743, which is legible, and the sign bc(a)−sp_r(b) from the previous reviews' AM (3.11)–(3.12) convention check.
- Whether Huber–Kings' unspecified cone sign convention agrees with the Conventions' fibre convention is not decidable from their text (Definition 2.2.1 writes Cone(…)[−1] without a sign rule); the README's isomorphism is between the two fibres formed in this roadmap's convention, and the consumer transports every Huber–Kings formula through it with η, so nothing depends on their internal sign.

## Source issues

- none new in the changed passages; the ten source issues of the first report stand.
