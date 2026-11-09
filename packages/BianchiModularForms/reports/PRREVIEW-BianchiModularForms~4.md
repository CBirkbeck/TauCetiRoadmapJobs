# Review of BianchiModularForms (pull request #1719 at 3ffc099)

**Verdict:** needs changes

Incremental re-review of the 8 lines changed in §9.5 since 916795e. The change is correct (details under Verified sound). Two P3 findings of the previous review are unrepaired and are raised again below; the other two are withdrawn with the evidence under Previous findings. Nothing blocks: both findings are locator and style repairs.

## R01 (P3) — The fundamental-domain locators are whole-paper ranges

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:412` and `:2273`: "(Swan, geometric construction, pp.1–77)" and "(Swan, pp.1–77, geometric fundamental-domain construction)".

**Claim:** Swan locates the finite-sidedness bound `B_K`, the fundamental-region property of the folded region, and the face lists for `d = 19, 43, 67, 163`.

**Witness:** The reference entry (`README.md:2444`) gives the article's extent as Adv. Math. 6 (1971), 1–77, so "pp.1–77" is the whole paper, not a claim-level locator. Swan is paywalled (DOI prefix 10.1016; the publisher's page refuses the fetch), so the locator cannot be checked and must stand on its own. Unchanged since the previous review.

**Repair:** Cite Swan by section and numbered result for the finiteness bound and for the domain construction, marking the citation uncertified, and cite the four non-Euclidean face lists to a text that tabulates them or keep them as Checks only (the lists themselves are correct: the previous review's direct maximisation gives face-carrying `|c|²` exactly `{1, 4}`, `{1, 4, 9}`, `{1, 4, 9, 16, 23}`, `{1, 4, 9, 16, 25, 36, …}` for `d = 19, 43, 67, 163`). For the five Euclidean fields Cremona 1984 §2 (Compositio, open) already carries the lists and is cited at `README.md:2447`.

## R02 (P3) — Two style slips

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:593`: "use k for the cohomological parameter and m for the analytic parameter"; `README.md:1317`: the `*Needs:*` line of §5.1 precedes its API bullets (1320–1321) and Checks (1323–1327).

**Claim:** House shape: prose sentences, and each target ends with its `*Needs:*` line.

**Witness:** Line 593 starts a sentence in lower case after the full stop at the end of line 592; §5.1 is the only target of the README whose `*Needs:*` line is not last (every other target, including the changed §9.5, ends with it). Unchanged since the previous review.

**Repair:** Capitalise "Use" at line 593, and move §5.1's `*Needs:*` line after its Checks.

## Previous findings

- R01 — not repaired: `README.md:1921` still reads "Lemma 11.6(b), p.205 of the IAS electronic transcription". No repair is needed and it is not raised again: the finding was mistaken. The IAS copy `book-ps.pdf` at publications.ias.edu (212 PDF pages) carries the running head "Base change 205" on the page that states Lemma 11.6 (its extraction, lines 7489 and 7503); the previous review read a different 153-page IAS copy whose pagination puts the lemma on page 142. Lemma 11.6(b) is the cyclic-prime-degree fibre statement the README cites it for. An author who wants a copy-independent locator may drop the page and keep "§11, Lemma 11.6(b)".
- R02 — not repaired: `README.md:412` and `:2273` still cite "(Swan, … pp.1–77)". Raised again as R01 above.
- R03 — not repaired: `README.md:2471–2472` cites Casselman by journal, volume, year, pages, Theorem 1 p.302 and Corollary p.306, with no URL. Withdrawn: that is a complete, legal claim-level locator; the README cites no copy, so there is nothing in the folder to repair. For the record, the open digitisation is the Göttingen archive's Mathematische Annalen 201 (record `PPN235181684_0201`, article entry `LOG_0060`, "On Some Results of Atkin and Lehner", 14 pages).
- R04 — not repaired: `README.md:593` still starts "use k for …" and §5.1's `*Needs:*` line is still at `:1317`, before its API bullets and Checks. Raised again as R02 above.

No repair report marks any finding "not actionable in this package".

## Verified sound

I read the 8-line diff of §9.5, the passages that mention it or that it mentions (Scope `README.md:110–112`, the Kleinian-groups supplier contract `:259–267`, §0.3 `:390–437`, §9.4 `:2255–2275`, Layer 9 Examples and Dependencies `:2287–2293`, the references), the Kleinian-groups roadmap at the head of its open pull request (Layers 2, 3, 4 and its acceptance checks), and the previous report; I ran the gate, the dependency check and the elaboration myself. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`; the pull request changes nothing outside it (`git diff --stat origin/main...HEAD` excluding the folder is empty). No other roadmap, on main or at an open head, cites §9.5 or its old heading (the only citers of this roadmap are MaassForms line 172, NumberFieldEnumeration line 739, HilbertModularForms line 199 and ImaginaryQuadraticClassNumber line 199, none by section of Layer 9), so renaming the heading breaks no link.

### The changed passage

The dropped sentence claimed that the Kleinian-groups roadmap's Layer 2 domains for `Γ(2+i)` and `Γ(3+ω)` are tiled by 60, respectively 168, translates of `F_K`. At that roadmap's head its Layer 2 deliverables are "the explicit domains for `Gamma(2 + i)` and `Gamma(3 + omega)`, each a box over a fundamental parallelogram for the translation sublattice": a box over a parallelogram is a fundamental domain of the same volume as any union of 60 (168) translates of the Ford region, but it is not such a union, so the tiling statement was not a fact about the supplier's objects. Dropping it is the right repair; the remaining statement (volume of `F_{ℚ(i)}` and `F_{ℚ(ω)}` equals the supplier's two Bianchi covolumes) is exactly what Layer 4 there states (`covolume_bianchiGaussian`, `covolume_bianchiEisenstein`, deliverables list) and what its acceptance checks 4 and 5 test. The new `*Needs:*` line names Layer 4 only, which is the layer that states the covolumes; the index computations of Layer 3 are no longer used by any target of Layer 9.

Remarks on untouched text, no change requested: the Layer 9 Dependencies line (`:2293`, "KleinianGroups Layers 2–4") and the supplier contract (`:264`, "indices (Layer 3)") still list Layer 3 and its indices, which after the change no target consumes directly (Layer 4's covolumes depend on them, so the transitive dependency is real); the Humbert sentence of §9.5 says "the other seven fields" and is correct as written (nine class-number-one fields minus the two computed).

### Adversarial calculations

Rows for the statements the diff leaves untouched are carried from the previous report (PRREVIEW-BianchiModularForms~3, "Adversarial calculations"), which computed them at 916795e; §9.5 is recomputed here.

| Statement | Instances and values on each side | Result |
|---|---|---|
| 9.5 covolume of `F_{ℚ(i)}` | `vol(F_{ℚ(i)}) = covolume(PSL₂(ℤ[i])) = Catalan/3 = 0.30532`; Humbert `|−4|^{3/2}ζ_{ℚ(i)}(2)/(4π²) = 8·(π²/6)·G/(4π²) = G/3 = 0.30532`; supplier route `20G/60 = G/3`, with `[PSL₂(ℤ[i]) : Γ(2+i)] = #SL₂(𝔽₅)/2 = 120/2 = 60`. | Sound. |
| 9.5 covolume of `F_{ℚ(ω)}` | `√3·L(2,χ₋₃)/8 = 0.169157`; Humbert `3^{3/2}·(π²/6)·L(2,χ₋₃)/(4π²) = 0.169157`; supplier route `21√3L/168 = √3L/8`, with `#SL₂(𝔽₇)/2 = 336/2 = 168`. | Sound. |
| 9.5 against 0.3 (unfolded regions) | `vol(F̃_{ℚ(i)}) = 2·G/3 = 0.61064` (rotation order `w_K/2 = 2`), `vol(F̃_{ℚ(ω)}) = 3·√3L/8 = 0.50747` (order 3): the folded regions, not the unfolded ones, have the supplier's covolumes, as §9.5 says. | Sound; agrees with the §0.3 Checks. |
| 9.5 dropped tiling claim | A box `P × [h, ∞)` over the translation parallelogram versus a union of 60 Ford-region translates: equal volume (`20G` both), different shape; the statement was not about the supplier's object. | Correctly removed. |
| 9.5 "other seven fields" | `9 − 2 = 7`; Humbert for `d = −7`: `7^{3/2}ζ_K(2)/(4π²)`, not computed by either roadmap, stated as a roadmap-for-a-roadmap at the supplier (its Layer 4 text) exactly as §9.5 says. | Sound. |
| 0.1, 0.5, 0.6, 1.3, 3.3, 3.4, 4.7, 5.2, 5.5, 6.6, 7.2–7.5, 9.4 (seeded sample), headline theorems 1.2 and 9.3, `Suggested.lean` definitions | Untouched by the diff; values as computed in the previous report's tables (cusp counts 3/4/3, dimensions `(k−1)²`, Casselman `max(0, r−c+1)`, Atkin–Lehner pairs, period `16π²I(1)/(w_K|d|)`, inert `a_𝔭 = a_p² − 2χ(p)p`, Vogtmann's list, Euclidean floor heights `1/2, 2/3, 3/7, 1/4, 2/11`, non-Euclidean face sets). | Carried. |

### Suppliers, direction and gate

The Kleinian-groups citations of the changed passage resolve at the head of its open pull request: Layer 2 (`isFundamentalDomain_of_facePairing`, the two box domains), Layer 3 (`bianchi`, `isDiscrete_bianchi`, `bianchiGamma`, indices 60 and 168), Layer 4 (`covolume_bianchiGaussian`, `covolume_bianchiEisenstein`, `catalanConstant`, `lchi3`, Humbert's formula named as a non-target). The merge-order candidate lists BianchiModularForms at line 195, directly after ModularityAndLanglandsExtensions (line 194); KleinianGroups and MaassForms are design-stage and not yet in the order.

The dependency check on this head:

```text
depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The gate run with the candidate merge order:

```text
gate BianchiModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Run without the `--order` flag the same gate reports `depcheck: NOT IN ORDER: BianchiModularForms`, because main's merge order does not list the roadmap yet; the brief's rule places it after its last supplier, so this is not a finding.

### Lean acceptance test

`Suggested.lean` is unchanged since the previous review. `lake env lean TauCetiRoadmap/BianchiModularForms/Suggested.lean` from the worktree: exit 0, the only output the two `declaration uses sorry` warnings at lines 140 and 160. The elaborated signatures (`scratch/signatures.md`, ten declarations) are the ones the previous review compared with the README: the four "dropped" `[NumberField K]` binders belong to `cusps`, `cuspidalHom`, `cuspidalH1` and `sl2Image`, whose types do not mention the instance, and both theorems carry `NumberField`, `IsTotallyComplex`, `Fact (finrank ℚ K = 2)` and the nonzero-ideal hypotheses. The previous one-tactic probes (both theorems resist `simp`, `rfl`, `infer_instance`) stand, as nothing in the file changed. Headline inventory unchanged: two headlines stated, the rest named in the module docstring with their missing carriers.

### Sources

| Target | Located text |
|---|---|
| §9.5 covolumes | KleinianGroups Layer 4 at its open head (deliverables and acceptance checks 4–5); values recomputed above. |
| §7.5 Langlands locator (r3 R01) | IAS copy `book-ps.pdf`, 212 PDF pages: Lemma 11.6(a)–(b) at extraction line 7503 under the running head "Base change 205" (line 7489). |
| §5.2 Casselman (r3 R03) | Theorem 1 on printed p.302 and the Corollary to the Proof on p.306 of the Göttingen scan (extraction lines 68 and 261); GDZ record `PPN235181684_0201`, article `LOG_0060`. |

Ownership against open pull requests was checked only for the overlap list (`scratch/overlaps.md`: none change this roadmap, none drop an id it cites, none define an id it cites) and for the Kleinian-groups roadmap; the previous review's by-object search for the Bianchi carriers was not redone.

## Not verifiable

- **Swan 1971** (Adv. Math. 6): the publisher's open-archive page refuses the fetch (HTTP 403) and the DOI prefix is treated as paywalled by the service; the finiteness bound, the domain construction and the face tables were not read (R01).
- **Bianchi 1892, Harder 1987, Weil 1955/1971, Bygott 1998, Lingham 2005, the LMFDB knowls**: as in the previous report; not re-fetched, since the diff touches none of the passages that cite them.

## Source issues

- none
