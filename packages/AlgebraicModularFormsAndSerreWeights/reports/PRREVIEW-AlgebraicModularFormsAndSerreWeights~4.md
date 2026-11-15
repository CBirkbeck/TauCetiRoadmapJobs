# Review of AlgebraicModularFormsAndSerreWeights (pull request #928 at 364af81)

**Verdict:** needs changes

## R01 (P3) — The gate fails: `letI` in the signature of `deligneSerreEigenvalueLifting`

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/Suggested.lean:80–81` ("`(i : O →+* V) (j : ResidueField O →+* ResidueField V),` `letI : Algebra O V := i.toAlgebra`").

**Claim:** The file states its targets cleanly (gate rule `statement-hygiene`).

**Witness:** Gate at `364af81`: `statement-hygiene=1 … FAIL`, "line 81: P3 `letI` in the signature of theorem `deligneSerreEigenvalueLifting`; repair: use an instance binder or a named instance in the signature".

**Repair:** Bind the algebra structure in the existential and write `algebraMap O V` for `i` (README §5.10 needs no change):

```lean
    ∃ (L : IntermediateField K (AlgebraicClosure K)) (V : ValuationSubring L)
      (_ : Algebra O V) (j : ResidueField O →+* ResidueField V),
      Module.Finite K L ∧ IsDiscreteValuationRing V ∧
      Function.Injective (algebraMap O V) ∧ Function.Injective j ∧
      (∀ x : O, (algebraMap O V x : L) = algebraMap K L (algebraMap O K x)) ∧
      (residue V).comp (algebraMap O V) = j.comp (residue O) ∧
      Ideal.comap (algebraMap O V) (maximalIdeal V) = maximalIdeal O ∧
      ∃ (b : ι → V) (f' : V ⊗[O] M), f' ≠ 0 ∧
        ∀ t, (T t).baseChange V f' = b t • f' ∧ residue V (b t) = j (a t) := by
  sorry
```

Tested on a scratch copy with this replacement: `lake env lean` exits 0, gives seven `sorry` warnings and no error, and the file has no `letI`. `#check @` prints the existential as `∃ L V x j` with `Function.Injective ⇑(algebraMap O ↥V)` and the base change over `↥V`. Main's `SchemeAndStackFoundations/Suggested.lean:406` uses the same binder.

## R02 (P3) — The rewritten dyadic Ext step of §4.7 no longer matches Edixhoven

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1084` ("At `p=2` the comparison … also uses functoriality of Ext along a nonzero `𝔽_p`-linear map `𝔽_p → F` of coefficient fields, as at the end of Edixhoven §8.3").

**Claim:** At the end of §8.3, Edixhoven pushes the extension out along a map of coefficient fields `𝔽_p → F`.

**Witness:** `edixhoven1992`, journal p. 589 (scan p. 28), last sentence before 8.4: for `p = 2`, Ext functoriality and a nonzero morphism `𝔽_D → 𝔽_D^D`; OCR line 1148 drops the scripts. For `F = 𝔽₂` the README's map is the identity.

**Repair:** Put back the morphism to the Cartier dual, and keep the journal locator: "At `p=2` the comparison with the prescribed extension shape also uses functoriality of Ext along a nonzero morphism `𝔽_D → 𝔽_D^D` from the constant `F`-scheme to its Cartier dual over `D` (for `F=𝔽₂`, the map `ℤ/2 → μ₂` sending `1` to `−1`, an isomorphism on generic fibres), as at the end of Edixhoven §8.3."

## R03 (P3) — Two Layer 2 targets need Layer 3 targets

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:290` ("*Needs:* §2.1 …; §3.6 Ordinary weight congruences; …"), `:469` ("*Needs:* §2.10 …; §3.1 The elliptic Hasse invariant; …"), `:97` ("The strong q-expansion consequence in Layer 2 is proved after the ordinary weight congruences of Layer 3").

**Claim:** The layers are in build order (`:97` "The seven layers are in build order").

**Witness:** §2.2 needs §3.6 and §2.11 needs §3.1; §§3.9, 3.10 need §2.11; Layer 3 depends on Layers 1–2: coarse cycle Layer 2 → 3 → 2. §3.1 needs only §§1.1, 1.4, §R07.2.21; §3.6 only §3.1, ModularCurvesPartII §11.1.

**Repair:** Move §3.1 and §3.6 to the end of Layer 1 as §1.8 and §1.9. Their *Needs:* lines name only §§1.1, 1.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.21 (for §3.1), and §3.1 and ModularCurvesPartII §11.1 (for §3.6). The previous review proposed moving §2.2 instead. That leaves a gap in Layer 2 and renumbers §2.9 and §§2.12, 2.16, which GL2ModularityLiftingPartII, AutomorphyLiftingBeyondTaylorWiles and NoncongruenceModularForms cite; this repair keeps Layer 2's numbering. Renumber Layer 3 (§§3.2–3.5 → 3.1–3.4, §§3.7–3.14 → 3.5–3.12) and add one sentence giving this old → new numbering, because AdmissiblePairsAndPadicHodgeStructures cites §3.5 and GL2ModularityLiftingPartII cites §§3.1–3.4, 3.8, 3.12. Then update `:97` and the Dependencies of Layers 1–3. Re-raised from the previous review (its R01): not repaired.

## R04 (P3) — The description's dependency paragraph leaves out suppliers the README cites

**Location:** Pull request description, "By section, the README uses: ComplexComparisonPartII C0.4, C1.7–C1.8, C2.1–C2.2; … ModularCurvesPartII §§2.6–2.7, … 11.1. SchemeAndStackFoundations, ModularForms and EllipticCurves are on main."

**Claim:** The paragraph lists the sections the README uses.

**Witness:** README `:84`, `:1591`, `:1651` cite AutomorphicFormsOnReductiveGroups §§5.8, 7.3 (named in the depends-on block, absent here). `:75`, `:82`, `:238` cite ComplexComparisonPartII C−1.2, C1.9, C5.6, C6.3–C6.6. `:1094`, `:86`, `:82` cite ModularCurves, JacobianChallenge and EtaleCohomologyFoundations, all on main.

**Repair:** "By section, the README uses: ComplexComparisonPartII §§C−1.2, C0.4, C1.7–C1.9, C2.1–C2.2, C5.6, C6.3–C6.6; AbelianSchemesAndArithmeticModuli §A4.3; ArithmeticGaloisRepresentations Layers 1–5; AutomorphicFormsOnReductiveGroups §§5.8, 7.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.3, R07.5; ModularCurvesPartII §§2.6–2.7, 3.1–3.2, 3.7, 3.9, 4.1–4.4, 5.21, 7.1–7.1a, 9.1–9.3, 9.9–9.11, 11.1, 14.1–14.4a, 14.11. SchemeAndStackFoundations, ModularForms, ModularCurves, EllipticCurves, EtaleCohomologyFoundations and JacobianChallenge are on main; ArithmeticDirichletSeries and Chebotarev are completed."

## Previous findings

- R01 — not repaired: `:290` "*Needs:* … §3.6 Ordinary weight congruences; …" and `:469` "… §3.1 The elliptic Hasse invariant; …" are unchanged, and `:97` still proves the strong consequence "after the ordinary weight congruences of Layer 3". Raised again as R03.
- R02 — repaired: `:1559` and `:1589` now read `ArisesFrom(f,p,ρ̄)`; the `:1603` bullet reads "arises from itself in this sense: `ArisesFrom(f,p,ρ̄)` holds for its residual attachment"; the `:1605` bullet reads "S-type is invariant under extension of the finite coefficient field".
- R03 — repaired as asked, but the request was wrong: `:1084` now reads "functoriality of Ext along a nonzero `𝔽_p`-linear map `𝔽_p → F`". The scan at p. 589 shows `𝔽_D → 𝔽_D^D`, the wording the README had before. Raised as R02.
- R04 — repaired: the four "Imperial College London FLT project" clauses (`:368`, `:382`, `:1356`, `:1587`) are gone; `grep -c Imperial` on the README gives 0.

## Verified sound

| Statement (README line) | Instances and computed values | Claim or competing model | Result |
| --- | --- | --- | --- |
| §4.7 dyadic Ext step (1084), changed | `p=2`, `F=𝔽₂`, `D=W(𝔽̄₂)`: `𝔽_D=ℤ/2`, `𝔽_D^D=μ₂`; `1↦−1` is nonzero (`−1≠1` in `D`), zero on the special fibre, generically an isomorphism | Source: `𝔽_D→𝔽_D^D`; README now: `𝔽_p→F`, the identity for `F=𝔽₂` | Fails: R02 |
| §4.7 peu/très equivalence (1084), cited by the changed clause | `K=ℚ₂^nr`: `[−1]≠1` in `D*/D*²` (`i∉K`), `v=0`: peu; `[2]`: `v=1`: très; equivalence for every `p` | Prop. 8.2, journal p. 588; the proof's (4)⇒(2) uses the maximal prolongation | Matches; the previous review's "Ext step along `𝔽_p→F`" row is withdrawn |
| §7.5 arises-from bullet (1603), changed | 11a1, `p=3`: `#E(𝔽₂)=5`, `a₂=−2≡1`, `det=2`, `φ:ℤ→𝔽₃`; `47.1.b.a`, `p=11`: `a²+a−1=0` has roots 3, 7 mod 11, giving two attachments | `ArisesFrom(f,p,ρ̄)` for the attachment at the chosen place | Matches |
| §7.5 S-type invariance bullet (1605), changed | `ψ:G_ℚ→𝔽₉ˣ` of order 8 via `(ℤ/17)ˣ`: `𝔽₉` as an `𝔽₃`-plane is irreducible, but over `𝔽₉` it splits as `ψ⊕ψ³`; for `E[3]` of 11a1, `det ρ̄(c)=−1` over `𝔽₃` and over `𝔽₉` | Plain irreducibility is not invariant; absolute irreducibility and oddness are | Matches |
| §7.5 integral-model reading (1589), notation changed | `((1,1),(0,1))` against the trivial representation over `𝔽₃`: trace 2 and det 1 at every Frobenius | Only the semisimplification is identified | Matches |
| §7.4 comparison with `ArisesFrom(f,p,ρ̄)` (1559), notation changed | 11a1 at 3: `X²−X+2`; trivial: `(X−1)²=X²+X+1` in `𝔽₃[X]` | Witness distinguishes the two | Matches |
| §2.7 coefficient realization (368), deletion only | `Δ`, `ι:ℤ→ℂ`: `b=(0,1,−24,252,…)`; `b₁=1/2` over `ℤ[1/2]` realizes `Δ/2` only | Unique realizing form by q-expansion injectivity | Matches |
| §2.8 cusp lattice (382), deletion only | `λ∣11`, `Δ/11`: `a₁=1/11∉O`, `11·(Δ/11)∈L_q`; `U_ℓ:a_n↦a_{ℓn}` keeps integrality | Finite free, spanning, Hecke-stable (DS Prop. 2.7) | Matches |
| §5.15 weight one to two at 3 (1356), deletion only | `6σ₀^χ(n)`, `n=1..4`: `6, 0, 6, 6`; series `≡1 mod 3`; `χ₋₃(2)=−1≡2` | `χ₋₃(ℓ)≡ℓ mod 3` | Matches |
| `deligneSerreEigenvalueLifting` (Lean 75), R01 | `T=((0,ϖ),(1,0))`: residual eigenvalue 0 on `e₂`; `L=K(√ϖ)`, `V=O_L`, inclusion `O→V`, `f′=(√ϖ,1)`, `b=√ϖ`, `residue b=0` | The same witness satisfies the `letI` form and the `∃ (_ : Algebra O V)` form | Matches both |
| Layer order (97, 290, 469), R03 | forward edges `§2.2→§3.6`, `§2.11→§3.1`; §3.1 needs §§1.1, 1.4; §3.6 needs §3.1, ModularCurvesPartII §11.1; no Layer 1 target needs Layer 3 | As §§1.8–1.9 both edges point back; Layer 2 ids unchanged | R03 |

The rows for untouched statements stand as in the previous review, of `7e28cb1`, except that the §4.7 row above replaces its "Ext step along `𝔽_p → F`".

- **Gate.** `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=1 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL` (R01). Dependency check: `depcheck: 245 roadmaps, 2218 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/Suggested.lean`: exit 0, seven `declaration uses 'sorry'` warnings (lines 51, 75, 102, 131, 143, 156, 187), nothing else. `Suggested.lean` is unchanged since `7e28cb1` (`git diff` touches only the README). A scratch file with `#check @` for all seven declarations elaborated, and each type keeps the hypotheses its README statement names (`2 ≤ k`, `1 ≤ k`, `f ≠ 0`, `[NumberField K]`, `ℓ ∈ v.asIdeal`, `q ≠ ℓ`, `q ≠ p`, `[Finite κ] [CharP κ p]`, `RingHom.ker red = maximalIdeal O`, the DVR and finite-free binders). Nothing changed.
- **Sources checked (changed passages).** `edixhoven1992` journal pp. 588–590 (scan pp. 27–29: Prop. 8.2, Lemma 8.3, end of §8.3 read from the page image, (8.4.3), (8.5.1), Prop. 8.6); `deligne-serre` lines 78–92, 197–220, 288–290, 505–515, 546–575 (§1.5 pp. 508–509, §§2.6–2.7 p. 512, §4.5 p. 514, Thm 6.1 p. 520, Thm 6.7 pp. 521–522, §6.10 p. 522); Khare–Wintenberger preprint lines 42–82 (§1, p. 2: S-type, "arises from"). Sampled targets in changed passages: 2.8, 4.7, 7.5. All supported except the 4.7 clause (R02).
- **Pull request text.** Title and summary block agree with the head: the `PowerSeries.expand` reuse is in §3.4, Serre's classical weights over Edixhoven's in §7.6, and the consumers in `## Downstream consumers`. The validation sentence is true (build, identifiers, labels). The only defect is the dependency paragraph (R04).
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the roadmap folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Overlap check:** read SerreWeightAndLevelOptimisation, ClassicalSerreModularity, EllipticCurveModularity, AutomorphicGaloisRepresentations, GL2ModularityLiftingPartII (open) and ModularForms (main); nothing shared. Each open one cites this roadmap as owner (ClassicalSerreModularity README:103, GL2ModularityLiftingPartII README:11, AutomorphicGaloisRepresentations README:19). ModularForms is a supplier. No open pull request changes this roadmap or drops an id it cites.
- **Source independence:** changed passages only: 5 passages compared with 3 sources (`edixhoven1992` p. 589, Khare–Wintenberger p. 2, `deligne-serre` pp. 512, 521–522); none shared beyond the forced "functoriality of Ext". Largest share Katz 1973, 29 of 155 linked locators. Contents not compared again: no layer was added, removed or reordered.
- **Remarks on untouched text (no change asked).** §1.4 (`:222`) needs §2.3, and §3.3 (`:659`) needs §7.3 for its representation consequence: two further forward cross-layer edges. The §2.8 locator "Deligne–Serre 2.6–2.7, printed pp.511–512" covers material that is all on p. 512.

## Not verifiable

- Edixhoven's author-DVI page numbers (pp. 26–28 of the DVI): only the journal scan is cached; journal pp. 588–590 were checked.
- Items in the previous review's list (Diamond–Shurman 5.8.5 and the rest) lie outside the changed passages and were not re-read.

## Source issues

- none

## For the human reviewers

- none
